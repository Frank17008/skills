# InfiniteScrollList 无限滚动列表

自动处理分页加载，支持大数据量流畅展示。

## 基础用法

```tsx
import { InfiniteScrollList } from '@pointcloud/pcloud-components';

export default () => {
  const loadMore = (): Promise<any> => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve({
          data: {
            records: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            total: 100,
          },
        });
      }, 1000);
    });
  };

  return (
    <InfiniteScrollList
      containerHeight={500}
      loadMore={loadMore}
      renderItem={(item: any) => <div style={{ padding: 16 }}>Item {item}</div>}
    />
  );
};
```

## 栅格列表

```tsx
import { InfiniteScrollList } from '@pointcloud/pcloud-components';

export default () => {
  const loadMore = (): Promise<any> => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve({
          data: {
            records: Array.from({ length: 20 }, (_, i) => ({ id: i + 1, name: `Item ${i + 1}` })),
            total: 100,
          },
        });
      }, 1000);
    });
  };

  return (
    <InfiniteScrollList
      containerHeight={400}
      loadMore={loadMore}
      grid={{ column: 4, gap: 16 }}
      renderItem={(item: any) => (
        <div style={{ padding: 16, background: '#f5f5f5', borderRadius: 4 }}>{item.name}</div>
      )}
    />
  );
};
```

## API

### InfiniteScrollListProps

| 参数 | 说明 | 类型 | 默认值 |
|-----|-----|-----|-------|
| containerId | 容器 id | `string` | `'scrollableDiv'` |
| containerHeight | 容器高度 | `number \| string` | - |
| initialParams | 初始请求参数 | `any` | `{}` |
| loadMore | 列表请求方法 | `(params?) => Promise<{ data: { total, records } }>` | - |
| renderItem | 列表项渲染方法 | `(item, index) => ReactNode` | - |
| grid | 栅格配置 | `{ column: number; gap: number }` | - |
| itemKey | 列表项唯一标识字段 | `string` | `'id'` |
| scrollThreshold | 滚动阈值 | `string \| number` | `'100px'` |
| visibilityHeight | 出现 BackTop 的高度 | `number` | `200` |
| showBackTop | 是否显示 BackTop | `boolean` | `true` |
| endMessage | 列表底部提示 | `ReactNode` | - |
| onItemClick | 列表项点击事件 | `(item, index) => void` | - |

## 组件依赖

无