import 'package:cloud_firestore/cloud_firestore.dart';

class usersModel {
  String? userName;
  String? password;
  String? email;
  String? phone;
  int? type;
  String? suID;

  usersModel(
      {this.userName,
      this.password,
      this.email,
      this.phone,
      this.type,
      this.suID});

  usersModel.fromDocumentSnapshot(DocumentSnapshot  snapshot) {
    userName = snapshot["username"];
    password = snapshot["password"];
    email = snapshot["email"];
    phone = snapshot["phone"];
    type = snapshot["type"];
    suID = snapshot["suID"];
  }
  toJson() {
    return {
      "username": userName,
      "password": password,
      "email": email,
      "phone": phone,
      "type": type,
      "suID": suID
    };
  }
}
