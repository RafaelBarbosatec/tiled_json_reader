class Objects {
  double? height;
  int? id;
  int? gid;
  String? name;
  String? type;
  double? rotation;
  bool? visible;
  double? width;
  double? x;
  double? y;
  bool? ellipse;
  bool? point;
  List<Property>? properties;

  Objects({
    this.height,
    this.id,
    this.gid,
    this.name,
    this.rotation,
    this.type,
    this.visible,
    this.width,
    this.x,
    this.y,
    this.properties,
    this.ellipse,
    this.point,
  });

  Objects.fromJson(Map<String, dynamic> json) {
    height = double.tryParse(json['height'].toString()) ?? 0.0;
    id = json['id'];
    ellipse = json['ellipse'] ?? false;
    point = json['point'] ?? false;
    gid = int.tryParse(json['gid'].toString());
    name = json['name'];
    rotation = double.tryParse(json['rotation'].toString()) ?? 0.0;
    type = json['type'];
    visible = json['visible'];
    width = double.tryParse(json['width'].toString()) ?? 0.0;
    x = double.tryParse(json['x'].toString()) ?? 0.0;
    y = double.tryParse(json['y'].toString()) ?? 0.0;
    if (json['properties'] != null) {
      properties = <Property>[];
      json['properties'].forEach((v) {
        properties?.add(new Property.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['gid'] = this.gid;
    data['ellipse'] = this.ellipse;
    data['point'] = this.point;
    data['name'] = this.name;
    data['rotation'] = this.rotation;
    data['type'] = this.type;
    data['visible'] = this.visible;
    data['width'] = this.width;
    data['x'] = this.x;
    data['y'] = this.y;
    if (this.properties != null) {
      data['properties'] = this.properties?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Property {
  String? name;
  String? type;
  dynamic? value;

  Property({this.name, this.type, this.value});

  Property.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
