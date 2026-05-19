# LabelValue 标签值展示

用于详情页信息展示，标签值配对展示。

## 基础用法

```tsx
import React from 'react';
import { LabelValue } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <div>
      <LabelValue label="姓名" value="张三" />
      <LabelValue label="年龄" value="25" />
      <LabelValue label="地址" value="北京市朝阳区" />
    </div>
  );
};
```

## 省略冒号和自定义空值

```tsx
import React from 'react';
import { LabelValue } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <div>
      <LabelValue label="姓名" value="张三" noColon />
      <LabelValue label="备注" value="" emptyValue="无" />
    </div>
  );
};
```

## API

### LabelValueProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| label | 文字标签 | `string \| ReactNode` | - |
| value | 文字标签值 | `string \| ReactNode` | - |
| formatter | 格式化 value 值 | `(v?) => string \| ReactNode` | - |
| emptyValue | 值为空时的显示 | `string \| ReactNode` | `'-'` |
| className | 类名 | `string` | `''` |
| style | 样式 | `CSSProperties` | - |
| noWrap | 是否不换行 | `boolean` | `false` |
| noColon | 是否隐藏冒号 | `boolean` | `false` |