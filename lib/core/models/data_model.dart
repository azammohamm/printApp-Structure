class DataModel {
  String? key;
  String? value;

  DataModel({this.key, this.value});

  DataModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}