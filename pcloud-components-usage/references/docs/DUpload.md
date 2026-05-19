# DUpload 文件上传

基于 Ant Design Upload 的增强封装，支持缩略图预览。

## 基础用法

```tsx
import React from 'react';
import { DUpload } from '@pointcloud/pcloud-components';

export default function BasicDemo() {
  const onChange = (files) => {
    console.log('files: ', files);
  };

  return <DUpload multiple onChange={onChange} />;
}
```

## 缩略图配置

通过 thumbOption 配置缩略图生成规则。

```tsx
import React from 'react';
import { DUpload } from '@pointcloud/pcloud-components';

export default function ThumbDemo() {
  return (
    <DUpload
      multiple
      onChange={(files) => console.log(files)}
      thumbOption={{
        size: 5 * 1024 * 1024, // 大于5MB时生成缩略图
        compress: { width: 86, height: 86, quality: 0.1 },
      }}
    />
  );
}
```

## API

### DUploadProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| value | 初始文件列表 | `DUploadFile \| DUploadFile[]` | - |
| fileList | 受控文件列表 | `DUploadFile \| DUploadFile[]` | - |
| onChange | 文件列表变化时的回调 | `(list, info) => void` | - |
| customRequest | 自定义上传方法 | `(file, list, option) => DUploadFile[] \| Promise \| void` | - |
| onRemove | 删除文件时的回调 | `(file, list) => DUploadFile[] \| Promise \| void` | - |
| onDownload | 点击下载按钮的回调 | `(file) => DUploadFile \| Blob \| Promise` | - |
| onPreview | 点击预览按钮的回调 | `(file) => DUploadFile \| Blob \| Promise` | - |
| uploadButton | 上传按钮 | `ReactNode` | - |
| thumbOption | 缩略图配置，null 表示不生成缩略图 | `ThumbOptionProps \| null` | - |
| enablePreview | 是否启用预览功能 | `boolean \| (file) => boolean` | `false` |

继承 antd Upload 所有属性。

### DUploadFile

扩展自 antd UploadFile。

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| id | 文件 id | `string \| number` |
| uid | 文件 uid | `string \| number` |
| source | 文件来源 | `'upload' \| 'remote'` |
| status | 文件状态 | `'error' \| 'success' \| 'done' \| 'uploading' \| 'removed'` |

### ThumbOptionProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| filter | 文件过滤器 | `(file) => boolean \| string[]` | 图片格式 |
| size | 文件大小限制，超过时压缩(字节) | `number` | `2097152` (2MB) |
| compress | 压缩参数 | `{ width, height, quality }` | `{ width: 300, height: 200, quality: 0.7 }` |
| getThumbUrl | 自定义缩略图生成方法 | `(file, option) => Promise<string>` | - |