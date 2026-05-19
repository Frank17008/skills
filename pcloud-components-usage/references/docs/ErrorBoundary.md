# ErrorBoundary

错误边界组件，用于捕获子组件树中的 JavaScript 错误，显示降级 UI，避免整个应用崩溃。

## 基础用法

```tsx
import * as React from 'react';
import { ErrorBoundary } from '@pointcloud/pcloud-components';

const Test = () => {
  const err = '网络开小差了...';
  return <ErrorBoundary err={err} />;
};

export default Test;
```

## API

### ErrorBoundaryProps

| 参数      | 说明         | 类型     | 默认值               |
|---------|------------|--------|--------------------|
| className | 容器样式类名 | `string` | `pui-error-boundary` |
| err       | 错误信息     | `any`    | ——                 |

## 组件依赖

无
