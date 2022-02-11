import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class Compass extends StatefulWidget {
  static String id="compass";
  const Compass({Key? key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double _direction = 0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        _direction = event.heading!;
        if(_direction.round() == 0){
          HapticFeedback.vibrate();
        }else if(_direction.round() == 270){
          HapticFeedback.vibrate();
        }else if(_direction.round() == 180){
          HapticFeedback.vibrate();
        }else if(_direction.ceil() == 90){
          HapticFeedback.vibrate();
        }
        print(_direction.ceil());
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    FlutterCompass.events!.listen((event) {}).cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Compass"),),
        body: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: ((_direction) * (math.pi / 180) * -1),
                child: Image.asset("assets/images/compass.png", scale: 2, width: MediaQuery.of(context).size.width*0.8,),
              ),
            ),
            Center(
                child: Text(
                  "${_direction.ceil()}",
                  style: TextStyle(
                    color: Color(0xFFEBEBEB),
                    fontSize: 50,
                  ),
                ),
              ),
          ],
        )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: HSLColor.fromAHSL(1, 0, 0, 0.05).toColor(),
  //     body: Builder(builder: (context) {
  //       return Column(
  //         children: <Widget>[
  //           Expanded(child: _buildCompass()),
  //         ],
  //       );
  //     }),
  //   );
  // }
  //
  // Widget _buildCompass() {
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;
  //   // might need to accound for padding on iphones
  //   //var padding = MediaQuery.of(context).padding;
  //   return StreamBuilder<CompassEvent>(
  //     stream: FlutterCompass.events,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Error reading heading: ${snapshot.error}');
  //       }
  //
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //
  //       double direction = snapshot.data!.heading!;
  //
  //       // if direction is null, then device does not support this sensor
  //       // show error message
  //       if (direction == null) {
  //         return const Center(
  //           child: Text("Device does not have sensors !"),
  //         );
  //       }
  //
  //       int ang = (direction.round());
  //       return Stack(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.all(5.0),
  //             alignment: Alignment.center,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: Color(0xFFEBEBEB),
  //             ),
  //             child: Transform.rotate(
  //               angle: ((direction) * (math.pi / 180) * -1),
  //               child: Image.asset('assets/images/compass.png'),
  //             ),
  //           ),
  //           Center(
  //             child: Text(
  //               "$ang",
  //               style: TextStyle(
  //                 color: Color(0xFFEBEBEB),
  //                 fontSize: 56,
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             // center of the screen - half the width of the rectangle
  //             left: (width / 2) - ((width / 80) / 2),
  //             // height - width is the non compass vertical space, half of that
  //             top: (height - width) / 2,
  //             child: SizedBox(
  //               width: width / 80,
  //               height: width / 10,
  //               child: Container(
  //                 //color: HSLColor.fromAHSL(0.85, 0, 0, 0.05).toColor(),
  //                 color: Color(0xBBEBEBEB),
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
