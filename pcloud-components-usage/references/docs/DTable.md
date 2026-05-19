# DTable 增强表格组件

基于 Ant Design Table 的增强封装，支持自动分页加载、异步数据处理、统一列配置和操作列。

## 基础用法

```tsx
import React from 'react';
import { DTable, DTableProps } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const columns: DTableProps['columns'] = [
    { dataIndex: 'id', title: 'ID' },
    { dataIndex: 'name', title: '名称' },
    { dataIndex: 'date', title: '时间' },
  ];

  const loadMore = (params: any) => {
    const { current = 1, size = 10 } = params;
    const records = Array.from({ length: size }, (_, i) => ({
      id: (current - 1) * size + i + 1,
      name: '数据' + ((current - 1) * size + i + 1),
      date: '2024-01-01',
    }));
    return Promise.resolve({ total: 50, records });
  };

  return (
    <div style={{ height: 400 }}>
      <DTable style={{ height: '100%' }} columns={columns} loadMore={loadMore} />
    </div>
  );
}
```

## 操作列

通过 actionColumn 在列的最后添加操作列。

```tsx
import React from 'react';
import { Button } from 'antd';
import { DTable, DTableProps } from '@pointcloud/pcloud-components';

export default function ActionColumnDemo() {
  const columns: DTableProps['columns'] = [
    { dataIndex: 'id', title: 'ID' },
    { dataIndex: 'name', title: '名称' },
  ];

  const loadMore = (params: any) => {
    const { current = 1, size = 10 } = params;
    const records = Array.from({ length: size }, (_, i) => ({
      id: (current - 1) * size + i + 1,
      name: '数据' + ((current - 1) * size + i + 1),
    }));
    return Promise.resolve({ total: 50, records });
  };

  return (
    <DTable
      style={{ height: 400 }}
      columns={columns}
      loadMore={loadMore}
      actionColumn={{
        title: '操作',
        render: (text, record) => (
          <>
            <Button type="link" size="small">编辑</Button>
            <Button type="link" size="small" danger>删除</Button>
          </>
        ),
      }}
    />
  );
}
```

## API

### DTableProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| loadMore | 表格数据加载函数 | `(params?: TableParamsProps) => Promise<DTableSourceProps>` | - |
| defaultColumnProps | 表格列的基础默认配置，默认居中、文字超出省略 | `TableColumnType` | `{ align: 'center', ellipsis: true }` |
| actionColumn | 操作列配置 | `TableColumnType \| (text, record) => ReactNode` | - |
| showErrorMsg | 加载失败时显示错误信息 | `boolean \| (err) => string` | `true` |
| extraParams | 额外的请求参数 | `TableParamsProps` | - |
| autoSerialNumber | 首列自动展示序号 | `boolean` | `false` |
| columns | 列配置 | `ColumnsType` | - |

继承 antd Table 所有属性。

### DTableSourceProps

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| records | 表格数据列表 | `object[]` |
| total | 列表总数（用于分页） | `number` |

### TableParamsProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| current | 当前页码 | `number` | `1` |
| size | 分页大小 | `number` | `10` |

### Methods

| 方法名 | 说明 | 类型 |
|-------|-----|-----|
| refresh | 手动刷新表格数据 | `(params?: TableParamsProps) => void` |
| refreshToPage | 刷新到指定页码 | `(page: number) => void` |
| getPaginationState | 获取分页状态 | `() => { current, size, total }` |