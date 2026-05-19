# RCropper 图片裁剪组件

基于 Cropper.js 封装，支持矩形选区、固定比例裁剪、图片变换等操作。

## 基础用法

```tsx
import { RCropper } from '@pointcloud/pcloud-components';

export default () => {
  const onCrop = (base64: string | undefined, file?: File) => {
    console.log(base64, file);
  };

  return (
    <RCropper
      style={{ height: 300 }}
      src="https://picsum.photos/400/300"
      onCrop={onCrop}
    />
  );
};
```

## 自定义选区

```tsx
import { RCropper } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <RCropper
      style={{ height: 300 }}
      src="https://picsum.photos/400/300"
      selection={{ width: 200, height: 200, aspectRatio: 1 }}
      onCrop={(base64) => console.log(base64)}
    />
  );
};
```

## API

### RCropperProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| src | 图片源地址 | `string` | - |
| alt | 图片替代文本 | `string` | `'image'` |
| dragMode | 拖拽模式 | `'crop' \| 'move' \| 'none'` | `'crop'` |
| selection | 裁剪区域配置 | `RCropperSelection` | - |
| grid | 网格线配置 | `RCropperGrid` | - |
| image | 图片配置 | `RCropperImage` | - |
| canvas | 画布配置 | `RCropperCanvas` | - |
| onCrop | 裁剪完成回调 | `(src, file) => void` | - |
| onZoom | 缩放回调 | `(data) => void` | - |
| onRotate | 旋转回调 | `(data) => void` | - |
| onFlip | 翻转回调 | `(data) => void` | - |
| onReset | 重置回调 | `(data) => void` | - |

### RCropperSelection

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| width | 选区宽度 | `number` |
| height | 选区高度 | `number` |
| aspectRatio | 选区宽高比 | `number` |
| initialAspectRatio | 初始宽高比 | `number` |
| zoomable | 是否可缩放 | `boolean` |
| resizable | 是否可调整大小 | `boolean` |

### RCropperGrid

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| rows | 网格行数 | `number` |
| columns | 网格列数 | `number` |

### RCropperImage

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| rotatable | 是否可旋转 | `boolean` |
| scalable | 是否可缩放 | `boolean` |
| skewable | 是否可倾斜 | `boolean` |
| translatable | 是否可平移 | `boolean` |

### RCropperRef

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| cropper | Cropper 实例 | `Cropper` |
| image | 图片对象 | `CropperImage` |
| canvas | 画布对象 | `CropperCanvas` |
| selection | 选区对象 | `CropperSelection` |

## 组件依赖

`react-cropper`