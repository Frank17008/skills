# OrgTree

基于 react-org-tree 的组织架构树组件，用于展示组织层级关系，支持垂直和水平两种布局方式。

## 基础用法

```tsx
import React from 'react';
import { OrgTree } from '@pointcloud/pcloud-components';
import type { OrgTreeNode } from '@pointcloud/pcloud-components';

const BasicDemo = () => {
  const data: OrgTreeNode = {
    id: '1',
    label: '总经理',
    title: '张三',
    children: [
      {
        id: '2',
        label: '技术部',
        title: '李四',
        children: [
          {
            id: '5',
            label: '前端组',
            title: '王五',
            children: [
              { id: '10', label: '前端工程师1', title: '赵六' },
              { id: '11', label: '前端工程师2', title: '钱七' },
            ],
          },
          {
            id: '6',
            label: '后端组',
            title: '孙八',
            children: [
              { id: '12', label: '后端工程师1', title: '周九' },
              { id: '13', label: '后端工程师2', title: '吴十' },
            ],
          },
        ],
      },
      {
        id: '3',
        label: '市场部',
        title: '郑十一',
        children: [
          { id: '7', label: '市场专员1', title: '王十二' },
          { id: '8', label: '市场专员2', title: '李十三' },
        ],
      },
      {
        id: '4',
        label: '人事部',
        title: '张十四',
        children: [{ id: '9', label: '人事专员', title: '赵十五' }],
      },
    ],
  };

  const handleNodeClick = (event: React.MouseEvent, node: OrgTreeNode) => {
    console.log('节点点击:', node, event);
  };

  return (
    <div style={{ height: 500, overflow: 'auto' }}>
      <OrgTree data={data} onClick={handleNodeClick} />
    </div>
  );
};

export default BasicDemo;
```

## 水平布局

```tsx
import { OrgTree } from '@pointcloud/pcloud-components';
import type { OrgTreeNode } from '@pointcloud/pcloud-components';

const HorizontalDemo = () => {
  const data: OrgTreeNode = {
    id: '1',
    label: '总经理',
    title: '张三',
    children: [
      {
        id: '2',
        label: '技术部',
        title: '李四',
        children: [
          {
            id: '5',
            label: '前端组',
            title: '王五',
            children: [
              { id: '10', label: '前端工程师1', title: '赵六' },
              { id: '11', label: '前端工程师2', title: '钱七' },
            ],
          },
          {
            id: '6',
            label: '后端组',
            title: '孙八',
            children: [
              { id: '12', label: '后端工程师1', title: '周九' },
              { id: '13', label: '后端工程师2', title: '吴十' },
            ],
          },
        ],
      },
      {
        id: '3',
        label: '市场部',
        title: '郑十一',
        children: [
          { id: '7', label: '市场专员1', title: '王十二' },
          { id: '8', label: '市场专员2', title: '李十三' },
        ],
      },
      {
        id: '4',
        label: '人事部',
        title: '张十四',
        children: [{ id: '9', label: '人事专员', title: '赵十五' }],
      },
    ],
  };

  return (
    <div style={{ height: 500, overflow: 'auto' }}>
      <OrgTree data={data} horizontal />
    </div>
  );
};

export default HorizontalDemo;
```

## API

### OrgTreeProps

| 参数           | 说明                                                    | 类型                                                   | 默认值 |
| -------------- | ------------------------------------------------------- | ------------------------------------------------------ | ------ |
| data           | 组织树数据                                              | `OrgTreeNode`                            | -      |
| horizontal     | 是否水平布局                                            | `boolean`                                                | false  |
| collapsable    | 是否允许节点折叠，默认为 true，可在单个节点上覆盖此设置 | `boolean`                                                | true   |
| expandAll      | 是否默认展开所有节点                                    | `boolean`                                                | false  |
| labelWidth     | 标签宽度，可以是数字(像素)或字符串                      | `string \| number`                                       | auto   |
| labelClassName | 标签自定义类名，用于自定义标签样式                      | `string`                                                 | -      |
| className      | 自定义类名                                              | `string`                                                 | -      |
| style          | 自定义样式                                              | `React.CSSProperties`                                    | -      |
| renderContent  | 自定义渲染节点内容                                      | `(node: OrgTreeNode) => React.ReactNode` | -      |
| onClick        | 节点点击时触发                                          | `(e: React.MouseEvent, node: OrgTreeNode) => void` | -      |

### OrgTreeNode

| 参数        | 说明           | 类型                          | 默认值 |
| ----------- | -------------- | ----------------------------- | ------ |
| id          | 节点唯一标识   | `string \| number`              | -      |
| label       | 节点显示文本   | `string`                        | -      |
| title       | 节点标题       | `string`                        | -      |
| children    | 子节点         | `OrgTreeNode[]` | -      |
| expand      | 节点是否展开   | `boolean`                       | -      |
| collapsable | 节点是否可折叠 | `boolean`                       | -      |
| className   | 自定义节点类名 | `string`                        | -      |

## 组件依赖

`react-org-tree`
