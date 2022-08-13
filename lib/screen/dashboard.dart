// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'package:binar_test/controller/dashboard_controller.dart';
import 'package:binar_test/screen/detil_product.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardinState();
}

class _DashboardinState extends State<Dashboard> {
  // final GlobalKey _scaffoldKey = new GlobalKey();

  _DashboardinState createState() => _DashboardinState();

  final controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: DoubleBackToCloseApp(
        snackBar: SnackBar(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  'Tap back again to leave',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(),
            ),
            Expanded(
              flex: 90,
              child: list(),
            )
          ],
        ),
      ),
    ));
  }

  Widget list() {
    return Obx(
      () => Padding(
          padding: controller.shortestSide < 600
              ? EdgeInsets.only(left: 16, right: 16)
              : EdgeInsets.only(left: 40, right: 40),
          child: SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            header: WaterDropHeader(),
            onLoading: () async {
              await Future.delayed(Duration(milliseconds: 1000));
              setState(() {
                controller.getData();
                controller.refreshController.loadComplete();
              });
            },
            controller: controller.refreshController,
            child: controller.allData.value.isEmpty
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Padding(
                            child: Container(
                                child:
                                    CircularProgressIndicator(strokeWidth: 3),
                                width: 35,
                                height: 35),
                            padding: EdgeInsets.only(bottom: 16)),
                        Padding(
                            child: Text(
                              'Please wait …',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.only(bottom: 4))
                      ]))
                : ListView.builder(
                    itemCount: controller.allData.value.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.detil.value =
                                  controller.allData.value[index];
                              Get.to(DetilProduk());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                boxShadow: kElevationToShadow[2],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 40,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Row(
                                              children: [
                                                Icon(Icons
                                                    .attach_money_outlined),
                                                Text(
                                                    "${controller.allData.value[index]['price']}"),
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Image.network(
                                              controller.allData.value[index]
                                                  ['image'],
                                              height: 150.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 60,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              controller.allData.value[index]
                                                  ['title'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(controller
                                                        .allData
                                                        .value[index]
                                                            ['description']
                                                        .length >
                                                    150
                                                ? '${controller.allData.value[index]['description'].substring(0, 150)}...'
                                                : controller
                                                        .allData.value[index]
                                                    ['description']),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(Icons.star),
                                                  Text(
                                                    "${controller.allData.value[index]['rating']['rate']}",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    }),
          )),
    );
  }
}
