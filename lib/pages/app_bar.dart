import 'package:flutter/material.dart';

class AppBarr extends StatefulWidget {
  static String id="app_bar";
  const AppBarr({Key? key}) : super(key: key);

  @override
  _AppBarrState createState() => _AppBarrState();
}

class _AppBarrState extends State<AppBarr> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      extendBodyBehindAppBar: true,

      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text("AppBar"),
      //   backgroundColor: Colors.transparent,
      // ),
      // body: Container(
      //     decoration: BoxDecoration(
      //         image: DecorationImage(image: AssetImage("assets/images/img.jpg"))
      //     ),
      //     child: Center(child: Text("PDP Acadeny",style: TextStyle(color: Colors.white,fontSize: 30),),)),

        appBar: AppBar(
          title: const Text('AppBar', style: TextStyle(
              color: Colors.pink,
              fontSize: 28
          ),) ,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img.jpg'),
                    fit: BoxFit.cover,
                ),),
          ),
        ),
        body: const Center(
         child: Text("PDP Acadeny",style: TextStyle(color: Colors.black,fontSize: 30),),),

    );
  }
}