import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/chnages/GuestList.dart';
import 'package:wedding_planner/chnages/SplashScreen.dart';
import 'package:wedding_planner/screens/other%20Pages/Venue%20Details%20Page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

int setit = 0;
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void openDrawer() {
  print("drawer");
  scaffoldKey.currentState?.openDrawer();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: VenueView(),
          builder: EasyLoading.init(),
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
        );
      },
    );
  }
}
