# AuthComponent

权限组件，判断当前用户是否具有某个权限，无权限时显示无权限提示，有权限时显示对应组件。

## 基础用法

```tsx
import { Button } from 'antd';
import { AuthComponent } from '@pointcloud/pcloud-components';

export default () => {
  const authList = [
    {
      code: 'add',
      path: '/add',
    },
    {
      code: 'edit',
      path: '/edit',
    },
    {
      code: 'delete',
      path: '/delete',
    },
  ];
  return (
    <AuthComponent fieldName="code" value="add" authList={authList}>
      <Button>新增</Button>
    </AuthComponent>
  );
};
```

## API

### Props

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| code | 权限唯一标识 | `string` | (required) |
| fieldName | 权限列表中的字段名称 | `string` | (required) |
| value | 权限字段对应的值 | `string \| number \| boolean` | - |
| authList | 数据列表 | `any[]` | (required) |
| noAuthContent | 无权限时显示的内容 | `React.ReactNode` | - |
| children | 有权限时显示的内容 | `React.ReactNode` | - |

## 组件依赖

无
