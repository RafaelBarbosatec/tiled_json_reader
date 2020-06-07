import 'package:tiledjsonreader/tile_set/tile_set.dart';

class TileSetDetail {
  int firsTgId;
  String source;
  TileSet tileSet;

  TileSetDetail({this.firsTgId, this.source, this.tileSet});

  TileSetDetail.fromJson(Map<String, dynamic> json) {
    firsTgId = json['firstgid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstgid'] = this.firsTgId;
    data['source'] = this.source;
    return data;
  }
}
