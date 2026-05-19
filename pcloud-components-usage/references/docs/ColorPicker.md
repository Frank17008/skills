# ColorPicker 颜色选择器

基于 react-color 实现，支持多种颜色选择模式（Sketch、PhotoShop、Block 等）。

## 基础用法

```tsx
import { useState } from 'react';
import { ColorPicker } from '@pointcloud/pcloud-components';

export default () => {
  const [color, setColor] = useState('#ff0000');

  return (
    <ColorPicker
      initColor={color}
      onChange={(v) => console.log(v)}
      onConfirm={(v) => setColor(v)}
    />
  );
};
```

## PhotoShop 模式

```tsx
import { useState } from 'react';
import { ColorPicker } from '@pointcloud/pcloud-components';

export default () => {
  const [color, setColor] = useState('#ff0000');

  return (
    <ColorPicker
      initColor={color}
      presetColors={['#F44336', '#E91E63', '#9C27B0']}
      onConfirm={(v) => setColor(v)}
    />
  );
};
```

## API

### 通用属性

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| color | 颜色状态值 | `string \| Hlsa \| Rgba \| undefined` | - |
| onChange | 颜色值变化时触发 | `(v) => void` | - |
| onChangeComplete | 颜色变化完成时触发 | `(v: string) => void` | - |

### Sketch 模式属性

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| initColor | 初始颜色 | `string` | - |
| onCancel | 点击取消时的回调 | `(v) => void` | - |
| onConfirm | 点击确定时的回调 | `(v: string) => void` | - |

### PhotoShop 模式属性

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| initColor | 初始颜色 | `string` | - |
| title | 面板顶部名称 | `string` | `'Color Picker'` |
| onCancel | 点击取消时的回调 | `(v) => void` | - |
| onConfirm | 点击确定时的回调 | `(v: string) => void` | - |

### Rgba

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| r | 红色值 | `number` |
| g | 绿色值 | `number` |
| b | 蓝色值 | `number` |
| a | 透明度 | `number` |

### Hlsa

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| h | 色相值 | `number` |
| s | 饱和度 | `number` |
| l | 亮度值 | `number` |
| a | 透明度 | `number` |

## 组件依赖

`react-color`