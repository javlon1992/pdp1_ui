import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BoshqaRang extends StatefulWidget {
  static String id="boshqa_rang";
  const BoshqaRang({Key? key}) : super(key: key);

  @override
  _BoshqaRangState createState() => _BoshqaRangState();
}

class _BoshqaRangState extends State<BoshqaRang> {

  void fireToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: RichText(
            text: TextSpan(
                text: "We will divide the ",
                style: const TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                      text: "#text",
                      style: const TextStyle(
                          color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          fireToast("Hash teg #text");
                        }),
                  const TextSpan(text: " into ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "#two",
                      style: const TextStyle(
                          color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          fireToast("Hash teg #two");
                        }),
                  const TextSpan(text: " parts ", style: TextStyle(color: Colors.black)),
                ])),
      ),
    );
  }
}
