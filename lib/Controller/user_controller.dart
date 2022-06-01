import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchandiser/Model/users.dart';
import 'package:merchandiser/View/Supervisor/home.dart';
import 'package:merchandiser/View/admin/home.dart';

class UserController extends GetxController {

  var users = <usersModel>[].obs;
  var docID = [];
  // late String username, password;
  var isLoad = false.obs;
  var username=TextEditingController();
  var password=TextEditingController();
  final CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  getUsers() async {

    isLoad(true);
    try {
      await userReference.get().then((value) {
        docID.clear();
        value.docs.forEach((element) {
          docID.add(element.id);
        });
      });
      users.clear();
      for (int i = 0; i < docID.length; i++) {
        await userReference.doc(docID[i]).get().then((value) {
          print(value.data());
          if (value.get("username") == username.text.trim().toString() &&
              value.get("password") == password.text.trim().toString()) {
            users.add(usersModel.fromDocumentSnapshot(value));
          }
        });
      }
      isLoad(false);
      print(users.length);
      if (users.isEmpty) {
        Get.snackbar("خطاء", "خطاء في اسم المستخدم او كلمة المرور",
            colorText: Colors.redAccent, snackPosition: SnackPosition.BOTTOM);
      }
      for (int i = 0; i < users.length; i++) {
        if (users[i].type == 0) {
          Get.offAll(() => AD_Home());
        } else if (users[i].type == 1) {
          Get.offAll(() => SU_Home());
        } else if (users[i].type == 2) {
          Get.offAll(() => SU_Home());
        }
      }
    } catch (error) {
      isLoad(false);
      Get.snackbar("خطاء", "خطاء في الاتصال بالشبكة",
          colorText: Colors.redAccent, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
/*
* Stream<QuerySnapshot> stream =
            _laptopRef.where('brand', isEqualTo: 'MI').snapshots();
        return stream.map((snapshot) => snapshot.docs.map((snap) {
              return LaptopModel.fromDocumentSnapshot(snap);
            }).toList());*/
