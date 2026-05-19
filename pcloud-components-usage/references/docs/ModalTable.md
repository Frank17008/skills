# ModalTable 弹窗表格

融合弹窗、表单和表格的组合组件，支持顶部表单检索。

## 基础用法

```tsx
import React, { useState } from 'react';
import { ModalTable } from '@pointcloud/pcloud-components';
import type { DItemProps } from '@pointcloud/pcloud-components';
import { Button } from 'antd';

export default function BasicDemo() {
  const [open, setOpen] = useState(false);

  const columns = [
    { dataIndex: 'id', title: 'ID', width: 80 },
    { dataIndex: 'name', title: '名称' },
    { dataIndex: 'status', title: '状态', render: (v) => (v === 1 ? '启用' : '禁用') },
  ];

  const loadMore = (params) => {
    const { current = 1, size = 10 } = params;
    const records = Array.from({ length: size }, (_, i) => ({
      id: (current - 1) * size + i + 1,
      name: '数据' + ((current - 1) * size + i + 1),
      status: i % 2,
    }));
    return Promise.resolve({ total: 50, records });
  };

  const formItems: DItemProps[] = [
    { name: 'name', label: '名称', renderType: 'input' },
    {
      name: 'status',
      label: '状态',
      renderType: 'select',
      options: [{ label: '启用', value: 1 }, { label: '禁用', value: 0 }],
    },
  ];

  return (
    <>
      <Button onClick={() => setOpen(true)}>打开弹窗</Button>
      <ModalTable
        searchMode="immediate"
        modalProps={{ open, title: '数据列表', onCancel: () => setOpen(false), width: 800 }}
        formProps={{ items: formItems }}
        tableProps={{ columns, loadMore }}
      />
    </>
  );
}
```

## 提交搜索模式

```tsx
// 提交搜索 - 点击查询按钮才请求
<ModalTable
  searchMode="submit"
  formProps={{ items: formItems }}
  tableProps={{ columns, loadMore }}
/>
```

## API

### ModalTableProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| modalProps | 弹窗属性，支持 DModal 的所有属性 | `DModalProps` | - |
| formProps | 表单属性，支持 DForm 的所有属性 | `DFormProps` | - |
| tableProps | 表格属性，支持 DTable 的所有属性 | `DTableProps` | - |
| showSearchForm | 是否显示搜索表单 | `boolean` | `true` |
| searchMode | 搜索模式，`immediate` 即时搜索，`submit` 提交搜索 | `'immediate' \| 'submit'` | `immediate` |

### searchMode

- `immediate`：表单值变化时立即触发表格数据刷新
- `submit`：表单提交时触发表格数据刷新，自动补充查询和重置按钮