# TypewriterText

打字机风格文本展示组件，支持多段文案、随机速度、回删动画、循环播放，以及命令式控制方法。

## 基础用法

```tsx
import { TypewriterText } from '@pointcloud/pcloud-components';

function BasicDemo() {
  return <TypewriterText text="pcloud-components 带来开箱即用的打字机文本体验。" startDelay={200} cursorChar="_" />;
}

export default BasicDemo;
```

## 回删动画

```tsx
import { TypewriterText } from '@pointcloud/pcloud-components';

const statements = ['提供响应式信息流', '按需随机速度输入', '支持字符串与字符串数组输入，可按顺序循环展示多段文案', '每段文案回删重新书写'];

function BackspaceDemo() {
  return (
    <TypewriterText
      text={statements}
      backspace
      loop
      speed={{ min: 30, max: 80 }}
      deleteSpeed={45}
      pauseBeforeDelete={800}
      cursorBlinkSpeed={400}
      style={{ color: '#1677ff' }}
    />
  );
}

export default BackspaceDemo;
```

## 命令式控制

```tsx
import { useRef } from 'react';
import { Button, Space } from 'antd';
import { TypewriterText, type TypewriterTextHandle } from '@pointcloud/pcloud-components';

const releaseNotes = ['v2.6.6 · 组件协议统一', '性能监控埋点增强', '全链路国际化支持'];

function ControlDemo() {
  const typewriterRef = useRef<TypewriterTextHandle | null>(null);

  function handlePause() {
    typewriterRef.current?.pause();
  }

  function handleResume() {
    typewriterRef.current?.resume();
  }

  function handleSkip() {
    typewriterRef.current?.skip();
  }

  function handleReset() {
    typewriterRef.current?.reset();
  }

  return (
    <div>
      <Space size="small">
        <Button onClick={handlePause}>暂停</Button>
        <Button onClick={handleResume}>继续</Button>
        <Button onClick={handleSkip}>下一条</Button>
        <Button type="primary" onClick={handleReset}>
          重置
        </Button>
      </Space>
      <hr />
      <TypewriterText ref={typewriterRef} text={releaseNotes} loop startDelay={400} style={{ marginBottom: 12 }} />
    </div>
  );
}

export default ControlDemo;
```

## API

### TypewriterTextProps

| 参数         | 说明                           | 类型                                      | 默认值    |
|-------------|-------------------------------|-----------------------------------------|---------|
| text        | 展示文案；支持字符串或字符串数组 | `string \| string[]`                   | ——      |
| speed       | 打字速度 (ms) 或随机区间         | `number \| { min: number; max: number }` | `50`    |
| deleteSpeed | 删除速度 (ms)                  | `number`                                | `30`    |
| backspace   | 是否启用回删效果               | `boolean`                               | `false` |
| pauseBeforeDelete | 回删前的停顿时间 (ms)  | `number`                                | `600`   |
| startDelay  | 每段文本开头的延时 (ms)         | `number`                                | `0`     |
| loop        | 是否循环；数字表示循环次数      | `boolean \| number`                     | `false` |
| cursor      | 是否展示光标                   | `boolean`                               | `true`  |
| cursorChar  | 光标字符                       | `string \| ReactNode`                   | `\|`    |
| cursorBlinkSpeed | 光标闪烁节奏 (ms)        | `number`                                | `600`   |
| onStep      | 每次新增字符时触发             | `(index: number, output: string) => void` | ——    |
| onComplete  | 单段文本输入结束时触发          | `() => void`                            | ——      |
| ...rest     | 透传 `HTMLSpanElement` 属性    | ——                                      | ——      |

### TypewriterTextHandle

| 方法  | 说明                       | 类型         |
|------|--------------------------|------------|
| pause  | 暂停动画                   | `() => void` |
| resume | 继续动画                   | `() => void` |
| reset  | 重置到第一段重新播放       | `() => void` |
| skip   | 跳过当前段落直接进入下一段 | `() => void` |

## 组件依赖

无
