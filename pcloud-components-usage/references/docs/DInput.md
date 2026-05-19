# DInput 增强输入框

基于 Ant Design Input 的增强封装，优化中文输入体验，支持防抖。

## 基础用法

```tsx
import React from 'react';
import { DInput } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const onChange = (value, e) => {
    console.log(value, '事件对象:', e);
  };

  return <DInput onChange={onChange} />;
}
```

## 防抖输入

通过 debounce 属性启用防抖。

```tsx
import React from 'react';
import { DInput } from '@pointcloud/pcloud-components';

export default function DebounceDemo() {
  const onChange = (value) => {
    console.log('防抖输入:', value);
  };

  return <DInput debounce onChange={onChange} placeholder="输入防抖..." />;
}
```

## API

### DInputProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| onChange | 输入变化回调，value 在前，event 在后 | `(value, e) => void` | - |
| enableCompose | 是否启用合成输入，优化中文输入 | `boolean` | `true` |
| debounce | 是否开启防抖，true 表示 800ms，数字表示自定义延迟 | `boolean \| number` | `false` |

继承 antd Input 所有属性。