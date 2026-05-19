# DSelect 增强下拉选择

基于 Ant Design Select 的增强封装，支持异步加载和防抖搜索。

## 基础用法

```tsx
import React from 'react';
import { DSelect } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const options = [
    { label: '选项1', value: 1 },
    { label: '选项2', value: 2 },
    { label: '选项3', value: 3 },
  ];

  return (
    <DSelect
      style={{ width: 200 }}
      options={() => Promise.resolve(options)}
      showSearch
      onChange={(value) => console.log(value)}
    />
  );
}
```

## 远程搜索

通过 onSearch 实现远程搜索，options 支持异步函数。

```tsx
import React from 'react';
import { DSelect } from '@pointcloud/pcloud-components';

export default function SearchDemo() {
  const remoteSearch = (keyword: string) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        const allOptions = [
          { label: 'Apple', value: 'apple' },
          { label: 'Banana', value: 'banana' },
          { label: 'Orange', value: 'orange' },
        ];
        const filtered = keyword
          ? allOptions.filter((opt) => opt.label.toLowerCase().includes(keyword.toLowerCase()))
          : allOptions;
        resolve(filtered);
      }, 300);
    });
  };

  return (
    <DSelect
      style={{ width: 200 }}
      onSearch={remoteSearch}
      showSearch
      placeholder="搜索..."
    />
  );
}
```

## 防抖加载

通过 debounce 属性启用防抖，避免频繁请求。

```tsx
import React from 'react';
import { DSelect } from '@pointcloud/pcloud-components';

export default function DebounceDemo() {
  const loadOptions = (keyword: string) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve([{ label: `搜索"${keyword}"的结果`, value: keyword }]);
      }, 500);
    });
  };

  return (
    <DSelect
      style={{ width: 200 }}
      onSearch={loadOptions}
      debounce={true}
      placeholder="输入搜索..."
    />
  );
}
```

## API

### DSelectProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| options | 选项数据，支持异步函数 | `DefaultOptionType[] \| (params?) => Promise<DefaultOptionType[]>` | - |
| onSearch | 搜索回调，返回 Promise 格式的选项数据 | `(params?) => Promise<DefaultOptionType[]>` | - |
| loading | 是否显示加载中，传入数字表示延迟(ms) | `boolean \| number` | - |
| debounce | 是否开启防抖，传入数字可自定义延迟(ms) | `boolean \| number` | `false` |

继承 antd Select 所有属性。