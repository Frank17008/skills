# PictureCard

用于展示图片和相关信息的卡片组件，支持单张或多张图片展示，提供图片预览功能和灵活的布局选项。

## 基础用法

```tsx
import { PictureCard } from '@pointcloud/pcloud-components';

export default () => {
  return <PictureCard imageWidth={100} src="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png" />;
};
```

## 图片预览与内容

```tsx
import { PictureCard, LabelValue } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <PictureCard
      preview
      imageWidth={100}
      src="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
      content={
        <div style={{ display: 'flex', flexDirection: 'column', gap: 3 }}>
          <LabelValue label="姓名" value="Aliaf" emptyValue="--" />
          <LabelValue label="年龄" value="18" emptyValue="--" />
          <LabelValue label="性别" value="女" emptyValue="--" />
        </div>
      }
    />
  );
};
```

## API

### Props

| 参数名称   | 说明       | 类型                                      | 默认值     |
| ---------- | ---------- | ----------------------------------------- | ---------- |
| className  | 类名       | `string`                                    |            |
| layout     | 布局方式   | `'vertical' \| 'horizontal'`              | 'vertical' |
| src        | 图片地址   | `ImageProps['src'] \| ImageProps['src'][]` |            |
| imageWidth | 图片宽度   | `ImageProps['width']`                     |            |
| content    | 内容区     | `React.ReactNode`                         |            |
| style      | 自定义样式 | `React.CSSProperties`                     |            |
| hoverable  | 开启 hover | `boolean`                                   | `true`       |
| bordered   | 显示边框   | `boolean`                                   | `true`       |
| preview    | 是否开启预览 | `boolean`                                | -           |

ImageProps 见 [Antd4.x Image API](https://4x-ant-design.antgroup.com/components/image-cn/#API)

## 组件依赖

无
