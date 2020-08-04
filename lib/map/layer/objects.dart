class Objects {
  double height;
  int id;
  String name;
  double rotation;
  String type;
  bool visible;
  double width;
  double x;
  double y;

  Objects(
      {this.height,
      this.id,
      this.name,
      this.rotation,
      this.type,
      this.visible,
      this.width,
      this.x,
      this.y});

  Objects.fromJson(Map<String, dynamic> json) {
    height = double.tryParse(json['height'].toString()) ?? 0.0;
    id = json['id'];
    name = json['name'];
    rotation = double.tryParse(json['rotation'].toString()) ?? 0.0;
    type = json['type'];
    visible = json['visible'];
    width = double.tryParse(json['width'].toString()) ?? 0.0;
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['name'] = this.name;
    data['rotation'] = this.rotation;
    data['type'] = this.type;
    data['visible'] = this.visible;
    data['width'] = this.width;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
