---
name: pcloud-utils-usage
description: Use when developer needs to install or use @pointcloud/pcloud-utils browser utility library with cache, IndexedDB, WebSocket, form validation, tree operations, or coordinate transforms.
---

# pcloud-utils Usage Guide

## Overview

TypeScript browser utility library. 13 modules: cache, indexDB, socketEmitter, file, formTest, coordTransform, treeHelper, numHelper, strHelper, fscHelper, http, eventBus, uuid, groupByField.

## Install

```bash
npm install @pointcloud/pcloud-utils
```

```ts
import { cache, uuid, formTest, IndexDB } from "@pointcloud/pcloud-utils";
```

## Core Modules

| Module | Key Functions |
|--------|--------------|
| cache | setCache(key, value, type?), getCache(key, type?), clearCache(key), clearAll(type, keys?) |
| indexDB | openDB(name, version, store), put/get/update/remove(store, data), closeDB() |
| socketEmitter | initWS(url), subscribe(event, fn), execAction(action, data) |
| formTest | ValidatorEmail, ValidatorTel, ValidatorIdCard, ValidatorBankCard |
| treeHelper | flatToTree(list, id, parentId), flatToList(tree), deepFind, wideTraversal |
| coordTransform | bd09togcj02, gcj02tobd09, wgs84togcj02 |

## Quick Examples

### Cache (local/session/cookie)

```ts
cache.setCache("user", { name: "Tom" }, "session");
const user = cache.getCache("user", "session");
cache.clearCache("user");
```

### Form Validation

```ts
formTest.ValidatorEmail("test@example.com"); // true
formTest.ValidatorTel("13800138000");     // true
```

### IndexDB

```ts
const db = await IndexDB.openDB("myDB", 1, "store");
await db.put("store", { key: "id", value: data });
const result = await db.get("store", "id");
```

## Build

```bash
npm run build    # ESM + UMD
npm run doc      # TypeDoc
npm run release  # publish (main branch)
```

## Docs

`docs/index.html` - run `npm run doc` to regenerate