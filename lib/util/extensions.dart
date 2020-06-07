
import 'package:tiledjsonreader/map/layer/type_layer.dart';

extension StringrExtension on String {
  TypeLayer getTypeLayer() {
    switch (this) {
      case 'tilelayer':
        return TypeLayer.tilelayer;
        break;
      case 'objectgroup':
        return TypeLayer.objectgroup;
        break;
      default:
        return null;
    }
  }
}

extension TypeLayerExtension on TypeLayer {
  String getName() {
    return this.toString().replaceAll('TypeLayer.', '');
  }
}
