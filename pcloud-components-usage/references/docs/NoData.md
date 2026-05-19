# NoData 空状态

空状态展示组件。

## 基础用法

```tsx
import React from 'react';
import { NoData } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <div style={{ height: 200 }}>
      <NoData />
    </div>
  );
};
```

## 自定义文本和图片

```tsx
import React from 'react';
import { NoData } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <div style={{ height: 200 }}>
      <NoData emptyText="暂无数据" src="/path/to/image.png" />
    </div>
  );
};
```

## API

### NoDataProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| emptyText | 无数据时的文字描述 | `string` | `'暂无结果'` |
| src | 无数据时展示的图片 | `string` | 内置图片 |