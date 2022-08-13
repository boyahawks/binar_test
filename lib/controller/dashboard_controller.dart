import 'dart:convert';
import 'package:binar_test/model/produk_model.dart';
import 'package:binar_test/utils/api.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardController extends GetxController {
  var shortestSide = MediaQuery.of(Get.context!).size.shortestSide;
  var orientation = MediaQuery.of(Get.context!).orientation.obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  var allData = [].obs;
  var detil = {}.obs;
  var jumlahData = 0.obs;

  void onInit() async {
    getData();
    super.onInit();
  }

  getData() {
    var connect = Api.connectionApi("get", {}, "products");
    if (allData.value.isEmpty) {
      print("kesini 1");
      connect.then((dynamic res) {
        if (res.statusCode == 200) {
          var getData = jsonDecode(res.body);
          allData.value = getData.sublist(0, 4);
        }
      });
    } else {
      print("kesini 2");
      int count = allData.value.length;
      int count2 = count + 4;
      connect.then((dynamic res) {
        if (res.statusCode == 200) {
          var getData = jsonDecode(res.body);
          if (getData.length == allData.value.length) {
            var snackBar = SnackBar(content: Text('Selesai load data...'));
            ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          } else {
            var value = getData.sublist(count, count2);
            for (var element in value) {
              allData.value.add(element);
            }
          }
        }
      });
    }
  }
}
