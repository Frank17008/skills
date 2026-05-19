# IPAddress

专门用于输入和展示 IP 地址的组件，支持 IPv4 和 IPv6 两种格式，提供自动聚焦、格式校验和标准化输出等功能。

## 基础用法

```tsx
import React from 'react';
import { IPAddress } from '@pointcloud/pcloud-components';

export default function Demo() {
  return (
    <>
      <IPAddress value="192.168.1.1" style={{ marginBottom: '8px' }}></IPAddress>
      <br />
      <IPAddress value="2001:0000:0000:abcd:0000:0000:0000:0001" type="IPv6"></IPAddress>
    </>
  );
}
```

## 自定义分隔符

```tsx
import React from 'react';
import { IPAddress } from '@pointcloud/pcloud-components';
import { HeartOutlined } from '@ant-design/icons';

export default function Demo() {
  return (
    <>
      <IPAddress value="192.168.1.1" delimiter="*" style={{ marginBottom: '8px' }}></IPAddress>
      <br />
      <IPAddress value="192.168.1.1" delimiter={<HeartOutlined />}></IPAddress>
    </>
  );
}
```

## API

### Props

| 参数名称     | 说明                                                  | 类型                                                  | 默认值                      |
| ---------- | ----------------------------------------------------- | ----------------------------------------------------- | --------------------------- |
| className  | 自定义类名                                            | `string`                                              | -                           |
| style      | 自定义样式                                            | `React.CSSProperties`                                 | -                           |
| value      | 当前 IP 地址值                                        | `string`                                              | -                           |
| type       | IP 地址类型，可选 IPv4 或 IPv6                        | `'IPv4' \| 'IPv6'`                                    | 'IPv4'                      |
| delimiter  | 自定义分隔符元素                                      | `React.ReactNode`                                     | 自动根据类型显示 ':' 或 '·' |
| readOnly   | 是否只读模式                                          | `boolean`                                             | false                       |
| disabled   | 是否禁用状态                                          | `boolean`                                             | false                       |
| size       | 输入框尺寸大小                                        | `'small' \| 'middle' \| 'large'`                     | middle                      |
| autoComplete | 自动聚焦到下一个输入框                              | `boolean`                                             | true                        |
| normalize  | 是否对 IPv6 地址进行标准化输出（前导零省略/零段压缩） | `boolean`                                             | true                        |
| inputProps | 内部 input 元素的额外属性                             | `{ style?: React.CSSProperties; [key: string]: any }` | -                           |
| onChange   | 值变化时的回调函数                                    | `(value: string) => void`                             | -                           |
| onFocus    | 获得焦点时的回调                                      | `(value: string, index: number) => void`              | -                           |
| onBlur     | 失去焦点时的回调                                      | `(value: string, index: number) => void`               | -                           |

## 组件依赖

无
