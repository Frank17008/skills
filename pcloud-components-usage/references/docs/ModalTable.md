---
title: ModalTable
nav:
  title: 组件
  path: /components
group:
  title: 组合组件
---

# ModalTable 弹窗表格组件

ModalTable 是一个融合了弹窗、表单和表格功能的组合组件，基于 DModal、DForm 和 DTable 封装，提供了一站式的弹窗表格解决方案，支持顶部表单检索，适用于需要弹窗展示数据列表并支持搜索筛选的业务场景。

## 组件特性

- 🔄 一体化解决方案，融合弹窗、表单和表格功能
- 🔍 两种搜索模式，支持即时搜索和提交搜索
- 📊 灵活列配置，支持 DTable 的所有列配置功能
- 🎯 数据选择支持，可配合 rowSelection 实现行选择功能
- 📐 灵活布局支持，搜索表单默认使用 inline 布局
- 🧩 可选搜索表单，通过 showSearchForm 控制搜索表单显示/隐藏
- 🔄 智能重置，重置按钮会清空表单并刷新表格数据

## 即时搜索

<code src="./demos/basicDemo.tsx" title="即时搜索" description="表单值变化时立即请求数据刷新，适用于快速筛选场景"></code>

## 提交搜索

<code src="./demos/submitModeDemo.tsx" title="提交搜索" description="表单提交时请求数据刷新，表单自动补充查询和重置按钮，适用于精确筛选场景"></code>

## 数据选择

<code src="./demos/selectionDemo.tsx" title="数据选择" description="通过 rowSelection 实现多选功能，获取选中行的数据"></code>

## 不显示搜索表单

<code src="./demos/noSearchFormDemo.tsx" title="不显示搜索表单" description="设置 showSearchForm 为 false 隐藏搜索表单，适用于仅展示数据的场景"></code>

## 不显示分页

<code src="./demos/noPaginationDemo.tsx" title="不显示分页" description="设置 pagination={false} 禁用分页，使用 dataSource 展示静态数据"></code>

## API

### ModalTableProps

| 参数           | 说明                                              | 类型                                           | 默认值      |
| -------------- | ------------------------------------------------- | ---------------------------------------------- | ----------- |
| modalProps     | 弹窗属性，支持 DModal 的所有属性                  | [DModalProps](/components/d-modal#dmodalprops) | -           |
| formProps      | 表单属性，支持 DForm 的所有属性                   | [DFormProps](/components/d-form#dformprops)    | -           |
| tableProps     | 表格属性，支持 DTable 的所有属性                  | [DTableProps](/components/d-table#dtableprops) | -           |
| showSearchForm | 是否显示搜索表单                                  | `boolean`                                      | `true`      |
| searchMode     | 搜索模式，`immediate` 即时搜索，`submit` 提交搜索 | `'immediate' \| 'submit'`                      | `immediate` |

### searchMode

- `immediate`：表单值变化时立即触发表格数据刷新，每次输入都会请求，适用于快速筛选场景
- `submit`：表单提交时触发表格数据刷新，需要点击查询按钮才请求，适用于精确筛选场景

### submit 模式默认按钮

`searchMode="submit"` 时，会自动在表单项末尾补充两个按钮：

- **查询按钮**：`htmlType: 'submit'`，点击后触发表格刷新，携带表单值作为查询参数
- **重置按钮**：点击后会清空所有表单字段，并触发表格刷新（回到第一页）

### 表单字段同步

无论是即时搜索还是提交搜索，表单值都会作为参数传递给表格的 `loadMore` 方法，参数会自动包含 `current`（当前页码）和表单字段。
