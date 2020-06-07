class Polygon {
  double x;
  double y;

  Polygon({this.x, this.y});

  Polygon.fromJson(Map<String, dynamic> json) {
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
