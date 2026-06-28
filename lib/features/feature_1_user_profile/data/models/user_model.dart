import 'package:flutter_clean_architecture_example/features/feature_1_user_profile/domain/entities/entity.dart';

//I choose not to inherit the User entity class as doing so would tightly couple Model and Entity.
//Also because i want explicit conversion
class UserModel {
  final int userId;
  final String userName;
  final String userEmail;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  //Convert JSON to userModel
  //Named factory constructor-purpose is conversion from JSON to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["id"],
      userName: json["name"],
      userEmail: json["email"],
    );
  }

  //Converts model to Json
  Map<String, dynamic> toJson() {
    return {"id": userId, "name": userName, "email": userEmail};
  }

  //converting to User
  User toUserEntity() {
    return User(id: userId, name: userName, email: userEmail);
  }
}
