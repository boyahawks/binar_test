// ignore_for_file: prefer_const_constructors

import 'package:binar_test/controller/dashboard_controller.dart';
import 'package:binar_test/screen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Interview Binar',
        theme: ThemeData(fontFamily: 'OpenSans'),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadDashboard();
  }

  loadDashboard() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(Dashboard(), binding: BindingsBuilder(() {
      Get.put(DashboardController());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(flex: 40, child: SizedBox()),
                  Expanded(
                      flex: 60,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Text("Loading..."),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              color: Color.fromARGB(255, 0, 23, 229),
                            ),
                          )),
                        ],
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
