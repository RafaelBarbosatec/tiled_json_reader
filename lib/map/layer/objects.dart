class Objects {
  double height;
  int id;
  String name;
  int rotation;
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
    height = double.parse(json['height'].toString());
    id = json['id'];
    name = json['name'];
    rotation = json['rotation'];
    type = json['type'];
    visible = json['visible'];
    width = double.parse(json['width'].toString());
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
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
