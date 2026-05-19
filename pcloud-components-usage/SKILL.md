---
name: pcloud-components-usage
description: Use when developer needs to install, use, or look up components from @pointcloud/pcloud-components npm package
version: "1.0.8"
lastUpdated: "2026-05-19"
command: pcloud-components-usage
commands:
  - name: update
    description: 更新 pcloud-components-usage skill 到最新版本
    run: npx skills add https://github.com/Frank17008/skills -s pcloud-components-usage -g -y
  - name: upgrade
    description: 升级 pcloud-components-usage skill
    run: npx skills add https://github.com/Frank17008/skills -s pcloud-components-usage -g -y
---

# pcloud-components Usage Guide

## Overview

`@pointcloud/pcloud-components` is a React component library based on Ant Design v4.24.16 and React v18. Contains 38+ business components for enterprise mid-backend products.

## Quick Start

### Installation

```bash
# npm
npm install @pointcloud/pcloud-components

# yarn
yarn add @pointcloud/pcloud-components

# pnpm
pnpm add @pointcloud/pcloud-components
```

### Peer Dependencies (Required)

```bash
npm install @ant-design/icons@^4.8.3 antd@^4.24.16 react@18 react-dom@18
```

### Basic Usage

```jsx
import React from 'react';
import { DCascader } from '@pointcloud/pcloud-components';

const App = () => {
  const handleChange = (value, selectedOptions) => {
    console.log(value, selectedOptions);
  };

  return <DCascader showSearch placeholder="请选择" onChange={handleChange} />;
};

export default App;
```

### Using Form Components (DForm)

```jsx
import { DForm } from '@pointcloud/pcloud-components';

const App = () => {
  const [form] = DForm.useForm();
  const onFinish = (values) => {
    console.log('表单值:', values);
  };
  const items = [
    {
      label: '用户名',
      name: 'username',
      rules: [{ required: true, message: '请输入用户名' }],
      renderType: 'input',
    },
    {
      label: '状态',
      name: 'status',
      rules: [{ required: true, message: '请选择状态' }],
      renderType: 'select',
      options: [
        { label: '启用', value: 1 },
        { label: '禁用', value: 0 },
      ],
    },
    {
      label: '提交',
      renderType: 'button',
      type: 'primary',
      htmlType: 'submit',
    },
  ];

  return <DForm form={form} onFinish={onFinish} items={items}></DForm>;
};
```

### UMD/CDN Usage

```html
<link rel="stylesheet" href="https://unpkg.com/@pointcloud/pcloud-components@1.0.0/dist/umd/pcloud-components.min.css" />
<script src="https://unpkg.com/react@18.3.1/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@18.3.1/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/@pointcloud/pcloud-components@1.0.0/dist/umd/pcloud-components.min.js"></script>
```

## Component List

### Form Components (8)

| Component | Description |
| --------- |-------------|
| DForm | Enhanced form based on Ant Design Form |
| DInput | Enhanced input with Chinese input optimization |
| DSelect | Select with async loading and debounce support |
| DCascader | Cascader with async loading support |
| DTreeSelect | TreeSelect with async loading support |
| DUpload | File upload with thumbnail preview |
| DRangePicker | Date range picker with customizable range position |
| DynamicFormItem | Dynamic form list management |

### Data Display (12)

| Component | Description |
| --------- |-------------|
| DTable | Enhanced table with auto-pagination |
| LabelValue | Label-value display component |
| WordCloud | Word cloud visualization |
| ScrollNumber | Number rolling animation |
| AspectRatio | Aspect ratio container |
| NoData | Empty state display |
| IPAddress | IP address input (IPv4/IPv6) |
| AnimatedScrollList | Seamless auto-scrolling list |
| OrgTree | Organization tree |
| TypewriterText | Typewriter text animation |
| ErrorBoundary | Error boundary component |
| IconFont | Custom icon font loader |

### Modal Components (3)

| Component | Description |
| --------- |-------------|
| DModal | Enhanced modal with positioning modes |
| ModalForm | Modal form combining DModal + DForm |
| LoginForm | Login form with built-in validation |

### Combo Components (3)

| Component | Description |
| --------- |-------------|
| CRUD | Full CRUD operations (DForm + DTable) |
| ModalTable | Modal with form search + table |
| InfiniteScrollList | Infinite scroll with pagination |

### Other Components (12)

| Component | Description |
| --------- |-------------|
| Loading | Global loading with hooks support |
| ContextMenu | Right-click context menu |
| AdvancedFilter | Advanced search filter |
| PictureCard | Image card with preview |
| SignaturePad | Digital signature pad |
| RndDrag | Draggable resizable component |
| RCropper | Image cropper based on Cropper.js |
| AuthComponent | Permission control |
| ColorPicker | Color picker (10+ modes) |
| ConfigProvider | Global configuration |

## Import All Components

```jsx
import * as PCloud from '@pointcloud/pcloud-components';
// PCloud.DForm, PCloud.DTable, etc.
```

## Documentation

- **在线文档(国内)**: http://113.201.2.78:20000
- **在线文档(海外)**: https://pui-me.vercel.app

## Detailed Component Reference

所有组件的详细文档已内置在 skill 中，位置: `references/docs/组件名.md`

### 表单组件

| 组件 | 文档 |
|------|------|
| DForm | `references/docs/DForm.md` |
| DInput | `references/docs/DInput.md` |
| DSelect | `references/docs/DSelect.md` |
| DCascader | `references/docs/DCascader.md` |
| DTreeSelect | `references/docs/DTreeSelect.md` |
| DUpload | `references/docs/DUpload.md` |
| DRangePicker | `references/docs/DRangePicker.md` |
| DynamicFormItem | `references/docs/DynamicFormItem.md` |

### 数据展示组件

| 组件 | 文档 |
|------|------|
| DTable | `references/docs/DTable.md` |
| NoData | `references/docs/NoData.md` |
| Loading | `references/docs/Loading.md` |
| LabelValue | `references/docs/LabelValue.md` |
| ScrollNumber | `references/docs/ScrollNumber.md` |
| TypewriterText | `references/docs/TypewriterText.md` |
| WordCloud | `references/docs/WordCloud.md` |
| AspectRatio | `references/docs/AspectRatio.md` |
| AnimatedScrollList | `references/docs/AnimatedScrollList.md` |
| ErrorBoundary | `references/docs/ErrorBoundary.md` |
| IconFont | `references/docs/IconFont.md` |
| IPAddress | `references/docs/IPAddress.md` |
| OrgTree | `references/docs/OrgTree.md` |

### 模态框组件

| 组件 | 文档 |
|------|------|
| DModal | `references/docs/DModal.md` |
| ModalForm | `references/docs/ModalForm.md` |
| LoginForm | `references/docs/LoginForm.md` |
| ModalTable | `references/docs/ModalTable.md` |

### 组合组件

| 组件 | 文档 |
|------|------|
| CRUD | `references/docs/CRUD.md` |
| InfiniteScrollList | `references/docs/InfiniteScrollList.md` |

### 其他组件

| 组件 | 文档 |
|------|------|
| AdvancedFilter | `references/docs/AdvancedFilter.md` |
| ContextMenu | `references/docs/ContextMenu.md` |
| PictureCard | `references/docs/PictureCard.md` |
| SignaturePad | `references/docs/SignaturePad.md` |
| RndDrag | `references/docs/RndDrag.md` |
| RCropper | `references/docs/RCropper.md` |
| AuthComponent | `references/docs/AuthComponent.md` |
| ColorPicker | `references/docs/ColorPicker.md` |
| ConfigProvider | `references/docs/ConfigProvider.md` |

## Environment Requirements

- React >= 18
- Ant Design <= 6.x (v4 for best compatibility)
- Node >= 16.20.0
- Modern browsers

## 更新 Skill

**自动更新（推荐）**：通过自然语言触发

> "升级 pcloud-components-usage" / "更新 skill" / "pcloud-components-usage upgrade"

系统将自动执行：
```bash
npx skills add https://github.com/Frank17008/skills -s pcloud-components-usage -g -y
```

**手动更新**：
```bash
npx skills add https://github.com/Frank17008/skills -s pcloud-components-usage -g -y
```

**当前版本**：`1.0.8` | **最后更新**：`2026-05-19`