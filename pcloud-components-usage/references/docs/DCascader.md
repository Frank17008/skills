# DCascader 增强级联选择

基于 Ant Design Cascader 的增强封装，支持异步数据加载。

## 基础用法

```tsx
import React, { useState } from 'react';
import { DCascader } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const [options, setOptions] = useState([
    { value: 'zhejiang', label: '浙江', isLeaf: false },
    { value: 'jiangsu', label: '江苏', isLeaf: false },
  ]);

  const loadData = (value, option) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve([
          { value: 'hangzhou', label: '杭州' },
          { value: 'ningbo', label: '宁波' },
        ]);
      }, 500);
    });
  };

  return <DCascader options={options} loadData={loadData} showSearch />;
}
```

## 异步加载

options 支持异步函数，返回 Promise 格式的选项数据。

```tsx
import React, { useState } from 'react';
import { DCascader } from '@pointcloud/pcloud-components';

export default function AsyncDemo() {
  const loadOptions = () => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve([
          { value: 'beijing', label: '北京' },
          { value: 'shanghai', label: '上海' },
        ]);
      }, 500);
    });
  };

  return <DCascader options={loadOptions} showSearch placeholder="选择..." />;
}
```

## API

### DCascaderProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| options | 选项数据，支持异步函数 | `any[] \| (value?, option?, options?) => Promise<any[]>` | - |
| loadData | 动态加载子级列表 | `(value?, option?, options?) => Promise<any[]>` | - |
| onLoadData | 监听 loadData 事件 | `(value?, option?, options?) => void` | - |
| loading | 是否显示加载中，传入数字表示延迟(ms) | `boolean \| number` | `600` |

继承 antd Cascader 所有属性。