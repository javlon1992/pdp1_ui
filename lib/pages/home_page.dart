import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shake/shake.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String str = "Powered by #PDP Academy";
  late List<String> list = str.split(" ");

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
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.5),]

          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60,right: 15,bottom: 10),
                child: const Text("Sign Up",style: TextStyle(fontSize: 35,color: Colors.white),)),

            Container(
              margin: const EdgeInsets.only(right: 15,bottom: 40),
                child: const Text("Welcome",style: TextStyle(fontSize: 17,color: Colors.white),)),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  //physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 20,
                        child: Column(
                          children: const [
                            TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.teal)),
                                hintText: "FullName",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.teal)),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.teal)),
                                hintText: "Phone",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.teal)),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25,),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.grey.shade700,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
                        ),
                          onPressed: (){},
                          child: const Text("Sign Up",style: TextStyle(color: Colors.white),)),
                      const SizedBox(height: 15,),

                      const Text("Sign Up with SNS",style: TextStyle(color: Colors.grey),),

                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.blue,
                                minimumSize: Size(MediaQuery.of(context).size.width * 0.26, 50),
                              ),
                              onPressed: (){},
                              child: const Text("Facebook",style: TextStyle(color: Colors.white),)),
                          TextButton(
                              style: TextButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.red,
                                minimumSize: Size(MediaQuery.of(context).size.width * 0.26, 50),
                              ),
                              onPressed: (){},
                              child: const Text("Google",style: TextStyle(color: Colors.white),)),
                          TextButton(
                              style: TextButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.black,
                                minimumSize: Size(MediaQuery.of(context).size.width * 0.26, 50),
                              ),
                              onPressed: (){},
                              child: const Text("Apple",style: TextStyle(color: Colors.white),)),
                        ],
                      ),
                      const SizedBox(height: 20,),

                      //Spacer(),
                      RichText(
                        text: TextSpan(
                          children: List.generate(list.length, (index) {
                            return  (list[index][0]=="#") ?
                            TextSpan(
                                text: list[index],
                                style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {fireToast("Hash teg ${list[index]}");})

                               : TextSpan(text: " ${list[index]} ", style: const TextStyle(color: Colors.black));
                          },),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
