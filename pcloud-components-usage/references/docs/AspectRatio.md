# AspectRatio

宽高比容器组件，确保内容（如图片、视频等）在不同屏幕尺寸下保持固定宽高比例，避免变形。

## 基础用法（图片）

```tsx
import { AspectRatio } from '@pointcloud/pcloud-components';

export default function Demo1() {
  return (
    <AspectRatio ratio={16 / 9} style={{ width: '400px', border: '1px solid #ccc' }}>
      <img src="https://picsum.photos/1920/1080" style={{ width: '100%', height: '100%', objectFit: 'contain' }} />
    </AspectRatio>
  );
}
```

## 视频

```tsx
import { AspectRatio } from '@pointcloud/pcloud-components';

export default function Demo3() {
  return (
    <>
      <AspectRatio ratio={4 / 3} style={{ width: '300px', border: '1px solid #ccc' }}>
        <video src="https://www.w3schools.com/html/mov_bbb.mp4" style={{ width: '100%', height: '100%', objectFit: 'contain', display: 'block' }} controls />
      </AspectRatio>
      <hr />
      <AspectRatio ratio={16 / 9} style={{ width: '400px', border: '1px solid #ccc' }}>
        <video src="http://vjs.zencdn.net/v/oceans.mp4" autoPlay style={{ width: '100%', objectFit: 'contain' }} controls />
      </AspectRatio>
    </>
  );
}
```

## API

### AspectRatioProps

| 参数      | 说明                 | 类型                  | 默认值  |
|---------|---------------------|----------------------|--------|
| ratio   | 宽高比，宽/高        | `number`             | 16/9   |
| className | 自定义外层容器 class | `string`            | -      |
| children | 需要保持比例的子元素 | `React.ReactNode`   | -      |
| style   | 自定义外层容器样式   | `React.CSSProperties` | -      |

## 组件依赖

无
