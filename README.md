# TiledJsonReader

Reader of the Tiled file .json

# Usage
To use this plugin, add `tiledjsonreader` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
flutter:
  assets:
    - assets/map.json
    - assets/tile_set.json
```

```dart
import 'package:tiledjsonreader/tiledjsonreader.dart';

TiledJsonReader tiled = TiledJsonReader('assets/map.json');
tiled.read().then((map) {
  print(map);
});
```

