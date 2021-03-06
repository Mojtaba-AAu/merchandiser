import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchandiser/View/admin/rep.dart';
import 'package:merchandiser/View/admin/report.dart';

class SU_Home extends StatelessWidget {
  SU_Home({Key? key}) : super(key: key);
  String email="";
  String mobile="";
  final user=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hom"),),
      backgroundColor: Colors.blueGrey.shade200,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 5,
                  color: Colors.blue.shade200,
                  child: ListTile(
                    title: Text("الاسم"),
                    subtitle: Text("ااا"),
                    onTap: (){

                    },
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 5,
                  color: Colors.blue.shade200,
                  child: ListTile(
                    title: Text("التقارير"),
                    subtitle: Text("إضغط هنا لإدرة التقارير واستعراضها"),
                    onTap: (){
                      Get.to(()=>report());
                    },
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 5,
                  color: Colors.blue.shade200,
                  child: const ListTile(
                    title: Text("إدارة المستخدمين"),
                    subtitle: Text("إضغط هنا لإدارة الموظفين"),
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 5,
                  color: Colors.blue.shade200,
                  child: const ListTile(
                    title: Text("إدارة المنتجات"),
                    subtitle: Text("إضغط هنا لإضافة/إزالة/تعديل المنتجات"),
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 5,
                  color: Colors.blue.shade200,
                  child: const ListTile(
                    title: Text("إدارة المتاجر والعلامات التجارية"),
                    subtitle: Text("إضغط هنا لإضافة او إزالة المتاجر او العلامات التجارية"),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),

                child: Card(
                  elevation: 5,
                  child: MaterialButton(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 40.0),
                        child: Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                              color: Colors.black,
                              // fontSize: 25.0,
                              fontFamily: 'Cairo'),
                        ),
                      ),
                      onPressed: (){

                      }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
_editUser(email,mobile,user){
  return Form(
    key: user,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 5.0,
              left: 25.0,
              right: 25.0),
          child: TextFormField(
            // controller: email,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person,),
                // icon: Icon(Icons.person),
                contentPadding: const EdgeInsets.all(4),
                hintText: "إسم المستخدم",
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid,
                        width: 2)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 2))),
            validator: (value) {
              if (value!.isEmpty) {
                return "ادخل اسم المستخدم";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 50.0,
              left: 25.0,
              right: 25.0),
          child: TextFormField(
            // controller: mobile,
            obscureText: true,
            decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.password),
                // icon: Icon(Icons.person),
                contentPadding: EdgeInsets.all(4),
                hintText: " كلمة المرور",
                filled: true,
                fillColor: Colors.grey.shade300,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        style: BorderStyle.solid,
                        width: 2)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 2))),
            validator: (value) {
              if (value!.isEmpty) {
                return "ادخل كلمة المرور";
              }
              return null;
            },
          ),
        ),
        // Container(child: Text(False?"رقم الهاتف غير صحيح":"",style: TextStyle(color: Colors.red,fontFamily: 'Cairo'),),)
      ],
    ),
  );
}