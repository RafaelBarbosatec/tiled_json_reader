class FrameAnimation {
  double? duration;
  int? tileid;

  FrameAnimation({this.duration, this.tileid});

  FrameAnimation.fromJson(Map<String, dynamic> json) {
    duration = double.parse(json['duration'].toString());
    tileid = json['tileid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['tileid'] = this.tileid;
    return data;
  }
}
