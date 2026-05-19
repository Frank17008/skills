# AdvancedFilter 高级搜索

集成关键字搜索和高级筛选面板，基于 DForm 构建。

## 基础用法

```tsx
import React from 'react';
import { AdvancedFilter } from '@pointcloud/pcloud-components';
import type { DItemProps } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const items: DItemProps[] = [
    { name: 'name', label: '名称', renderType: 'input' },
    {
      name: 'status',
      label: '状态',
      renderType: 'select',
      options: [{ label: '启用', value: 1 }, { label: '禁用', value: 0 }],
    },
  ];

  return (
    <AdvancedFilter
      items={items}
      onSearch={(values) => console.log('搜索:', values)}
      onReset={() => console.log('重置')}
    />
  );
}
```

## 自定义两侧内容

```tsx
import React from 'react';
import { AdvancedFilter } from '@pointcloud/pcloud-components';
import { Button } from 'antd';

export default function CustomDemo() {
  return (
    <AdvancedFilter
      items={[{ name: 'name', label: '名称', renderType: 'input' }]}
      left={<div>左侧自定义</div>}
      right={<Button type="primary">自定义操作</Button>}
    />
  );
}
```

## API

### AdvancedFilterProps

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| items | 筛选项配置，继承 DForm 的 DItemProps | `DItemProps[]` |
| onValuesChange | 筛选项值变更时触发 | `(v) => void` |
| onSearch | 点击查询按钮时触发 | `(v) => void` |
| onReset | 点击重置按钮时触发 | `() => void` |
| left | 左侧内容区 | `ReactNode` |
| right | 右侧内容区 | `ReactNode` |
| inputProps | input 框的 props | `InputProps` |
| fRef | 表单引用 | `any` |

### InputProps

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| placeholder | placeholder | `string` |
| name | 字段名 | `string` |
| inputSearch | 回车或点击搜索图标时触发 | `(v) => void` |

fRef 暴露 `resetFields` 和 `form` 方法。