---
name: image-annotation-usage
description: Use when integrating @frank17008/image-annotation React component into web applications, including basic setup, controlled/uncontrolled mode, custom image upload, styling, or debugging annotation rendering issues, canvas blank problems, or annotations not updating.
---

# Image Annotation Component Usage

## Overview

`@frank17008/image-annotation` is a React + TypeScript image annotation component with Canvas 2D. Supports rectangle, circle, arrow, text, and freehand tools with undo/redo, drag, export, keyboard shortcuts, zoom/pan, and DPR-aware rendering.

**Package location:** `packages/image-annotation/src/`
**Published path:** `@frank17008/image-annotation`

## When to Use

Trigger phrases:
- "How to integrate image annotation component"
- "Add annotation to my React app"
- "Canvas blank even though image loads"
- "Annotations not saving"
- "Custom image upload with annotation"
- "Controlled mode not working"
- "HiDPI/Retina display blurry"

## Installation

```bash
pnpm add @frank17008/image-annotation
# or
npm install @frank17008/image-annotation
```

## Basic Integration

### Minimal Setup

```tsx
import { useState } from 'react';
import { ImageAnnotation, type Annotation } from '@frank17008/image-annotation';
import '@frank17008/image-annotation/dist/index.css';

export default function App() {
  const [annotations, setAnnotations] = useState<Annotation[]>([]);

  return (
    <div style={{ height: 600 }}>
      <ImageAnnotation
        src="https://example.com/image.jpg"
        onChange={setAnnotations}
      />
    </div>
  );
}
```

**Critical:** Parent container MUST have explicit height. Without it, canvas has 0×0 dimensions → blank canvas.

### Type Import

Always use explicit type import for TypeScript:

```tsx
import type { Annotation, ToolType } from '@frank17008/image-annotation';
// or
import { type Annotation, type ToolType } from '@frank17008/image-annotation';
```

## Controlled vs Uncontrolled Mode

### Uncontrolled (Default)

```tsx
<ImageAnnotation
  src="image.jpg"
  onChange={(annotations) => console.log(annotations)}
/>
```

The component manages its own state internally.

### Controlled (External State)

```tsx
const [myAnnotations, setMyAnnotations] = useState<Annotation[]>([]);

<ImageAnnotation
  src="image.jpg"
  value={myAnnotations}
  onChange={setMyAnnotations}
/>
```

**Rules:**
1. `value` → external annotations (read-only for component)
2. `onChange` → called when annotations change
3. If both `value` and `onChange` provided → controlled mode
4. If neither → uncontrolled mode
5. If only `value` without `onChange` → React warning

### Sync Controlled to Uncontrolled

```tsx
<ImageAnnotation
  src={src}
  value={annotations}
  onChange={(newAnnotations) => {
    setAnnotations(newAnnotations);
    // Save to backend, localStorage, etc.
    saveToBackend(newAnnotations);
  }}
/>
```

## Custom Image Upload

### Pattern 1: External Button

```tsx
import { useState, useRef } from 'react';
import { ImageAnnotation } from '@frank17008/image-annotation';

export function ImageUploader() {
  const [imageSrc, setImageSrc] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (event) => {
      const result = event.target?.result;
      if (typeof result === 'string') {
        setImageSrc(result); // base64 string
      }
    };
    reader.readAsDataURL(file);
    e.target.value = ''; // reset for same file re-select
  };

  return (
    <div style={{ height: 600 }}>
      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        onChange={handleFileChange}
        style={{ display: 'none' }}
      />
      <button onClick={() => fileInputRef.current?.click()}>
        Upload Image
      </button>
      {imageSrc && (
        <ImageAnnotation
          src={imageSrc}
          onChange={() => {}}
        />
      )}
    </div>
  );
}
```

### Pattern 2: Component's Upload Button

```tsx
const handleUpload = () => fileInputRef.current?.click();

<ImageAnnotation
  src={imageSrc}
  onChange={setAnnotations}
  onUpload={handleUpload}
/>
```

The component displays an upload button in toolbar when `onUpload` is provided.

## Annotation Types Reference

```typescript
// Rectangle annotation
{ type: 'rectangle', x: number, y: number, width: number, height: number, color: string, lineWidth?: number }

// Circle annotation
{ type: 'circle', x: number, y: number, radius: number, color: string, lineWidth?: number }

// Arrow annotation
{ type: 'arrow', x: number, y: number, toX: number, toY: number, color: string, lineWidth?: number }

// Text annotation
{ type: 'text', x: number, y: number, text: string, color: string, lineWidth?: number }

// Freehand annotation
{ type: 'freehand', points: Array<{ x: number, y: number }>, color: string, lineWidth?: number }
```

### Type Export

```typescript
import type {
  Annotation,
  RectangleAnnotation,
  CircleAnnotation,
  ArrowAnnotation,
  TextAnnotation,
  FreehandAnnotation,
  ToolType,
  Point,
} from '@frank17008/image-annotation';
```

## Props API

| Prop | Type | Required | Description |
|------|------|----------|--------------|
| `src` | `string` | ✅ | Image URL or base64 |
| `value` | `Annotation[]` | ❌ | Controlled annotations |
| `onChange` | `(annotations: Annotation[]) => void` | ❌ | Annotation change callback |
| `className` | `string` | ❌ | Container className |
| `onUpload` | `() => void` | ❌ | Upload button callback |

## Zoom and Pan

### Programmatic Zoom

```tsx
const handleZoomIn = () => {
  // Component doesn't expose zoom API directly
  // Use keyboard shortcuts: Ctrl++
};

// Or via keyboard shortcuts (user must press):
// - Ctrl++ : Zoom in
// - Ctrl+- : Zoom out
// - Ctrl+0 : Reset zoom
```

### Space + Drag Pan

Hold Space + drag to pan the canvas.

### Zoom Ratio Display

The toolbar shows current zoom percentage (e.g., "100%", "150%").

## Exporting Annotations

### On Change Callback

```tsx
<ImageAnnotation
  src={src}
  onChange={(annotations) => {
    // Save to database
    await saveAnnotations(imageId, annotations);

    // Or export as JSON
    const json = JSON.stringify(annotations, null, 2);
    download(json, 'annotations.json', 'application/json');
  }}
/>
```

### Export Image with Annotations

Use the toolbar's export button, or programmatically:

```typescript
import { download } from '@frank17008/image-annotation';
// Not currently exported - use toolbar button
```

## Keyboard Shortcuts

| Shortcut | Action |
|---------|--------|
| Delete | Delete selected annotation |
| Escape | Cancel text input |
| Ctrl+Z | Undo |
| Ctrl+Y / Ctrl+Shift+Z | Redo |
| Ctrl++ / Ctrl+= | Zoom in |
| Ctrl+- | Zoom out |
| Ctrl+0 | Reset zoom |
| Space + Drag | Pan canvas |

## Styling Customization

### CSS Variables

```css
:root {
  --annotation-primary: #FF0000;
  --annotation-toolbar-bg: #FFFFFF;
}
```

### Container Styling

```tsx
<ImageAnnotation
  src={src}
  className="my-annotation-container"
/>
```

```css
.my-annotation-container {
  border: 1px solid #ddd;
  border-radius: 8px;
}
```

## Debugging Common Issues

### Issue 1: Canvas Completely Blank

**Symptoms:**
- Image loads successfully (network request completes)
- Canvas area is empty/white

**Root Causes and Solutions:**

| Cause | Diagnosis | Fix |
|-------|-----------|-----|
| **Parent has no height** | Container has `height: auto` or no height set | Set explicit height: `style={{ height: 600 }}` |
| **DPR mismatch** | Retina/HiDPI display, canvas looks tiny | Component handles DPR automatically |
| **Image load error** | Check browser console for CORS errors | Add `crossOrigin="anonymous"` to server |
| **Zero canvas size** | Check canvas element dimensions | Ensure parent has explicit dimensions |

### Issue 2: Annotations Not Saving

**Symptoms:**
- Draw annotations but array remains empty
- `onChange` callback never fires

**Root Causes and Solutions:**

| Cause | Diagnosis | Fix |
|-------|-----------|-----|
| **Stale state** | Using `prev => prev` incorrectly | Pass new array directly: `setAnnotations(newValue)` |
| **Missing onChange** | No callback provided | Add `onChange={setAnnotations}` |
| **Controlled conflict** | Both `value` and internal state | Provide `onChange` with `value` |

**Correct pattern:**

```tsx
// WRONG - stale closure
onChange={(annotations) => {
  setAnnotations((prev) => [...prev, ...annotations]);
}}

// CORRECT - direct assignment
onChange={setAnnotations}
```

### Issue 3: Blurry on HiDPI/Retina Displays

**Diagnosis:**
- Canvas appears blurry or pixelated
- Only happens on Retina displays

**Root Cause:** Missing devicePixelRatio scaling

**Fix:** The component handles DPR automatically since v1.x. Ensure:
1. CSS import is included
2. Parent container has proper dimensions

### Issue 4: High-DPI Canvas Blank

**Symptoms:**
- Works on standard displays
- Blank on Retina/HiDPI

**Root Cause:** Canvas dimensions not scaled by devicePixelRatio

**Diagnosis:**
```javascript
// In browser console
const canvas = document.querySelector('canvas');
console.log('Canvas size:', canvas.width, canvas.height);
console.log('Display size:', canvas.style.width, canvas.style.height);
console.log('DPR:', window.devicePixelRatio);
```

If `canvas.width === canvas.style.width` (not multiplied by DPR), this is the bug.

### Issue 5: Text Annotation Not Updating

**Symptoms:**
- Text tool selected
- Click to add text
- Text doesn't appear or doesn't save

**Solution:** Press Enter or click outside to commit text input.

### Issue 6: Undo/Redo Not Working

**Symptoms:**
- Press Ctrl+Z but nothing happens

**Root Cause:** No history to undo (first annotation can't be undone)

### Issue 7: SSR/Next.js Issues

**Symptoms:**
- "window is not defined"
- Canvas only renders client-side

**Solution:**

```tsx
'use client';
import dynamic from 'next/dynamic';

const ImageAnnotation = dynamic(
  () => import('@frank17008/image-annotation').then((mod) => mod.default),
  { ssr: false }
);
```

## Build Commands

```bash
pnpm build:lib      # Build package to dist/
pnpm dev:lib       # Watch mode for library
pnpm start         # Run demo app
pnpm build:all    # Build everything
```

## Dependencies

- React 18+
- TypeScript 4.5+
- Canvas 2D API

## Common Mistakes

### ❌ Forgetting CSS Import

```tsx
// MISSING - component won't render correctly
import { ImageAnnotation } from '@frank17008/image-annotation';

// REQUIRED
import '@frank17008/image-annotation/dist/index.css';
```

### ❌ Parent Without Height

```tsx
// WRONG - canvas has 0x0
<div><ImageAnnotation src="..." /></div>

// CORRECT - explicit height
<div style={{ height: 600 }}><ImageAnnotation src="..." /></div>
```

### ❌ Wrong Type Import

```tsx
// WRONG
import { Annotation } from '@frank17008/image-annotation';

// CORRECT
import type { Annotation } from '@frank17008/image-annotation';
```

### ❌ Not Linking onChange with value

```tsx
// WRONG - controlled without onChange (React warning)
<ImageAnnotation src="..." value={annotations} />

// CORRECT - controlled mode
<ImageAnnotation
  src="..."
  value={annotations}
  onChange={setAnnotations}
/>
```

## Performance Tips

### Large Images

For images > 5MB:
1. Resize before passing to component
2. Use appropriate container dimensions
3. Consider lazy loading

### Many Annotations (>100)

The component redraws on each change. For performance:
1. Reduce lineWidth
2. Simplify freehand paths (reduce point count)