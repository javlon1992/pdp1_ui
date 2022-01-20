import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/Intro_Page.dart';
import 'package:pdp1_ui/pages/app_bar.dart';
import 'package:pdp1_ui/pages/apple_products.dart';
import 'package:pdp1_ui/pages/home_page.dart';
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
      home: const ApplePage(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        BoshqaRang.id:(context)=>const BoshqaRang(),
        AppBarr.id:(context)=>const AppBarr(),
        ApplePage.id:(context)=>const ApplePage(),
        IntroPage.id:(context)=>const IntroPage(),
      },
    );
  }
}

