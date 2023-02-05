class ErrorModel {
  String? error;
  Meta? meta;

  ErrorModel({this.error, this.meta});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nexttry'] = nexttry;
    data['suspend'] = suspend;
    return data;
  }
}
