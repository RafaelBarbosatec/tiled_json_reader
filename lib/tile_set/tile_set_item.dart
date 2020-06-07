import 'package:tiledjsonreader/tile_set/tile_set_object_group.dart';

class TileSetItem {
  int id;
  TileSetObjectGroup objectGroup;

  TileSetItem({this.id, this.objectGroup});

  TileSetItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectGroup = json['objectgroup'] != null
        ? new TileSetObjectGroup.fromJson(json['objectgroup'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.objectGroup != null) {
      data['objectgroup'] = this.objectGroup.toJson();
    }
    return data;
  }
}
