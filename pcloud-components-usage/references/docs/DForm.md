# DForm 表单组件

基于 Ant Design Form 的增强封装，支持 items 数组配置、内置 30+ 表单控件、多种布局模式和动态表单项管理。

## 基础用法

```tsx
import React from 'react';
import { DForm, DFormProps } from '@pointcloud/pcloud-components';

const items: DFormProps['items'] = [
  { name: 'username', label: '用户名', renderType: 'input', formItemProps: { rules: [{ required: true }] } },
  { name: 'password', label: '密码', renderType: 'password' },
  {
    name: 'sex',
    label: '性别',
    renderType: 'select',
    options: [
      { label: '男', value: '1' },
      { label: '女', value: '2' },
    ],
  },
  { name: 'age', label: '年龄', renderType: 'inputNumber' },
  { name: 'submit', label: '提交', renderType: 'button', htmlType: 'submit', type: 'primary' },
  { name: 'reset', label: '重置', renderType: 'button', htmlType: 'reset' },
];

export default function BasicDemo() {
  return <DForm items={items} />;
}
```

## 布局方式

支持 `horizontal`、`vertical`、`inline`、`inlineVertical`、`grid` 五种布局。

```tsx
import React, { useState } from 'react';
import { Radio } from 'antd';
import { DForm, DFormProps } from '@pointcloud/pcloud-components';

const items: DFormProps['items'] = [
  { name: 'username', label: '用户名', renderType: 'input' },
  { name: 'password', label: '密码', renderType: 'password' },
];

export default function LayoutDemo() {
  const [layout, setLayout] = useState<DFormProps['layout']>('horizontal');

  return (
    <div>
      <Radio.Group value={layout} onChange={(e) => setLayout(e.target.value)}>
        <Radio value="horizontal">水平</Radio>
        <Radio value="vertical">垂直</Radio>
        <Radio value="inline">行内</Radio>
        <Radio value="inlineVertical">行内垂直</Radio>
        <Radio value="grid">栅格布局</Radio>
      </Radio.Group>
      <DForm style={{ marginTop: 16 }} items={items} layout={layout} />
    </div>
  );
}
```

## 动态表单项

通过 ref 的 setItems 方法动态增删表单项。

```tsx
import { useRef } from 'react';
import { DForm, DFormProps, DFormRefProps, DItemProps } from '@pointcloud/pcloud-components';

const items: DFormProps['items'] = [
  { name: 'username', label: '用户名', renderType: 'input' },
  { name: 'submit', label: '提交', renderType: 'button', htmlType: 'submit', type: 'primary' },
];

export default function DynamicItemsDemo() {
  const dFormRef = useRef<DFormRefProps>();

  const addField = () => {
    dFormRef.current?.setItems((list: DItemProps[]) => [
      ...list,
      { name: 'newField', label: '新字段', renderType: 'input' },
    ]);
  };

  return (
    <div>
      <button onClick={addField}>添加字段</button>
      <DForm ref={dFormRef} items={items} />
    </div>
  );
}
```

## API

### DFormProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| items | 表单项数组 | `DItemProps[]` | - |
| defaultItemProps | 统一设置 items 的默认属性 | `DItemProps` | - |
| layout | 布局方式 | `'inline' \| 'horizontal' \| 'vertical' \| 'inlineVertical' \| 'grid'` | `horizontal` |
| children | children 方式添加表单项，如果同时设置了 items，则 children 在 items 下面 | `ReactNode \| ReactNode[]` | - |
| className | 额外的 className | `string` | - |

继承 antd Form 所有属性。

### DItemProps

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| renderType | 渲染类型，见 RenderType 表 | `RenderType` |
| render | 自定义渲染函数，仅 renderType 等于 custom、other 时生效 | `(props, formItemProps, allProps?) => ReactNode` |
| label | 同 antd Form.Item 的 label | `ReactNode` |
| name | 同 antd Form.Item 的 name | `NamePath` |
| formItemProps | Form.Item 其他属性，支持 `shouldUpdate` 条件渲染 | `FormItemProps & { grid?: GridColProps; shouldUpdate?: boolean \| (prev, curr) => boolean }` |
| children | 子元素，用于 custom/other 类型 | `ReactNode` |
| options | select 等选项 | `{ label, value }[]` |

DItemProps 的其他属性根据 renderType 继承 antd 对应组件属性。

### RenderType

| renderType | 渲染组件 | renderType | 渲染组件 |
|-----------|---------|-----------|---------|
| input | Input | dInput | DInput |
| password | Input.Password | textArea | Input.TextArea |
| inputNumber | InputNumber | select | Select |
| dSelect | DSelect | cascader | Cascader |
| dCascader | DCascader | treeSelect | TreeSelect |
| dTreeSelect | DTreeSelect | datePicker | DatePicker |
| dRangePicker | DRangePicker | timePicker | TimePicker |
| rangePicker | DatePicker.RangePicker | checkbox | Checkbox |
| checkboxGroup | Checkbox.Group | radio | Radio |
| radioGroup | Radio.Group | switch | Switch |
| slider | Slider | rate | Rate |
| upload | Upload | dUpload | DUpload |
| transfer | Transfer | mentions | Mentions |
| autoComplete | AutoComplete | ipAddress | IPAddress |
| button | Button | divider | Divider |
| custom | 自定义(无Form.Item) | other | 自定义(有Form.Item) |

### DFormRefProps

| 方法 | 说明 | 参数 |
|-----|-----|-----|
| setItems | 更新内部表单项列表 | `items: DItemProps[] \| (prev: DItemProps[]) => DItemProps[]` |