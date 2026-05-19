# CRUD 组件

基于 DForm 和 DTable 的快速增删改查组件，整合表单搜索、数据展示、新增编辑和删除操作。

## 基础用法

```tsx
import { useMemo } from 'react';
import { CRUD, type CRUDProps } from '@pointcloud/pcloud-components';
import { message } from 'antd';

export default function BasicDemo() {
  const formProps: CRUDProps['searchFormProps'] = {
    items: [
      { name: 'title', label: '标题', renderType: 'input' },
      { name: 'body', label: '内容', renderType: 'input' },
    ],
    layout: 'inline',
  };

  const columns: CRUDProps['tableProps']['columns'] = [
    { dataIndex: 'id', title: 'id', width: 80 },
    { dataIndex: 'userId', title: '用户Id', width: 80 },
    { dataIndex: 'title', title: '标题' },
    { dataIndex: 'body', title: '内容' },
  ];

  const crudApi = useMemo(
    () => ({
      list: async (params: any) => {
        const { current = 1, size = 10, title = '', body = '' } = params;
        const response = await fetch('https://jsonplaceholder.typicode.com/posts');
        const allPosts = await response.json();

        let filteredPosts = [...allPosts];
        if (title) filteredPosts = filteredPosts.filter((post: any) => post.title.toLowerCase().includes(title.toLowerCase()));
        if (body) filteredPosts = filteredPosts.filter((post: any) => post.body.toLowerCase().includes(body.toLowerCase()));

        const total = filteredPosts.length;
        const startIndex = (current - 1) * size;
        const paginatedUsers = filteredPosts.slice(startIndex, startIndex + size);
        const records = paginatedUsers.map((post: any) => ({ id: post.id, userId: post.userId, title: post.title, body: post.body }));

        return { total, records };
      },
      add: async (params: any) => {
        await fetch('https://jsonplaceholder.typicode.com/posts', {
          method: 'POST',
          body: JSON.stringify(params),
          headers: { 'Content-type': 'application/json; charset=UTF-8' },
        });
        message.success('新增成功');
      },
      edit: async (params: any) => {
        await fetch(`https://jsonplaceholder.typicode.com/posts/${params.id}`, {
          method: 'PUT',
          body: JSON.stringify(params),
          headers: { 'Content-type': 'application/json; charset=UTF-8' },
        });
        message.success('编辑成功');
      },
      delete: async (params: any) => {
        await fetch(`https://jsonplaceholder.typicode.com/posts/${params.id}`, { method: 'DELETE' });
        message.success('删除成功');
      },
      detail: async (record: any) => {
        const response = await fetch(`https://jsonplaceholder.typicode.com/posts/${record.id}`);
        return response.json();
      },
    }),
    [],
  );

  return (
    <div style={{ height: 500 }}>
      <CRUD
        searchFormProps={formProps}
        tableProps={{ columns, rowKey: 'id' }}
        modalFormProps={{
          formProps: {
            items: [
              { name: 'title', label: '标题', renderType: 'input' },
              { name: 'body', label: '内容', renderType: 'textArea' },
            ],
          },
          modalProps: { width: 600 },
        }}
        crudApi={crudApi}
      />
    </div>
  );
}
```

## 立即检索

`immediate` 开启时，表单值变化自动触发搜索，自动隐藏搜索/重置按钮。

```tsx
import { useMemo } from 'react';
import { CRUD, type CRUDProps } from '@pointcloud/pcloud-components';

export default function ImmediateDemo() {
  const formProps: CRUDProps['searchFormProps'] = {
    items: [{ name: 'title', label: '标题', renderType: 'input' }],
    immediate: true,
  };

  const columns: CRUDProps['tableProps']['columns'] = [
    { dataIndex: 'id', title: 'ID' },
    { dataIndex: 'title', title: '标题' },
  ];

  const crudApi = {
    list: async (params: any) => ({ total: 0, records: [] }),
    add: async () => {},
    edit: async () => {},
    delete: async () => {},
  };

  return <CRUD searchFormProps={formProps} tableProps={{ columns, rowKey: 'id' }} crudApi={crudApi} />;
}
```

## 刷新策略

可配置新增/编辑/删除后的刷新行为，控制是否保留搜索条件和页码。

```tsx
import { CRUD, type CRUDProps } from '@pointcloud/pcloud-components';
import { useMemo } from 'react';

export default function RefreshDemo() {
  const crudApi = {
    list: async () => ({ total: 0, records: [] }),
    add: async () => {},
    edit: async () => {},
    delete: async () => {},
  };

  return (
    <CRUD
      tableProps={{ columns: [{ dataIndex: 'id', title: 'ID' }], rowKey: 'id' }}
      crudApi={crudApi}
      refreshStrategy={{ keepSearchValues: true, keepPage: false }}
      editRefreshStrategy={{ keepSearchValues: true, keepPage: true }}
    />
  );
}
```

## API

### CRUDProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| className | 自定义类名 | `string` | |
| style | 自定义样式 | `React.CSSProperties` | `{}` |
| searchFormProps | 查询表单配置，支持 `immediate` 属性控制是否立即检索 | `DFormProps & { immediate?: boolean }` | - |
| tableProps | 表格配置 | `DTableProps & { moreActionColumn?: MoreActionColumnRender }` | - |
| modalFormProps | 新增/编辑/详情表单配置 | `{ formProps?: DFormProps; modalProps?: DModalProps }` | - |
| deleteModalProps | 删除确认弹窗配置 | `ModalFuncProps` | - |
| addButtonProps | 新增按钮配置 | `ButtonProps` | - |
| addButtonText | 新增按钮文本 | `string` | `'新增'` |
| showAddButton | 是否显示新增按钮 | `boolean` | `true` |
| showBatchDelete | 是否显示批量删除按钮 | `boolean` | `true` |
| batchDeleteButtonText | 批量删除按钮文本 | `string` | `'批量删除'` |
| batchDeleteButtonProps | 批量删除按钮配置 | `ButtonProps` | - |
| showEdit | 是否显示操作列编辑 | `boolean` | `true` |
| editButtonText | 行编辑按钮文本 | `string` | `'编辑'` |
| editButtonProps | 编辑按钮配置 | `ButtonProps` | - |
| showDelete | 是否显示操作列删除 | `boolean` | `true` |
| deleteButtonText | 删除按钮文本 | `string` | `'删除'` |
| deleteButtonProps | 删除按钮配置 | `ButtonProps` | - |
| showView | 是否显示操作列详情 | `boolean` | `true` |
| viewButtonText | 行查看按钮文本 | `string` | `'查看'` |
| viewButtonProps | 行查看按钮配置 | `ButtonProps` | - |
| actionBar | 自定义操作栏 | `ReactNode` | - |
| onRefresh | 数据刷新回调 | `() => void` | - |
| crudApi | CRUD 操作 API 配置 | `CRUDApi` | 必填 |
| refreshStrategy | 全局刷新策略 | `RefreshStrategy` | `{ keepSearchValues: true, keepPage: false }` |
| addRefreshStrategy | 新增场景刷新策略 | `RefreshStrategy` | `{ keepSearchValues: true, keepPage: false }` |
| editRefreshStrategy | 编辑场景刷新策略 | `RefreshStrategy` | `{ keepSearchValues: true, keepPage: true }` |
| deleteRefreshStrategy | 删除场景刷新策略 | `RefreshStrategy` | `{ keepSearchValues: true, keepPage: true }` |

### CRUDApi

| 参数 | 说明 | 类型 | 是否必须 |
|-----|-----|-----|---------|
| list | 列表请求 api | `(params: any) => Promise<{ total: number; records: any[] }>` | 是 |
| add | 新增数据 api | `(params: any) => Promise<any>` | 是 |
| edit | 编辑数据 api | `(params: any) => Promise<any>` | 是 |
| delete | 删除数据 api | `(params: any) => Promise<any>` | 是 |
| detail | 获取详情 api | `(record: any) => Promise<any>` | 否 |

### RefreshStrategy

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| keepSearchValues | 是否保留检索条件 | `boolean` |
| keepPage | 是否保持当前页码，false 则回到第一页 | `boolean` |

### MoreActionColumnRender

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| text | 单元格文本 | `any` |
| record | 当前行数据 | `T = Record<string, any>` |

### CRUDRefProps

| 方法名 | 说明 | 参数 | 返回值 |
|-------|-----|-----|-------|
| refresh | 刷新表格数据 | `strategy?: RefreshStrategy` | `void` |
| getSelectedRows | 获取选中的数据 | - | `{ selectedRowKeys: string[]; selectedRows: any[] }` |
| getSearchValues | 获取搜索表单值 | - | `Record<string, any>` |
| openAddModal | 打开新增模态框 | `record?: any` | `void` |
| openEditModal | 打开编辑模态框 | `record?: any` | `void` |
| openDeleteModal | 打开删除确认模态框 | `record?: any` | `void` |
| openDetailModal | 打开详情模态框 | `record?: any` | `void` |

## 组件依赖

`DForm` · `DTable` · `DModal` · `ModalForm`