# LoginForm 登录表单

基于 DForm 的登录表单，内置用户名、密码及校验规则。

## 基础用法

```tsx
import { LoginForm } from '@pointcloud/pcloud-components';

export default () => {
  const onFinish = (values: any) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        alert(`登录成功！用户名: ${values.username}`);
        resolve(null);
      }, 1000);
    });
  };

  return (
    <div style={{ maxWidth: 400, margin: '0 auto' }}>
      <LoginForm onFinish={onFinish} />
    </div>
  );
};
```

## 额外表单项

通过 extraItems 添加验证码等额外字段。

```tsx
import { LoginForm } from '@pointcloud/pcloud-components';

export default () => {
  const onFinish = (values) => console.log(values);

  return (
    <div style={{ maxWidth: 400, margin: '0 auto' }}>
      <LoginForm
        onFinish={onFinish}
        extraItems={[
          {
            name: 'captcha',
            label: '验证码',
            renderType: 'input',
            placeholder: '请输入验证码',
          },
        ]}
      />
    </div>
  );
};
```

## API

### LoginFormProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| extraItems | 额外的表单项 | `DItemProps[]` | `[]` |
| onFinish | 点击登录按钮的回调 | `(values) => void \| Promise` | - |
| loginText | 登录按钮文本 | `string` | `'登录'` |
| loginButtonDisabled | 是否禁用登录按钮 | `boolean` | `false` |
| usernameItem | 用户名表单项配置 | `Partial<DItemProps>` | 见默认配置 |
| passwordItem | 密码表单项配置 | `Partial<DItemProps>` | 见默认配置 |
| loginButtonItem | 登录按钮表单项配置 | `Partial<DItemProps>` | 见默认配置 |

继承 DForm 所有属性。