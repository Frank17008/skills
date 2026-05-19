# DModal 增强模态框

基于 Ant Design Modal 的增强封装，支持多种定位模式（绝对定位、相对定位、浏览器窗口定位）。

## 基础用法

```tsx
import React, { useState } from 'react';
import { DModal } from '@pointcloud/pcloud-components';
import { Button } from 'antd';

function BasicDemo() {
  const [visible, setVisible] = useState(false);

  return (
    <div>
      <Button onClick={() => setVisible(true)}>打开弹窗</Button>
      <DModal
        open={visible}
        title="标题"
        onCancel={() => setVisible(false)}
        onOk={() => setVisible(false)}
      >
        <div>弹窗内容</div>
      </DModal>
    </div>
  );
}
```

## 定位模式

支持 `absolute`（默认）、`relative`、`panel`、`fixed` 四种定位模式。

```tsx
import React, { useState } from 'react';
import { DModal } from '@pointcloud/pcloud-components';
import { Button } from 'antd';

// 固定定位模式 - 基于浏览器窗口
const FixedModal = () => {
  const [visible, setVisible] = useState(false);
  return (
    <>
      <Button onClick={() => setVisible(true)}>窗口定位</Button>
      <DModal open={visible} onCancel={() => setVisible(false)} mode="fixed" title="固定定位">
        基于浏览器窗口定位
      </DModal>
    </>
  );
};

// 相对定位模式 - 基于自身
const RelativeModal = () => {
  const [visible, setVisible] = useState(false);
  return (
    <>
      <Button onClick={() => setVisible(true)}>相对定位</Button>
      <DModal open={visible} onCancel={() => setVisible(false)} mode="relative" title="相对定位">
        基于自身定位
      </DModal>
    </>
  );
};
```

## 删除确认框

```tsx
import { DModal } from '@pointcloud/pcloud-components';
import { Button } from 'antd';

const DeleteDemo = () => {
  const handleDelete = () => {
    DModal.delete({
      content: '确定要删除吗？',
      onOk: () => console.log('确认删除'),
      onCancel: () => console.log('取消删除'),
    });
  };

  return <Button onClick={handleDelete}>删除</Button>;
};
```

## API

### DModalProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| mode | 定位模式 | `'absolute' \| 'relative' \| 'panel' \| 'fixed'` | `absolute` |
| children | 自定义弹框内容 | `ReactNode` | - |
| afterClose | Modal 完全关闭后的回调 | `() => void` | - |
| cancelButtonProps | cancel 按钮 props | `ButtonProps` | - |
| cancelText | 取消按钮文字 | `ReactNode` | `'取消'` |
| centered | 垂直居中展示 Modal | `boolean` | `false` |
| closable | 是否显示右上角的关闭按钮 | `boolean` | `true` |
| closeIcon | 自定义关闭图标 | `ReactNode` | `<CloseOutlined />` |
| confirmLoading | 确定按钮 loading | `boolean` | `false` |
| destroyOnClose | 关闭时销毁 Modal 里的子元素 | `boolean` | `false` |
| footer | 底部内容，设为 `null` 可隐藏底部按钮 | `ReactNode` | (确定取消按钮) |
| keyboard | 是否支持键盘 esc 关闭 | `boolean` | `true` |
| mask | 是否展示遮罩 | `boolean` | `true` |
| maskClosable | 点击蒙层是否允许关闭 | `boolean` | `true` |
| maskStyle | 遮罩样式 | `CSSProperties` | - |
| okButtonProps | ok 按钮 props | `ButtonProps` | - |
| okText | 确认按钮文字 | `ReactNode` | `'确定'` |
| okType | 确认按钮类型 | `string` | `'primary'` |
| style | 设置浮层的样式 | `CSSProperties` | - |
| title | 标题 | `ReactNode` | - |
| width | 弹窗宽度 | `number \| string` | - |
| wrapClassName | 对话框外层容器的类名 | `string` | - |
| onCancel | 点击遮罩层或取消按钮的回调 | `(e) => void` | - |
| onOk | 点击确定回调 | `(e) => void` | - |

继承 antd Modal 所有属性。

### DModal.delete

快速创建删除确认框的静态方法。

| 参数 | 说明 | 类型 |
|-----|-----|-----|
| content | 确认框内容 | `ReactNode` |
| onOk | 点击确定回调 | `() => void \| Promise` |
| onCancel | 点击取消回调 | `() => void` |
| zIndex | Modal 的 z-index | `number` |