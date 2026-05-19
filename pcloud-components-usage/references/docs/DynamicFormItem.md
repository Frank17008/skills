# DynamicFormItem 动态表单项

基于 antd Form.List 的动态表单项，支持动态添加删除。

## 基础用法

```tsx
import React from 'react';
import { Form } from 'antd';
import { DynamicFormItem } from '@pointcloud/pcloud-components';
import type { DItemProps } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const itemConfig: DItemProps = {
    renderType: 'input',
    label: '用户名',
    placeholder: '请输入用户名',
    formItemProps: { rules: [{ required: true, message: '请输入用户名' }] },
  };

  return (
    <Form>
      <DynamicFormItem name="usernames" itemConfig={itemConfig} minItems={1} maxItems={5} />
    </Form>
  );
}
```

## 配置选项

```tsx
import React from 'react';
import { Form } from 'antd';
import { DynamicFormItem } from '@pointcloud/pcloud-components';
import type { DItemProps } from '@pointcloud/pcloud-components';

export default function ConfigDemo() {
  const config: DItemProps = { renderType: 'input', label: '配置项' };

  return (
    <Form>
      {/* 添加按钮在顶部 */}
      <DynamicFormItem name="topItems" itemConfig={config} addPosition="top" addButtonText="添加新项" />

      {/* 限制项数 1-3 */}
      <DynamicFormItem name="limitedItems" itemConfig={config} minItems={1} maxItems={3} />

      {/* 隐藏删除按钮 */}
      <DynamicFormItem name="noRemoveItems" itemConfig={config} showRemove={false} />
    </Form>
  );
}
```

## API

### DynamicFormItemProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| name | 字段名 | `NamePath` | 必填 |
| itemConfig | 表单项配置，基于 DForm 的 DItemProps | `DItemProps \| DItemProps[]` | 必填 |
| initialValue | 初始值 | `any[]` | `[undefined]` |
| addButtonText | 新增按钮文本 | `string` | `'添加'` |
| addButtonProps | 新增按钮属性 | `ButtonProps` | `{}` |
| removeButtonText | 删除按钮文本 | `string` | `'移除'` |
| removeButtonProps | 删除按钮属性 | `ButtonProps` | `{}` |
| minItems | 最小项数 | `number` | `0` |
| maxItems | 最大项数 | `number` | - |
| showAdd | 是否显示添加按钮 | `boolean` | `true` |
| showRemove | 是否显示删除按钮 | `boolean` | `true` |
| addPosition | 添加按钮位置 | `'top' \| 'bottom'` | `'bottom'` |
| addAtHead | 是否添加到头部 | `boolean` | `false` |

组件必须被 antd `Form` 或 `DForm` 包裹。