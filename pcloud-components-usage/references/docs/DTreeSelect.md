# DTreeSelect 增强树选择

基于 Ant Design TreeSelect 的增强封装，支持异步数据加载。

## 基础用法

```tsx
import React, { useState } from 'react';
import { DTreeSelect } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const [treeData, setTreeData] = useState([
    { value: 'zhejiang', label: '浙江', isLeaf: false },
    { value: 'jiangsu', label: '江苏', isLeaf: false },
  ]);

  const loadData = (value) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve([
          { value: 'hangzhou', label: '杭州' },
          { value: 'ningbo', label: '宁波' },
        ]);
      }, 500);
    });
  };

  return (
    <DTreeSelect
      style={{ width: 200 }}
      treeData={treeData}
      loadData={loadData}
      showSearch
      placeholder="选择..."
    />
  );
}
```

## 异步树数据

treeData 支持异步函数。

```tsx
import React from 'react';
import { DTreeSelect } from '@pointcloud/pcloud-components';

export default function AsyncTreeDemo() {
  const loadTreeData = () => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve([
          { value: 'root', label: '根节点', isLeaf: false },
        ]);
      }, 500);
    });
  };

  return <DTreeSelect style={{ width: 200 }} treeData={loadTreeData} />;
}
```

## API

### DTreeSelectProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| treeData | 树形数据，支持异步函数 | `any[] \| () => Promise<any[]>` | - |
| loadData | 动态加载子级列表 | `(value?) => Promise<any[]>` | - |
| onLoadData | 监听 loadData 事件 | `(value?) => void` | - |
| loading | 是否显示加载中 | `boolean \| number` | `600` |

继承 antd TreeSelect 所有属性。