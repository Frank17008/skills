# ScrollNumber

数字滚动动画组件，通过滚动数字吸引用户注意力，支持千分位、前后缀、小数位数等灵活配置。

## 基础用法

```tsx
import { ScrollNumber } from '@pointcloud/pcloud-components';

export default () => {
  return <ScrollNumber end={100} />;
};
```

## 千分位分隔符

```tsx
import { ScrollNumber } from '@pointcloud/pcloud-components';

export default () => {
  return <ScrollNumber end={100001} decimals={0} separator={','} />;
};
```

## 自定义前后缀

```tsx
import { ScrollNumber } from '@pointcloud/pcloud-components';

export default () => {
  return <ScrollNumber end={1000} decimal="." prefix="￥" />;
};
```

## API

### ScrollNumberProps

| 参数       | 说明             | 类型                                          | 默认值                   |
|-----------|-----------------|---------------------------------------------|------------------------|
| className | 样式类名         | `string`                                    | ——                     |
| start     | 开始数值         | `number`                                    | 0                      |
| end       | 结束数值         | `number`                                    | ——                     |
| duration  | 动画过渡时间(s)  | `number`                                    | 1位数0.8s；3位数1.5s   |
| delay     | 延迟开始时间(s)   | `number`                                    | 0                      |
| decimals  | 保留小数位数     | `number`                                    | 2                      |
| decimal   | 小数位分隔符     | `string`                                    | `.`                    |
| separator | 千分位分隔符     | `string`                                    | `,`                    |
| suffix    | 数值后缀字符     | `string`                                    | ——                     |
| prefix    | 数值前缀字符     | `string`                                    | ——                     |
| onReset       | 重置函数回调      | `({pauseResume,start,update}) => void`       | ——                       |
| onUpdate      | 更新函数回调      | `({pauseResume,start,reset}) => void`        | ——                       |
| onPauseResume | 暂停/恢复函数回调 | `({update,start,reset}) => void`             | ——                       |
| onStart       | 开始函数回调      | `({pauseResume,reset,update}) => void`       | ——                       |
| onEnd         | 结束函数回调      | `({pauseResume,reset,start,update}) => void` | ——                       |

## 组件依赖

`react-countup`
