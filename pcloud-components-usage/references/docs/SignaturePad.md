# SignaturePad

在线手写签名组件，支持触屏和鼠标书写，可用于电子合同、文档签署等场景。

## 基础用法

```tsx
import { SignaturePad } from '@pointcloud/pcloud-components';
import { message } from 'antd';

export default () => {
  const handleDone = (dataUrl: string) => {
    message.success('签名完成！');
    console.log('签名图片URL:', dataUrl);
  };

  return <SignaturePad width={600} height={200} onDone={handleDone} />;
};
```

## 回显和编辑签名

```tsx
import { SignaturePad } from '@pointcloud/pcloud-components';
import type { SignaturePadHandle } from '@pointcloud/pcloud-components';
import { Button, Space, message } from 'antd';
import { useRef, useState } from 'react';

export default () => {
  const [previewUrl, setPreviewUrl] = useState<string>();
  const signaturePadRef = useRef<SignaturePadHandle>(null);

  const handleDone = (dataUrl: string) => {
    setPreviewUrl(dataUrl);
    message.success('签名已更新！');
  };

  const handleReset = () => {
    signaturePadRef.current?.clear();
    setPreviewUrl(undefined);
  };

  return (
    <Space direction="vertical" size="large" style={{ width: '100%' }}>
      <div style={{ border: '1px solid #d9d9d9', padding: 16, borderRadius: 8 }}>
        <h4>演示场景：</h4>
        <p>1. 点击"完成"按钮保存第一次签名</p>
        <p>2. 点击"重新签名"，将之前的签名作为背景重新签名</p>
        <p>3. 可以在已有签名的基础上继续修改</p>
      </div>

      <SignaturePad ref={signaturePadRef} width={600} height={200} defaultValue={previewUrl} onDone={handleDone} />

      <Space>
        <Button onClick={handleReset} disabled={!previewUrl}>
          重新签名
        </Button>
        {previewUrl && (
          <div style={{ marginLeft: 16 }}>
            <p>签名预览：</p>
            <img
              src={previewUrl}
              alt="签名预览"
              style={{
                maxWidth: '100%',
                border: '1px solid #d9d9d9',
                borderRadius: 4,
              }}
            />
          </div>
        )}
      </Space>
    </Space>
  );
};
```

## API

### Props

| 参数            | 说明                                   | 类型                        | 默认值      |
| --------------- | -------------------------------------- | --------------------------- | ----------- |
| width           | 画布宽度                               | `number`                    | `600`       |
| height          | 画布高度                               | `number`                    | `200`       |
| penColor        | 线条颜色                               | `string`                    | `'#000000'` |
| penWidth        | 线条粗细                               | `number`                    | `2`         |
| backgroundColor | 背景颜色                               | `string`                    | `'#ffffff'` |
| clearText       | 清除按钮文字                           | `string`                    | `'清除'`    |
| doneText        | 完成按钮文字                           | `string`                    | `'完成'`    |
| showToolbar     | 是否显示工具栏                         | `boolean`                   | `true`      |
| onDone          | 签名完成回调                           | `(dataUrl: string) => void` | -           |
| defaultValue    | 默认签名图片（支持 base64 或图片 URL） | `string`                    | -           |
| className       | 自定义类名                             | `string`                    | -           |
| style           | 自定义样式                             | `CSSProperties`             | -           |
| prefixCls       | 自定义前缀，一般不需要设置             | `string`                    | -           |

### Ref 实例方法 (SignaturePadHandle)

| 名称       | 说明                                                       | 类型                        |
| ---------- | ---------------------------------------------------------- | --------------------------- |
| clear      | 清除画布内容                                               | `() => void`                |
| getDataURL | 获取签名图片的 base64 数据，如果画布不存在则返回 undefined | `() => string \| undefined` |

## 组件依赖

无
