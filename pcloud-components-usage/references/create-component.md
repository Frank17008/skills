# 创建新组件指南

本文档指导如何在 pcloud-components 项目中创建新组件。

## 组件目录结构

每个组件应包含以下文件：

```
src/
└── YourComponent/
    ├── index.tsx          # 主组件文件 (必需)
    ├── index.less         # 样式文件 (可选)
    ├── index.zh-CN.md    # 中文文档 (必需)
    ├── interface.ts      # TypeScript 接口 (推荐)
    ├── demos/             # 示例目录 (可选)
    │   ├── demo1.tsx
    │   └── demo2.tsx
    ├── __tests__/         # 测试目录 (可选)
    │   └── index.test.tsx
    └── handler.ts         # 业务逻辑 (可选)
```

## 创建步骤

### 1. 创建组件目录和文件

创建 `src/YourComponent/index.tsx`:

```tsx
import React from "react";
import "./index.less";

export interface YourComponentProps {
  /** 类名 */
  className?: string;
  /** 样式 */
  style?: React.CSSProperties;
  /** 内容 */
  children?: React.ReactNode;
}

export const YourComponent: React.FC<YourComponentProps> = (props) => {
  const { className, style, children } = props;

  return (
    <div className={`your-component ${className || ""}`} style={style}>
      {children}
    </div>
  );
};

export default YourComponent;
```

### 2. 创建样式文件

创建 `src/YourComponent/index.less`:

```less
@import "../commonStyle/index.less";

.@{prefix}-your-component {
  // 样式内容
}
```

### 3. 创建 TypeScript 接口 (推荐)

创建 `src/YourComponent/interface.ts`:

```typescript
export interface YourComponentProps {
  /** Props 说明 */
  propName?: string;
}

export interface YourComponentRef {
  /** 暴露的方法 */
  methodName: () => void;
}
```

### 4. 创建示例

创建 `src/YourComponent/demos/demo1.tsx`:

```tsx
import React from "react";
import YourComponent from "../index";

export default () => <YourComponent>示例内容</YourComponent>;
```

### 5. 创建单元测试 (推荐)

创建 `src/YourComponent/__tests__/index.test.tsx`:

```tsx
import React from "react";
import { render, screen } from "@testing-library/react";
import YourComponent from "../index";

describe("YourComponent", () => {
  it("renders correctly", () => {
    render(<YourComponent>Test</YourComponent>);
    expect(screen.getByText("Test")).toBeInTheDocument();
  });
});
```

### 6. 创建中文文档 (必需)

创建 `src/YourComponent/index.zh-CN.md`:

```markdown
---
title: YourComponent
description: YourComponent Description
keywords: ["some keywords"]
tocDepth: YourComponent's toc depth
nav:
  title: nav title
  path: /components
group:
  title: YourComponent's group
---

# YourComponent 组件名

组件简介...

## 组件特性

- 特性1
- 特性2
- 特性3

## 基础用法

!code(demos/demo1)

## API

| 属性     | 说明     | 类型   | 默认值 |
| -------- | -------- | ------ | ------ |
| propName | 属性说明 | string | -      |

## 注意事项

使用注意事项...
```

## 导出组件及类型

在 `src/index.ts` 或 `src/index.esm.ts` 中导出:

```typescript
// 添加导出
export { default as YourComponent } from "./YourComponent";
// 第一种类型导出
export { type YourComponentProps } from "./YourComponent";
// 第二种类型导出
export { type YourComponentProps } from "./YourComponent/interface.ts";
```

## 组件设计原则

### Props 命名规范

```typescript
// 好的命名
interface Props {
  /** 是否禁用 */
  disabled?: boolean;
  /** 加载状态 */
  loading?: boolean;
  /** 自定义类名 */
  className?: string;
  /** 自定义样式 */
  style?: React.CSSProperties;
  /** 子元素 */
  children?: React.ReactNode;
  /** 变化回调 */
  onChange?: (value: any) => void;
}

// 避免的命名
interface Props {
  isDisabled?: boolean; // 使用 disabled
  onValueChange?: void; // 使用 onChange
  customClass?: string; // 使用 className
}
```

### 样式规范

1. 使用 less
2. 使用前缀避免样式冲突
3. 支持通过 className 自定义样式

### 类型定义

```typescript
// 使用 TypeScript
export interface ComponentProps {
  // 完整的类型定义
}
```

## 测试

运行测试:

```bash
npm run test
```

运行测试并监听:

```bash
npm run test:watch
```

运行测试并生成覆盖率:

```bash
npm run test:coverage
```

## 构建

开发模式 (热更新):

```bash
npm run dev
```

构建:

```bash
npm run build
```

## 提交规范

遵循 commitlint 规范:

```bash
git commit -m 'feat: 新增 YourComponent 组件'
```

类型:

- `feat`: 新功能
- `fix`: 修复
- `docs`: 文档
- `style`: 样式
- `refactor`: 重构
- `test`: 测试
- `chore`: 构建
