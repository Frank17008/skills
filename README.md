# Skills Collection

Custom skills for OpenCode agent to help integrate and use various npm packages.

## Available Skills

| Skill | Package | Description |
|-------|---------|-------------|
| `react-jsmind-usage` | `@frank17008/react-jsmind` | React mind map component with JsMind |
| `image-annotation-usage` | `@frank17008/image-annotation` | Image annotation/labeling React component |
| `pcloud-utils-usage` | `@pointcloud/pcloud-utils` | Browser utility library (cache, IndexedDB, WebSocket, form validation, coordinate transforms, tree operations) |
| `pcloud-components-usage` | `@pointcloud/pcloud-components` | UI component library |

## Usage

When working with these packages in OpenCode, the relevant skill will automatically activate to provide:

- Installation guidance
- Correct import patterns
- Type definitions
- Common usage examples
- Troubleshooting tips

## Adding New Skills

To add a new skill, create a directory with a `SKILL.md` file:

```
skills/
├── your-skill-name/
│   └── SKILL.md
└── README.md
```

The SKILL.md should include:
- `name`: skill identifier
- `description`: when to use this skill
- Usage documentation with examples