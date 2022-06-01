import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchandiser/Model/reports.dart';
import 'package:merchandiser/View/admin/home.dart';

class ReportsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    rxReport.bindStream(getReports());
  }
//Display Firebase data in a Listview without DUPLICATES in it
  Rx<List<Report>> rxReport = Rx<List<Report>>([]);

  List<Report> get report_m => rxReport.value;

  final CollectionReference reportReference =
  FirebaseFirestore.instance.collection("reports");

  Stream<List<Report>> getReports() {
    return reportReference.snapshots().map((event) {
      List<Report> retVal = [];
      event.docs.forEach((element) {
        print(element.id);
        retVal.add(Report.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  var record = <Report>[];

  Widget buildBody(String coordenator, String store,Timestamp Date) {
    return StreamBuilder<QuerySnapshot>(
      stream: reportReference
          .where("coordinator", isEqualTo: coordenator)
          .where("store", isEqualTo: store).where("dateTime",isEqualTo: Date)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        buildList(snapshot.data!.docs);
        return Container(
          color: Colors.blueGrey.shade400,
          child: Column(
            children: [
              Container(
                color: Colors.blue.shade300,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('المنتج')),
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('الوصف')),
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('التوفر')),
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('الانتهاء')),
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('الرف')),
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('المستودع')),
                      ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text('الاجمالي')),
                    ]),
              ),

              Container(
                height: 100,
                child: ListView.builder(itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].product.toString())),
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].desc.toString())),
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].availaple.toString())),
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].ending!.toDate().toString())),
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].rack.toString())),
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].warehouse.toString())),
                            ConstrainedBox(constraints: BoxConstraints.expand(width: 50,height: 50),child: Text(record[index].total.toString())),
                          ]);;
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  buildList(List<DocumentSnapshot> snapshot) {
    record.clear();
    snapshot.forEach((data) {
      print("data.id///////////////////////////////////${data.id}");


      record.add(Report.fromDocumentSnapshot(data));
    });
  }

  Widget _buildListItem(DocumentSnapshot data) {
    final record = Report.fromDocumentSnapshot(data);

    return Row(children: [
      Text(record.product.toString()),
      Text(record.desc.toString()),
      Text(record.availaple.toString()),
      Text(record.ending!.toDate().toString()),
      Text(record.rack.toString()),
      Text(record.warehouse.toString()),
      Text(record.total.toString()),
    ]);
  }
}
/*
*  Widget buildBody(String coordenator, String store) {
    return StreamBuilder<QuerySnapshot>(
      stream: reportReference
          .where("coordinator", isEqualTo: coordenator)
          .where("store", isEqualTo: store)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return DataTable(
            columns: const [
          DataColumn(label: Text('المنتج')),
          DataColumn(label: Text('الوصف')),
          DataColumn(label: Text('التوفر')),
          DataColumn(label: Text('الانتهاء')),
          DataColumn(label: Text('الرف')),
          DataColumn(label: Text('المستودع')),
          DataColumn(label: Text('الاجمالي')),
        ], rows: _buildList(context, snapshot.data!.docs));
      },
    );
  }

  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Report.fromDocumentSnapshot(data);

    return DataRow(cells: [
      DataCell(Text(record.product.toString())),
      DataCell(Text(record.desc.toString())),
      DataCell(Text(record.availaple.toString())),
      DataCell(Text(record.ending!.toDate().toString())),
      DataCell(Text(record.rack.toString())),
      DataCell(Text(record.warehouse.toString())),
      DataCell(Text(record.total.toString())),
    ]);
  }*/
/*
* var record=<Report>[];
  Widget buildBody(String coordenator, String store) {
    return StreamBuilder<QuerySnapshot>(
      stream: reportReference
          .where("coordinator", isEqualTo: coordenator)
          .where("store", isEqualTo: store)
          .snapshots(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return LinearProgressIndicator();
        buildList(snapshot.data!.docs);
        return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
              Text('المنتج'),
              Text('الوصف'),
              Text('التوفر'),
              Text('الانتهاء'),
              Text('الرف'),
              Text('المستودع'),
              Text('الاجمالي'),
            ]),

          Container(
            height: 100,
            child: ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (BuildContext context,index){
              return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text(record[index].product.toString()),
                Text(record[index].desc.toString()),
                Text(record[index].availaple.toString()),
                Text(record[index].ending!.toDate().toString()),
                Text(record[index].rack.toString()),
                Text(record[index].warehouse.toString()),
                Text(record[index].total.toString()),
              ]);;
            }),
          )
          ],
        );
      },
    );
  }

  buildList(List<DocumentSnapshot> snapshot) {
     snapshot.forEach((data) {
       print("data.id///////////////////////////////////${data.id}");

       record.clear();
     record.add(Report.fromDocumentSnapshot(data));});
  }

  Widget _buildListItem(DocumentSnapshot data) {
    final record = Report.fromDocumentSnapshot(data);

    return Row(children: [
      Text(record.product.toString()),
      Text(record.desc.toString()),
      Text(record.availaple.toString()),
      Text(record.ending!.toDate().toString()),
      Text(record.rack.toString()),
      Text(record.warehouse.toString()),
      Text(record.total.toString()),
    ]);
  }*/