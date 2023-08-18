// import 'dart:convert';

// List<SampleModel> sampleModelFromJson(String str) => List<SampleModel>.from(json.decode(str).map((x) => SampleModel.fromJson(x)));

// String sampleModelToJson(List<SampleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleModel {
  int? id;
  String? name;
  String? address;
  String? email;
  int? mobile;

  SampleModel({this.id, this.name, this.address, this.email, this.mobile});

  SampleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    return data;
  }
}
