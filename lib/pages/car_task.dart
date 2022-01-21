import 'package:flutter/material.dart';

class CarTask extends StatefulWidget {
  static String id="car_task";
  const CarTask({Key? key}) : super(key: key);

  @override
  _CarTaskState createState() => _CarTaskState();
}

class _CarTaskState extends State<CarTask> {
  int selectedIndex=0;
  List cotegories =["All","Red","Blue","Green","White"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// #categories
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cotegories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex==index ? Colors.grey: Colors.white,
                    ),
                    child: TextButton(onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: cotegories[index],),
                  );
                },


              ),
            ),


            /// #products
            
          ],
        ),
      ),
    );
  }
}
