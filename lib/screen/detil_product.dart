import 'package:binar_test/controller/dashboard_controller.dart';
import 'package:binar_test/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetilProduk extends StatelessWidget {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: SafeArea(
          child: Padding(
            padding: controller.shortestSide < 600
                ? EdgeInsets.only(left: 16, right: 16)
                : EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.network(
                    controller.detil.value['image'],
                    height: 150.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  controller.detil.value['title'],
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  controller.detil.value['category'],
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(controller.detil.value['description']),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Icon(Icons.attach_money_outlined),
                          Text("${controller.detil.value['price']}",
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    Icon(Icons.star),
                    Text(
                      "${controller.detil.value['rating']['rate']}",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
