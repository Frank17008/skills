# IconFont

基于 @ant-design/icons 封装的字体图标组件，支持从 iconfont.cn 平台加载自定义图标，提供全局和局部两种注册方式。

## 基础用法

```tsx
import React from 'react';
import { IconFont } from '@pointcloud/pcloud-components';

// 在项目入口处注册 iconfont 脚本地址
IconFont.setIconfontScriptUrl('//at.alicdn.com/t/c/font_4832904_udb1bykw4ze.js');

const Demo = () => {
  return (
    <IconFont
      type="icon-phone"
      onClick={(e) => {
        console.log(e);
      }}
    />
  );
};

export default Demo;
```

## 局部使用

```tsx
import React from 'react';
import { IconFont } from '@pointcloud/pcloud-components';

const Demo = () => {
  // 通过 scriptUrl 属性指定图标脚本地址
  return <IconFont type="icon-top11" scriptUrl={'//at.alicdn.com/t/c/font_4415087_ldl8rc9i9k.js'} />;
};

export default Demo;
```

## 自定义样式

```tsx
import React from 'react';
import { IconFont } from '@pointcloud/pcloud-components';

const Demo = () => {
  return <IconFont type="icon-liuchengguanli" style={{ fontSize: '24px', color: 'cadetblue' }} />;
};

export default Demo;
```

## API

### IconFontProps

| 参数      | 说明         | 类型                             | 默认值 |
|---------|------------|--------------------------------|------|
| type      | 图标类型     | `string`                         | -      |
| scriptUrl | 图标脚本地址 | `string` \| `string[]`           | -      |
| className | 图标类名     | `string`                         | -      |
| style     | 图标样式     | `CSSProperties`                  | -      |
| onClick   | 点击事件     | `MouseEventHandler<HTMLElement>` | -      |

### Methods

| 方法名               | 说明                 | 参数类型                             |
| -------------------- | -------------------- | ------------------------------------ |
| setIconfontScriptUrl | 设置全局图标脚本地址 | `(urls: string \| string[]) => void` |
| getTwoToneColor      | 获取双色图标颜色     | `() => string`                       |
| setTwoToneColor      | 设置双色图标颜色     | `(color: string) => void`            |

## 组件依赖

`@ant-design/icons`
