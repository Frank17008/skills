# ConfigProvider

为组件提供统一的全局化配置。

## 基础用法

```tsx
import { ConfigProvider } from '@pointcloud/pcloud-components';
import zhCN from 'antd/locale/zh_CN';

export default () => (
  <ConfigProvider prefixCls="myClassName" locale={zhCN}>
    <App />
  </ConfigProvider>
);
```

## API

### Props

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| prefixCls | 全局样式类名前缀 | `string` | `pui` |
| children | children 节点 | `React.ReactNode` | - |

其他参数完全继承 [Ant Design ConfigProvider](https://4x-ant-design.antgroup.com/components/config-provider-cn/#API)

## 组件依赖

`Ant Design`
