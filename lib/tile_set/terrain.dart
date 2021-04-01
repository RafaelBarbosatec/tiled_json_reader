class Terrain {
  String? name;
  int? tile;

  Terrain.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tile = json['tile'];
  }
}
