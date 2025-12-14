class UserModel {
  String name;
  String email;
  String uId;

  UserModel({required this.name, required this.email, required this.uId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['uId'] = this.uId;
    return data;
  }
}
