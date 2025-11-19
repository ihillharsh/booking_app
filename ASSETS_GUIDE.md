# Assets Management Guide

This project uses `flutter_gen` for type-safe asset management.

## Folder Structure

```
assets/
├── images/     # PNG, JPG, WebP images
├── icons/      # SVG icons
└── fonts/      # TTF, OTF font files
```

## Usage

### 1. Adding Assets

**Images:**
- Place image files in `assets/images/`
- Example: `assets/images/logo.png`

**Icons (SVGs):**
- Place SVG files in `assets/icons/`
- Example: `assets/icons/home.svg`

**Fonts:**
- Place font files in `assets/fonts/`
- Update `pubspec.yaml` fonts section with your font family
- Example:
```yaml
fonts:
  - family: Poppins
    fonts:
      - asset: assets/fonts/Poppins-Regular.ttf
      - asset: assets/fonts/Poppins-Bold.ttf
        weight: 700
```

### 2. Generate Asset Classes

After adding new assets, run:

```bash
flutter pub get
fluttergen
```

Note: If `fluttergen` command is not found, activate it globally first:

```bash
dart pub global activate flutter_gen
```

### 3. Using Generated Assets in Code

**Images:**
```dart
import 'package:app_initial_structure/gen/assets.gen.dart';

// Using Image widget
Image.asset(Assets.images.logo.path)

// Or directly
Assets.images.logo.image(
  width: 100,
  height: 100,
  fit: BoxFit.cover,
)
```

**SVG Icons:**
```dart
import 'package:app_initial_structure/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Using SvgPicture
Assets.icons.home.svg(
  width: 24,
  height: 24,
  color: Colors.blue,
)
```

**Fonts:**
```dart
import 'package:app_initial_structure/gen/fonts.gen.dart';

Text(
  'Hello World',
  style: TextStyle(
    fontFamily: FontFamily.poppins,
    fontSize: 16,
  ),
)
```

## Benefits

- **Type Safety**: No more typos in asset paths
- **Auto-completion**: IDE suggestions for all assets
- **Compile-time Errors**: Missing assets are caught during development
- **Refactoring**: Easy to rename or move assets

## Configuration

The flutter_gen configuration is in `pubspec.yaml`:
- Generated files location: `lib/gen/`
- Assets class name: `Assets`
- Fonts class name: `FontFamily`
- SVG support: Enabled via `flutter_svg` integration

## Notes

- Always run `flutter pub get` after modifying `pubspec.yaml`
- Run build_runner after adding new assets
- Generated files are in `lib/gen/` - don't edit them manually
- The `.gitkeep` files in asset folders can be removed once you add real assets
