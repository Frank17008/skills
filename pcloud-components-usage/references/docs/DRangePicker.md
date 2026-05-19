# DRangePicker 日期范围选择

基于 Ant Design RangePicker 的增强，支持快捷选项位置自定义。

## 基础用法

```tsx
import { DRangePicker } from '@pointcloud/pcloud-components';
import moment, { type Moment } from 'moment';

export default function BasicDemo() {
  const ranges = {
    今天: [moment(), moment()] as [Moment, Moment],
    本周: [moment().startOf('week'), moment().endOf('week')] as [Moment, Moment],
    本月: [moment().startOf('month'), moment().endOf('month')] as [Moment, Moment],
  };

  return <DRangePicker ranges={ranges} />;
}
```

## 快捷选项位置

通过 rangesPosition 设置快捷选项显示位置。

```tsx
import { DRangePicker } from '@pointcloud/pcloud-components';
import moment, { type Moment } from 'moment';

export default function PositionDemo() {
  const ranges = {
    今天: [moment(), moment()] as [Moment, Moment],
    近30天: [moment().subtract(29, 'days'), moment()] as [Moment, Moment],
  };

  return (
    <>
      <DRangePicker ranges={ranges} rangesPosition="left" />
      <DRangePicker ranges={ranges} rangesPosition="right" />
      <DRangePicker ranges={ranges} rangesPosition="bottom" />
    </>
  );
}
```

## API

### DRangePickerProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| ranges | 快捷日期选项 | `Record<string, [Moment, Moment]>` | - |
| rangesPosition | 快捷选项位置 | `'left' \| 'bottom' \| 'right'` | `'bottom'` |
| popupClassName | 弹出日历的自定义类名 | `string` | - |

继承 antd RangePicker 所有属性。