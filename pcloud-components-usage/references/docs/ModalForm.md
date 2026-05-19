# ModalForm 表单弹窗

融合弹窗和表单的组合组件，基于 DModal 和 DForm 封装。

## 基础用法

```tsx
import { ModalForm } from '@pointcloud/pcloud-components';
import { Button } from 'antd';
import { useState } from 'react';

export default () => {
  const [open, setOpen] = useState(false);

  const formItems = [
    { name: 'username', label: '用户名', renderType: 'input', formItemProps: { rules: [{ required: true }] } },
    { name: 'password', label: '密码', renderType: 'password' },
  ];

  return (
    <>
      <Button onClick={() => setOpen(true)}>打开弹窗</Button>
      <ModalForm
        formProps={{ items: formItems }}
        modalProps={{
          open,
          title: '表单弹窗',
          onCancel: () => setOpen(false),
          onOk: (values) => {
            console.info(values);
            setOpen(false);
          },
        }}
      />
    </>
  );
};
```

## 回填数据

通过 formProps.values 实现受控的表单值管理。

```tsx
import { ModalForm } from '@pointcloud/pcloud-components';
import { Button } from 'antd';
import { useState } from 'react';

export default () => {
  const [open, setOpen] = useState(false);
  const [values, setValues] = useState({ username: '张三' });

  return (
    <>
      <Button onClick={() => setOpen(true)}>编辑</Button>
      <ModalForm
        formProps={{ items: [{ name: 'username', label: '用户名', renderType: 'input' }], values }}
        modalProps={{ open, title: '编辑', onCancel: () => setOpen(false), onOk: () => setOpen(false) }}
      />
    </>
  );
};
```

## API

### ModalFormProps

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| modalProps | 弹窗属性，支持 DModal 的所有属性 | `DModalProps` |
| formProps | 表单属性，支持 DForm 的所有属性 | `DFormProps` |
| children | 子元素 | `ReactNode` |