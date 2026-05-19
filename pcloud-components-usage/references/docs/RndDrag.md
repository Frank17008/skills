# RndDrag 拖拽组件

基于 react-rnd 封装，支持拖拽移动和尺寸调整。

## 基础用法

```tsx
import { RndDrag } from '@pointcloud/pcloud-components';

export default () => {
  const style = {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    border: 'solid 1px #ddd',
    background: '#333',
    color: '#fff',
  };

  return (
    <div style={{ width: 400, height: 400, background: '#f2f2f2' }}>
      <RndDrag default={{ x: 100, y: 100, width: 100, height: 100 }} style={style}>
        拖动我
      </RndDrag>
    </div>
  );
};
```

## 移动范围限制

```tsx
import { RndDrag } from '@pointcloud/pcloud-components';

export default () => {
  return (
    <div style={{ width: 400, height: 400, background: '#f2f2f2' }}>
      <RndDrag
        default={{ x: 0, y: 0, width: 100, height: 100 }}
        bounds="parent"
        style={{ background: '#333', color: '#fff' }}
      >
        限制在父容器内
      </RndDrag>
    </div>
  );
};
```

## API

### RndDragProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| default | 非受控模式的初始位置和尺寸 | `{ x, y, width, height }` | - |
| position | 受控模式下的位置 | `{ x, y }` | - |
| size | 受控模式下的尺寸 | `{ width, height }` | - |
| bounds | 拖动边界限制 | `string \| Element \| 'parent'` | - |
| disableDragging | 完全禁用拖动 | `boolean` | `false` |
| dragAxis | 拖动方向限制 | `'x' \| 'y' \| 'both' \| 'none'` | `'both'` |
| minWidth | 最小宽度 | `number \| string` | `10` |
| minHeight | 最小高度 | `number \| string` | `10` |
| maxWidth | 最大宽度 | `number \| string` | `Infinity` |
| maxHeight | 最大高度 | `number \| string` | `Infinity` |
| lockAspectRatio | 锁定宽高比 | `boolean \| number` | `false` |
| enableResizing | 启用调整方向配置 | `ResizeEnable \| boolean` | `true` |
| style | 容器样式 | `CSSProperties` | - |
| className | 容器类名 | `string` | - |
| children | 子元素 | `ReactNode` | - |

### 事件回调

| 参数 | 说明 | 回调参数 |
|-----|-----|---------|
| onDragStart | 拖动开始 | `(e, data) => void \| false` |
| onDrag | 拖动过程 | `(e, data) => void \| false` |
| onDragStop | 拖动结束 | `(e, data) => void \| false` |
| onResizeStart | 调整开始 | `(e, dir, ref) => void` |
| onResize | 调整过程 | `(e, dir, ref, delta, position) => void` |
| onResizeStop | 调整结束 | `(e, dir, ref, delta, position) => void` |

### 类型定义

```typescript
type Position = { x: number; y: number };
type Size = { width: number; height: number };
type ResizeDirection = 'top' | 'right' | 'bottom' | 'left' | 'topRight' | 'bottomRight' | 'bottomLeft' | 'topLeft';
type ResizeEnable = { top?: boolean; right?: boolean; bottom?: boolean; left?: boolean; topRight?: boolean; bottomRight?: boolean; bottomLeft?: boolean; topLeft?: boolean };
```

## 组件依赖

`react-rnd`