# Loading 全局加载

全局加载组件，单例模式设计，提供函数式调用。

## 基础用法

```tsx
import { Button } from 'antd';
import { Loading } from '@pointcloud/pcloud-components';

export default () => {
  const onClick = () => {
    Loading.open();
    setTimeout(() => {
      Loading.close();
    }, 1000);
  };

  return <Button onClick={onClick}>提交</Button>;
};
```

## 自定义提示文字

```tsx
import { Button } from 'antd';
import { Loading } from '@pointcloud/pcloud-components';

export default () => {
  const onClick = () => {
    Loading.open({ tip: '加载中...' });
    setTimeout(() => Loading.close(), 2000);
  };

  return <Button onClick={onClick}>加载中</Button>;
};
```

## API

### Loading

| 方法 | 说明 | 参数 |
|-----|-----|-----|
| open | 打开加载框 | `(params?: LoadingInstanceProps) => ILoadingInstance` |
| close | 关闭加载框 | `() => void` |
| getInstance | 获取加载框实例 | `() => ILoadingInstance \| null` |
| useLoading | React Hook | `(initialState?) => { isLoading, openLoading, closeLoading }` |

### LoadingInstanceProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| container | 加载框容器 | `ReactInstance` | `body` |
| delay | 延迟显示毫秒数 | `number` | `0` |
| tip | 加载提示文字 | `string` | - |
| size | 加载图标大小 | `'small' \| 'default' \| 'large'` | `'default'` |
| spinning | 是否为加载中状态 | `boolean` | `true` |
| indicator | 自定义加载指示符 | `ReactNode` | - |