import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/Intro_Page.dart';
import 'package:pdp1_ui/pages/amazon_ui.dart';
import 'package:pdp1_ui/pages/app_bar.dart';
import 'package:pdp1_ui/pages/apple_products.dart';
import 'package:pdp1_ui/pages/car_task.dart';
import 'package:pdp1_ui/pages/home_page.dart';
import 'package:pdp1_ui/pages/hotel_task.dart';
import 'package:pdp1_ui/pages/party_ui.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PartyPage(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        BoshqaRang.id:(context)=>const BoshqaRang(),
        AppBarr.id:(context)=>const AppBarr(),
        ApplePage.id:(context)=>const ApplePage(),
        IntroPage.id:(context)=>const IntroPage(),
        TaskUi.id:(context)=>const TaskUi(),
        CarTask.id:(context)=>const CarTask(),
        HotelPage.id:(contex)=>const HotelPage(),
        PartyPage.id:(contex)=>const PartyPage(),
        AmazonUi.id:(contex)=>const AmazonUi(),
      },
    );
  }
}

