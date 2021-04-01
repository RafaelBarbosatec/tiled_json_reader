class WangTile {
  int? tileid;
  List<int>? wangid;

  WangTile.fromJson(Map<String, dynamic> json) {
    tileid = json['tileid'];
    if (json['wangid'] != null) {
      wangid = <int>[];
      json['wangid'].forEach((v) {
        wangid?.add(v);
      });
    }
  }
}
