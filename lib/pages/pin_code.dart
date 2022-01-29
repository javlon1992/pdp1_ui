import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pdp1_ui/pages/amazon_ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class PinCode extends StatefulWidget {
  static const String id = "pin_code";
  const PinCode({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  var sekund = 59;
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  late Timer timer;
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  void time(){
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(timer.tick==60) timer.cancel();
        sekund = 60 - timer.tick;
      });
    });
  }



  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () { time(); };
    time();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      key: scaffoldKey,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Lottie.asset("assets/anims/verification.json")),
            Text(
              "Phone Number Verification",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter the code sent to",
                  style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),),
                SizedBox(width: 10,),
                Text(widget.phoneNumber,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Form(
              key: formKey,
              child: PinCodeTextField(
                animationType: AnimationType.fade,
                appContext: context,
                pastedTextStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,
                ),
                length: 4,
                validator: (v) {
                  if (v!.length < 3) {
                    return "Code lenght must be 4 character";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  activeColor: Colors.transparent,
                  inactiveFillColor: Colors.blue.withOpacity(0.2),
                  selectedFillColor: Colors.blue,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeFillColor: Colors.blue,
                  inactiveColor: Colors.transparent,
                ),
                cursorColor: Colors.white,
                textStyle: TextStyle(fontSize: 22, height: 1.6,color: Colors.white),
                errorAnimationController: errorController,
                controller: textEditingController,
                animationDuration: Duration(milliseconds: 300),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
            ),
            hasError ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
         child: Text("*Please fill up all the cells properly",
           style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),),)
                : SizedBox.shrink(),

         SizedBox(height: 30,),

         sekund == 0 ?
            RichText(
           textAlign: TextAlign.center,
           text: TextSpan(text: "Didn't receive the code? ", style: TextStyle(color: Colors.black54, fontSize: 15),
            children: [
              TextSpan(recognizer: onTapRecognizer,text: " RESEND", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
            ]),)
         : Text(sekund<10?"00:0$sekund":"00:$sekund",style: TextStyle(color: Colors.red),),

         SizedBox(height: 30,),

         Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue, elevation: 0),

          onPressed: () {
            formKey.currentState?.validate();
            // conditions for validating
            if (currentText.length != 4 || currentText != "1234") {
              errorController.add(ErrorAnimationType
                  .shake); // Triggering error shake animation
              setState(() {
                hasError = true;
              });
            } else {
              Navigator.pushReplacementNamed(context, AmazonUi.id);
              setState(() {
                hasError = false;
                scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Succesfully !!!"),
                  duration: Duration(seconds: 2),
                ));
              });
            }
          },
          child: Center(
              child: Text("VERIFY".toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
            ),
      ),
    ],
    ),
        ),
    );
  }
}