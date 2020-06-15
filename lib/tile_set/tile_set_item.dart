import 'package:tiledjsonreader/tile_set/frame_animation.dart';
import 'package:tiledjsonreader/tile_set/tile_set_object_group.dart';

class TileSetItem {
  int id;
  String type;
  List<FrameAnimation> animation;
  TileSetObjectGroup objectGroup;

  TileSetItem({this.id, this.objectGroup});

  TileSetItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    objectGroup = json['objectgroup'] != null
        ? new TileSetObjectGroup.fromJson(json['objectgroup'])
        : null;
    if (json['animation'] != null) {
      animation = new List<FrameAnimation>();
      json['animation'].forEach((v) {
        animation.add(new FrameAnimation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.objectGroup != null) {
      data['objectgroup'] = this.objectGroup.toJson();
    }
    return data;
  }
}
