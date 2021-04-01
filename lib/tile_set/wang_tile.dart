class WangTile {
  int? tileId;
  List<int>? wangId;

  WangTile.fromJson(Map<String, dynamic> json) {
    tileId = json['tileid'];
    if (json['wangid'] != null) {
      wangId = <int>[];
      json['wangid'].forEach((v) {
        wangId?.add(v);
      });
    }
  }
}
