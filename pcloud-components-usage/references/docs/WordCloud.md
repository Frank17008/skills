# WordCloud

词云可视化组件，基于 Canvas 高性能渲染，支持交互事件和丰富的自定义样式选项。

## 基础用法

```tsx
import { WordCloud, type WordCloudProps } from '@pointcloud/pcloud-components';

export default () => {
  const words: WordCloudProps['list'] = [
    ['New York', 12],
    ['Los Angeles', 12],
    ['Chicago', 22],
    ['Houston', 22],
    ['Phoenix', 22],
    ['Philadelphia', 22],
    ['San Antonio', 22],
    ['San Diego', 22],
    ['Dallas', 22],
    ['San Jose', 22],
    ['Austin', 22],
    ['Jacksonville', 22],
    ['San Francisco', 22],
    ['Columbus', 22],
    ['Charlotte', 26],
    ['Indianapolis', 22],
    ['Fort Worth', 24],
    ['Seattle', 22],
    ['Denver', 22],
    ['Washington', 22],
    ['Boston', 22],
    ['El Paso', 21],
    ['Detroit', 22],
    ['Nashville', 22],
    ['Portland', 22],
    ['Oklahoma City', 22],
    ['Las Vegas', 22],
    ['Memphis', 22],
    ['Louisville', 23],
    ['Baltimore', 15],
    ['Milwaukee', 22],
    ['Albuquerque', 10],
    ['Tucson', 14],
    ['Fresno', 20],
    ['Sacramento', 22],
    ['Long Beach', 22],
    ['Kansas City', 22],
    ['Mesa', 21],
    ['Virginia Beach', 22],
    ['Atlanta', 12],
    ['Colorado Springs', 11],
    ['Omaha', 12],
    ['Raleigh', 22],
    ['Miami', 22],
    ['Oakland', 13],
    ['Minneapolis', 22],
    ['Tulsa', 22],
    ['Arlington', 14],
    ['New Orleans', 22],
    ['Bakersfield', 22],
    ['Tampa', 22],
  ];

  return <WordCloud list={words} />;
};
```

## 交互事件

```tsx
import { WordCloud, type WordCloudProps } from '@pointcloud/pcloud-components';

export default () => {
  const words: WordCloudProps['list'] = [
    ['New York', 12],
    ['Los Angeles', 12],
    ['Chicago', 22],
    ['Houston', 22],
    ['Phoenix', 22],
    ['Philadelphia', 22],
    ['San Antonio', 22],
    ['San Diego', 22],
    ['Dallas', 22],
    ['San Jose', 22],
    ['Austin', 22],
    ['Jacksonville', 22],
    ['San Francisco', 22],
    ['Columbus', 22],
    ['Charlotte', 26],
    ['Indianapolis', 22],
    ['Fort Worth', 24],
    ['Seattle', 22],
    ['Denver', 22],
    ['Washington', 22],
    ['Boston', 22],
    ['El Paso', 21],
    ['Detroit', 22],
    ['Nashville', 22],
    ['Portland', 22],
    ['Oklahoma City', 22],
    ['Las Vegas', 22],
    ['Colorado Springs', 11],
    ['Omaha', 12],
    ['Raleigh', 22],
    ['Miami', 22],
    ['Oakland', 13],
  ];

  const onClick = (item, diemension, event) => {
    console.info(item, diemension, event);
    alert('点击了');
  };

  return <WordCloud list={words} tooltip={false} onClick={onClick} />;
};
```

## 自定义样式

```tsx
import { WordCloud, type WordCloudProps } from '@pointcloud/pcloud-components';
import { useCallback, useState } from 'react';

const fonts = ['Microsoft YaHei', 'Arial', 'Times New Roman', 'Courier New', 'Georgia'];
const colors = ['random-dark', 'random-light', '#1890ff', '#f5222d', '#52c41a', '#722ed1'];
const shapes = ['circle', 'cardioid', 'diamond', 'triangle-forward', 'triangle', 'pentagon', 'star'];

export default () => {
  const [options, setOptions] = useState<WordCloudProps['options']>({
    fontWeight: 'bold',
    color: 'random-dark',
    fontFamily: 'Microsoft YaHei',
    backgroundColor: '#ffffff',
    minSize: 12,
    gridSize: 8,
    weightFactor: 5,
    rotateRatio: 0.5,
    drawOutOfBound: false,
    shrinkToFit: true,
    shape: 'circle',
    minRotation: -Math.PI / 4,
    maxRotation: Math.PI / 2,
    rotationSteps: 4,
    shuffle: true,
  });

  const words: WordCloudProps['list'] = [
    ['New York', 32],
    ['Los Angeles', 28],
    ['Chicago', 26],
    ['Houston', 24],
    ['Phoenix', 22],
    ['Philadelphia', 22],
    ['San Antonio', 20],
    ['San Diego', 20],
    ['Dallas', 18],
    ['San Jose', 18],
    ['Austin', 18],
    ['Jacksonville', 16],
    ['San Francisco', 16],
    ['Columbus', 16],
    ['Charlotte', 26],
    ['Indianapolis', 14],
    ['Fort Worth', 24],
    ['Seattle', 14],
    ['Denver', 14],
    ['Washington', 12],
    ['Boston', 12],
    ['El Paso', 12],
    ['Detroit', 12],
    ['Nashville', 12],
    ['Portland', 10],
    ['Oklahoma City', 10],
    ['Las Vegas', 10],
  ];

  const handleOptionChange = useCallback(<T extends keyof NonNullable<WordCloudProps['options']>>(key: T, value: NonNullable<WordCloudProps['options']>[T]) => {
    setOptions((prev) => ({
      ...prev,
      [key]: value,
    }));
  }, []);

  const containerStyle: React.CSSProperties = {
    padding: 24,
    backgroundColor: '#f0f2f5',
  };

  const controlStyle: React.CSSProperties = {
    marginBottom: 16,
    display: 'flex',
    gap: 8,
    flexWrap: 'wrap',
  };

  const buttonStyle: React.CSSProperties = {
    padding: '4px 12px',
    borderWidth: '1px',
    borderStyle: 'solid',
    borderColor: '#d9d9d9',
    borderRadius: 4,
    backgroundColor: '#fff',
    cursor: 'pointer',
    transition: 'all 0.3s',
  };

  const activeButtonStyle: React.CSSProperties = {
    ...buttonStyle,
    borderColor: '#1890ff',
    color: '#1890ff',
  };

  return (
    <div style={containerStyle}>
      <div style={controlStyle}>
        <div style={{ marginRight: 16 }}>
          <div style={{ marginBottom: 8 }}>形状：</div>
          <div style={{ display: 'flex', gap: 8 }}>
            {shapes.map((shape) => (
              <button
                type="button"
                key={shape}
                onClick={() => handleOptionChange('shape', shape)}
                style={options?.shape === shape ? activeButtonStyle : buttonStyle}
              >
                {shape}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div style={controlStyle}>
        <div style={{ marginRight: 16 }}>
          <div style={{ marginBottom: 8 }}>颜色：</div>
          <div style={{ display: 'flex', gap: 8 }}>
            {colors.map((color) => (
              <button
                type="button"
                key={color}
                onClick={() => handleOptionChange('color', color)}
                style={options?.color === color ? activeButtonStyle : buttonStyle}
              >
                {color === 'random-dark' ? '随机深色' : color === 'random-light' ? '随机浅色' : color}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div style={controlStyle}>
        <div style={{ marginRight: 16 }}>
          <div style={{ marginBottom: 8 }}>字体：</div>
          <div style={{ display: 'flex', gap: 8 }}>
            {fonts.map((font) => (
              <button
                type="button"
                key={font}
                onClick={() => handleOptionChange('fontFamily', font)}
                style={options?.fontFamily === font ? activeButtonStyle : buttonStyle}
              >
                {font}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div style={controlStyle}>
        <div style={{ marginRight: 16 }}>
          <div style={{ marginBottom: 8 }}>大小：</div>
          <div style={{ display: 'flex', gap: 8 }}>
            {[3, 5, 8, 10].map((size) => (
              <button
                type="button"
                key={size}
                onClick={() => handleOptionChange('weightFactor', size)}
                style={options?.weightFactor === size ? activeButtonStyle : buttonStyle}
              >
                {size === 3 ? '小' : size === 5 ? '中' : size === 8 ? '大' : '特大'}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div style={controlStyle}>
        <div style={{ marginRight: 16 }}>
          <div style={{ marginBottom: 8 }}>旋转：</div>
          <div style={{ display: 'flex', gap: 8 }}>
            {[0, 0.3, 0.5, 0.8].map((ratio) => (
              <button
                type="button"
                key={ratio}
                onClick={() => handleOptionChange('rotateRatio', ratio)}
                style={options?.rotateRatio === ratio ? activeButtonStyle : buttonStyle}
              >
                {ratio === 0 ? '无' : ratio === 0.3 ? '少' : ratio === 0.5 ? '中' : '多'}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div style={{ height: 500, border: '1px solid #d9d9d9', borderRadius: 4, overflow: 'hidden' }}>
        <WordCloud list={words} options={options} />
      </div>
    </div>
  );
};
```

## API

### WordCloudProps

| 参数      | 说明                                       | 类型                                                                        | 默认值       |
|---------|------------------------------------------| --------------------------------------------------------------------------- | ------------ |
| list      | 词云数据列表，每项为 `[word, weight]` 格式 | `[string, number][]`                                                        | `[]`         |
| className | 自定义类名                                 | `string`                                                                    | -            |
| tooltip   | 是否显示悬浮提示                           | `boolean`                                                                   | `true`       |
| onClick   | 点击词语时的回调函数                       | `(item: [string, number], dimension: Dimension, event: MouseEvent) => void` | -            |
| options   | 词云配置项                                 | `Partial<WordCloud2.Options>`                                               | 见下方默认值 |

### Options

| 参数            | 说明                   | 类型                                                                                                      | 默认值                |
|---------------|----------------------| --------------------------------------------------------------------------------------------------------- | --------------------- |
| shape           | 词云形状               | `'circle' \| 'cardioid' \| 'diamond' \| 'triangle-forward' \| 'triangle' \| 'pentagon' \| 'star'`         | `'circle'`            |
| backgroundColor | 背景颜色               | `string`                                                                                                  | `'#ffffff'`           |
| fontFamily      | 字体                   | `string`                                                                                                  | `'Arial, sans-serif'` |
| fontWeight      | 字体粗细               | `string \| number`                                                                                        | `'bold'`              |
| color           | 文字颜色               | `string \| ((word: string, weight: number, fontSize: number, distance: number, theta: number) => string)` | `'random-dark'`       |
| gridSize        | 网格大小，影响词语间距 | `number`                                                                                                  | `4`                   |
| weightFactor    | 字体大小权重因子       | `number \| ((weight: number) => number)`                                                                  | `1`                   |
| rotateRatio     | 旋转概率               | `number`                                                                                                  | `0.5`                 |
| rotationSteps   | 旋转步数               | `number`                                                                                                  | `10`                  |
| minSize         | 最小字体大小           | `number`                                                                                                  | `12`                  |
| drawMask        | 是否绘制掩码           | `boolean`                                                                                                 | `false`               |
| drawOutOfBound  | 是否允许绘制超出边界   | `boolean`                                                                                                 | `false`               |
| shrinkToFit     | 是否缩小以适应画布     | `boolean`                                                                                                 | `true`                |
| minRotation     | 最小旋转角度           | `number`                                                                                                  | `-Math.PI/4`          |
| maxRotation     | 最大旋转角度           | `number`                                                                                                  | `Math.PI/4`           |
| shuffle         | 是否打乱词语顺序       | `boolean`                                                                                                 | `true`                |

### Dimension

| 属性 | 说明          | 类型     |
|-----|-------------|--------|
| x    | 词语的 x 坐标 | `number` |
| y    | 词语的 y 坐标 | `number` |
| w    | 词语的宽度    | `number` |
| h    | 词语的高度    | `number` |

## 组件依赖

`wordcloud2.js`
