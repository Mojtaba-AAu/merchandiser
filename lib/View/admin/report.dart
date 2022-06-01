import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchandiser/Controller/report_controller.dart';
import 'package:merchandiser/Controller/user_controller.dart';

class AD_Report extends GetWidget<ReportsController> {
  AD_Report({Key? key}) : super(key: key);

  ReportsController _controller = Get.put(ReportsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [const PortfolioSilverAppBar()];
        },
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<ReportsController>(
                  init: Get.put<ReportsController>(ReportsController()),
                  builder: (ReportsController reportcontroller) {
                    if (reportcontroller != null &&
                        reportcontroller.report_m != null) {
                      return Expanded(
                          child: ListView.builder(
                              itemCount: reportcontroller.report_m.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ExpansionTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "المندوب :${reportcontroller.report_m[index].coordinator}"),
                                        Text(
                                            "المتجر :${reportcontroller.report_m[index].store}"),
                                        ConstrainedBox(
                                            constraints:
                                                const BoxConstraints.expand(
                                                    height: 50),
                                            child: Text(
                                                "التاريخ والوقت :  ${reportcontroller.report_m[index].dateTime!.toDate()}"))
                                      ],
                                    ),
                                    children: [
                                      reportcontroller.buildBody(
                                          reportcontroller
                                              .report_m[index].coordinator
                                              .toString(),
                                          reportcontroller
                                              .report_m[index].store
                                              .toString(),
                                          Timestamp.fromDate(reportcontroller.report_m[index].dateTime!.toDate()))
                                    ],
                                  ),
                                );
                              }));
                    } else {
                      return const Text("Loading.....");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
class PortfolioSilverAppBar extends StatelessWidget {
  const PortfolioSilverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      expandedHeight: 250,
      pinned: true,
      floating: true,
      title: const Text("التقارير"),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const EdgeInsets.only(top: 40,left: 5,right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [

                    Wrap(
                      spacing: 30,
                      runSpacing: 15,
                      children: [
                        Container(
                          width: Get.width / 2.5,
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: fNmae,
                              validator: (value) {

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(4),
                                  hintText: "اسم المندوب",
                                  // filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade700,
                                          style: BorderStyle.solid,
                                          width: 2)))
                          ),
                        ),
                        Container(
                          width: Get.width / 2.5,
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: fNmae,
                              validator: (value) {

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(4),
                                  hintText: "اسم المتجر",
                                  // filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade700,
                                          style: BorderStyle.solid,
                                          width: 2)))
                          ),
                        ),
                        Container(
                          width: Get.width / 2.5,
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: fNmae,
                              validator: (value) {

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(4),
                                  hintText: "التاريخ من",
                                  // filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade700,
                                          style: BorderStyle.solid,
                                          width: 2)))
                          ),
                        ),
                        // Spacer(),
                        Container(
                          width: Get.width / 2.5,
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: lNmae,
                              validator: (value) {

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(4),
                                  hintText: "التاريخ الى",
                                  // filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 0)),
                                  focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade700,
                                          style: BorderStyle.solid,
                                          width: 2)))
                          ),
                        )
                      ],
                    ),
                    Center(child: Container(decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black,style: BorderStyle.solid,width: 2),
                    ),child: IconButton(onPressed: (){},icon: Icon(Icons.search),)),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}