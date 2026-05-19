# ContextMenu

用于展示自定义的右键菜单内容，可以与 Antd Menu 组件结合使用，支持灵活的菜单内容和智能边界处理。

## 基础用法

```tsx
import { ContextMenu } from '@pointcloud/pcloud-components';
import { Space } from 'antd';
import { DeleteOutlined, EditOutlined, CopyOutlined } from '@ant-design/icons';

export default () => {
  const menuItems = (
    <>
      <div className="ant-context-menu-item">
        <EditOutlined /> 编辑
      </div>
      <div
        className="ant-context-menu-item"
        onClick={() => {
          alert('已复制到剪贴板');
          navigator?.clipboard?.writeText('复制内容');
        }}
      >
        <CopyOutlined /> 复制
      </div>
      <div className="ant-context-menu-item-divider" />
      <div className="ant-context-menu-item" style={{ color: '#ff4d4f' }}>
        <DeleteOutlined /> 删除
      </div>
    </>
  );

  return (
    <Space direction="vertical" size="large" style={{ width: '100%' }}>
      <ContextMenu trigger={<div style={{ padding: 24, background: '#f5f5f5', textAlign: 'center' }}>在此区域右键点击</div>}>{menuItems}</ContextMenu>
    </Space>
  );
};
```

## 配合 Antd Menu

```tsx
import React from 'react';
import { ContextMenu } from '@pointcloud/pcloud-components';
import { Space, Menu } from 'antd';
import type { MenuProps } from 'antd';

export default () => {
  const items: MenuProps['items'] = [
    {
      key: '1',
      label: '选项1',
    },
    {
      key: '2',
      label: '选项2',
    },
    {
      type: 'divider',
    },
    {
      key: '3',
      label: '选项3',
      disabled: true,
    },
  ];

  return (
    <Space direction="vertical" size="large" style={{ width: '100%' }}>
      <ContextMenu trigger={<div style={{ padding: 24, background: '#f5f5f5', textAlign: 'center' }}>使用 Antd Menu 组件</div>}>
        <Menu items={items} style={{ border: 'none' }} />
      </ContextMenu>
    </Space>
  );
};
```

## API

### Props

| 参数              | 说明                 | 类型                                        | 默认值                |
| ----------------- | -------------------- | ------------------------------------------- | --------------------- |
| className         | 自定义类名           | `string`                                    | -                     |
| style             | 自定义样式           | `CSSProperties`                             | -                     |
| children          | 菜单内容             | `ReactNode`                                 | -                     |
| trigger           | 触发区域内容         | `ReactNode`                                 | -                     |
| closeOnOutside    | 点击外部是否关闭     | `boolean`                                   | `true`                |
| offset            | 展示位置偏移量       | `{ x?: number; y?: number }`                | `{ x: 0, y: 0 }`      |
| onShow            | 菜单显示时的回调     | `() => void`                                | -                     |
| onHide            | 菜单隐藏时的回调     | `() => void`                                | -                     |
| getPopupContainer | 指定菜单挂载的父节点 | `(triggerNode: HTMLElement) => HTMLElement` | `() => document.body` |

## 组件依赖

无
