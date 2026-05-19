# AnimatedScrollList

自动滚动列表组件，支持四个方向的无缝循环滚动，适用于公告、通知、跑马灯等场景。

## 基础用法

```tsx
import { AnimatedScrollList } from '@pointcloud/pcloud-components';

export default () => {
  const data = [
    { id: 1, text: '这是第一条公告内容' },
    { id: 2, text: '这是第二条公告内容' },
    { id: 3, text: '这是第三条公告内容' },
    { id: 4, text: '这是第四条公告内容' },
    { id: 5, text: '这是第五条公告内容' },
  ];

  return (
    <div style={{ border: '1px solid #d9d9d9', borderRadius: 4, padding: 16 }}>
      <AnimatedScrollList
        direction="up"
        speed={50}
        containerHeight={150}
        data={data}
        renderItem={(item) => <div style={{ padding: '8px 0', fontSize: 14 }}>{item.text}</div>}
      />
    </div>
  );
};
```

## 固定表头

```tsx
import React from 'react';
import { AnimatedScrollList } from '@pointcloud/pcloud-components';

const headerStyle: React.CSSProperties = {
  display: 'grid',
  gridTemplateColumns: '1.5fr 1fr 1fr 1fr',
  padding: '12px 16px',
  fontWeight: 600,
  fontSize: 14,
  color: '#1f1f1f',
  backgroundColor: '#f7f8fa',
  border: '1px solid #e5e6eb',
};

const rowStyle: React.CSSProperties = {
  display: 'grid',
  gridTemplateColumns: '1.5fr 1fr 1fr 1fr',
  padding: '12px 16px',
  fontSize: 14,
  color: '#1f1f1f',
  borderBottom: '1px solid #f0f0f0',
};

export default function Demo() {
  const data = [
    { id: 'task-1', service: '订单服务', status: '运行中', updatedAt: '10:21:35' },
    { id: 'task-2', service: '支付服务', status: '延迟', updatedAt: '10:20:11' },
    { id: 'task-3', service: '库存服务', status: '运行中', updatedAt: '10:18:02' },
    { id: 'task-4', service: '搜索服务', status: '运行中', updatedAt: '10:15:27' },
    { id: 'task-5', service: '推荐服务', status: '运行中', updatedAt: '10:12:44' },
    { id: 'task-6', service: '用户画像', status: '告警', updatedAt: '10:11:03' },
  ];

  const hanldeClick = (e: React.MouseEvent<HTMLSpanElement, MouseEvent>, item: any) => {
    e.stopPropagation();
    console.log('删除', item);
  };

  return (
    <div style={{ width: 520, padding: 16, backgroundColor: '#fff', borderRadius: 12, boxShadow: '0 4px 12px rgba(0,0,0,0.06)' }}>
      <AnimatedScrollList
        header={
          <div style={headerStyle}>
            <span>服务模块</span>
            <span>当前状态</span>
            <span>更新时间</span>
            <span>操作</span>
          </div>
        }
        containerHeight={240}
        data={data}
        direction="up"
        speed={60}
        style={{
          border: '1px solid #e5e6eb',
          backgroundColor: '#fff',
        }}
        renderItem={(item) => (
          <div style={rowStyle}>
            <span>{item.service}</span>
            <span style={{ color: item.status === '运行中' ? '#00b578' : item.status === '延迟' ? '#faad14' : '#f53f3f' }}>{item.status}</span>
            <span style={{ color: '#86909c' }}>{item.updatedAt}</span>
            <span style={{ color: '#ff0000', cursor: 'pointer' }} onClick={(e) => hanldeClick(e, item)}>
              删除
            </span>
          </div>
        )}
      />
    </div>
  );
}
```

## 四个方向

```tsx
import React from 'react';
import { AnimatedScrollList } from '@pointcloud/pcloud-components';
import { Row, Col } from 'antd';

export default () => {
  const data = [
    { id: 1, text: '向上滚动' },
    { id: 2, text: '向下滚动' },
    { id: 3, text: '向左滚动' },
    { id: 4, text: '向右滚动' },
  ];

  return (
    <Row gutter={16}>
      <Col span={12}>
        <div style={{ marginBottom: 16 }}>
          <h4>向上滚动 (up)</h4>
          <div style={{ border: '1px solid #d9d9d9', borderRadius: 4, padding: 16 }}>
            <AnimatedScrollList
              direction="up"
              speed={50}
              containerHeight={150}
              data={data}
              renderItem={(item) => <div style={{ padding: '8px 0', fontSize: 14 }}>{item.text}</div>}
            />
          </div>
        </div>
      </Col>
      <Col span={12}>
        <div style={{ marginBottom: 16 }}>
          <h4>向下滚动 (down)</h4>
          <div style={{ border: '1px solid #d9d9d9', borderRadius: 4, padding: 16 }}>
            <AnimatedScrollList
              direction="down"
              speed={50}
              containerHeight={150}
              data={data}
              renderItem={(item) => <div style={{ padding: '8px 0', fontSize: 14 }}>{item.text}</div>}
            />
          </div>
        </div>
      </Col>
      <Col span={12}>
        <div style={{ marginBottom: 16 }}>
          <h4>向左滚动 (left)</h4>
          <div style={{ height: 150, border: '1px solid #d9d9d9', borderRadius: 4, padding: 16 }}>
            <AnimatedScrollList
              direction="left"
              speed={50}
              containerWidth={400}
              containerHeight={150}
              data={data}
              renderItem={(item) => <div style={{ padding: '0 16px', whiteSpace: 'nowrap' }}>{item.text}</div>}
            />
          </div>
        </div>
      </Col>
      <Col span={12}>
        <div style={{ marginBottom: 16 }}>
          <h4>向右滚动 (right)</h4>
          <div style={{ height: 150, border: '1px solid #d9d9d9', borderRadius: 4, padding: 16 }}>
            <AnimatedScrollList
              direction="right"
              speed={50}
              containerWidth={400}
              containerHeight={150}
              data={data}
              renderItem={(item) => <div style={{ padding: '0 16px', whiteSpace: 'nowrap' }}>{item.text}</div>}
            />
          </div>
        </div>
      </Col>
    </Row>
  );
};
```

## API

### AnimatedScrollListProps

| 参数                   | 说明                                       | 类型                                                         | 默认值  |
|----------------------|------------------------------------------| ------------------------------------------------------------ | ------- |
| direction              | 滚动方向                                   | `'up' \| 'down' \| 'left' \| 'right'`                        | `'up'`  |
| speed                  | 滚动速度，单位 px/s                        | `number`                                                     | `50`    |
| hoverStop              | 是否在鼠标悬停时暂停滚动                   | `boolean`                                                    | `true`  |
| autoStart              | 是否自动开始滚动                           | `boolean`                                                    | `true`  |
| containerHeight        | 容器高度（垂直滚动时）或宽度（水平滚动时） | `number \| string`                                           | -       |
| containerWidth         | 容器宽度（水平滚动时）或高度（垂直滚动时） | `number \| string`                                           | -       |
| data                   | 列表数据                                   | `any[]`                                                      | -       |
| renderItem             | 渲染列表项的方法                           | `(item: any, index: number) => ReactNode`                   | -       |
| itemKey                | 列表项的唯一标识字段，用于 key             | `string \| ((item: any, index: number) => string \| number)` | `'id'`  |
| className              | 自定义类名                                 | `string`                                                     | `''`    |
| style                  | 自定义样式                                 | `CSSProperties`                                              | -       |
| showScrollbar          | 是否显示滚动条                             | `boolean`                                                    | `false` |
| scrollWhenInsufficient | 当列表项数量不足一屏时是否仍然滚动         | `boolean`                                                    | `false` |
| header                 | 表头内容，传入后表头固定展示               | `ReactNode`                                                  | -       |

## 组件依赖

无
