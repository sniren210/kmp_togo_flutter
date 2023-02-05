class ErrorModel {
  String? error;
  Meta? meta;

  ErrorModel({this.error, this.meta});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Meta {
  String? nexttry;
  bool? suspend;

  Meta({this.nexttry, this.suspend});

  Meta.fromJson(Map<String, dynamic> json) {
    nexttry = json['nexttry'];
    suspend = json['suspend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nexttry'] = this.nexttry;
    data['suspend'] = this.suspend;
    return data;
  }
}
