

class UserModel{
  String userName;
  String password;
  String description;

  UserModel({required this.userName, required this.password, required this. description});

  factory UserModel.fromJson(Map<String, dynamic>json){

    return UserModel(

      userName: json['username'],
      password: json['password'],
      description: json['description'],
    );
  }

}