class StateModel {
  String district;
  String alias;
  List<String> lgas;

  StateModel({this.district, this.alias, this.lgas});

  StateModel.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    alias = json['alias'];
    lgas = json['lgas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district'] = this.district;
    data['alias'] = this.alias;
    data['lgas'] = this.lgas;
    return data;
  }
}