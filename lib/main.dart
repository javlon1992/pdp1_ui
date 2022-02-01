import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdp1_ui/pages/Intro_Page.dart';
import 'package:pdp1_ui/pages/amazon_ui.dart';
import 'package:pdp1_ui/pages/app_bar.dart';
import 'package:pdp1_ui/pages/apple_products.dart';
import 'package:pdp1_ui/pages/car_task.dart';
import 'package:pdp1_ui/pages/facebook_ui.dart';
import 'package:pdp1_ui/pages/home_page.dart';
import 'package:pdp1_ui/pages/hotel_task.dart';
import 'package:pdp1_ui/pages/instagram_ui.dart';
import 'package:pdp1_ui/pages/party_ui.dart';
import 'package:pdp1_ui/pages/pin_code.dart';
import 'package:pdp1_ui/pages/task_01_02_2022.dart';
import 'package:pdp1_ui/pages/task_ui.dart';
import 'boshqa_rang.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /// #orintationni bloklash uchun
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InstagramUI(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        BoshqaRang.id:(context)=>const BoshqaRang(),
        AppBarr.id:(context)=>const AppBarr(),
        ApplePage.id:(context)=>const ApplePage(),
        IntroPage.id:(context)=>const IntroPage(),
        TaskUi.id:(context)=>const TaskUi(),
        CarTask.id:(context)=>const CarTask(),
        HotelPage.id:(context)=>const HotelPage(),
        PartyPage.id:(context)=>const PartyPage(),
        AmazonUi.id:(context)=>const AmazonUi(),
        PinCode.id:(context)=>const PinCode(phoneNumber: "+998908175292",),
        FacebookUI.id:(context)=>const FacebookUI(),
        InstagramUI.id:(context)=>const InstagramUI(),
        TaskExam.id:(context)=>const TaskExam(),
      },
    );
  }
}

