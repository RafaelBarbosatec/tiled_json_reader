import 'package:tiledjsonreader/map/layer/objects.dart';
import 'package:tiledjsonreader/tile_set/frame_animation.dart';
import 'package:tiledjsonreader/tile_set/tile_set_object_group.dart';

class TileSetItem {
  int? id;
  String? typeOrClass;
  String? image;
  double? imageHeight;
  double? imageWidth;
  double? probability;
  List<int>? terrain;
  List<FrameAnimation>? animation;
  TileSetObjectGroup? objectGroup;
  List<Property>? properties;

  TileSetItem({this.id, this.objectGroup});

  TileSetItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeOrClass = json['type'] ?? json['class'];
    image = json['image'];
    imageHeight = double.tryParse(json['imageheight'].toString());
    imageWidth = double.tryParse(json['imagewidth'].toString());
    probability = double.tryParse(json['probability'].toString());
    if (json['terrain'] != null) {
      terrain = <int>[];
      json['terrain'].forEach((v) {
        terrain?.add(v);
      });
    }
    objectGroup = json['objectgroup'] != null
        ? TileSetObjectGroup.fromJson(json['objectgroup'])
        : null;
    if (json['animation'] != null) {
      animation = <FrameAnimation>[];
      json['animation'].forEach((v) {
        animation?.add(FrameAnimation.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Property>[];
      json['properties'].forEach((v) {
        properties?.add(Property.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['typeOrClass'] = this.typeOrClass;
    if (this.objectGroup != null) {
      data['objectgroup'] = this.objectGroup?.toJson();
    }
    return data;
  }
}
