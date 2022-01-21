import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/sign_in.dart';

class GetStartedPage extends StatefulWidget {
  static const String id = "get_started";

  const GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  TextEditingController _controller = TextEditingController();
  bool isObscure = true;

  void _signin() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SignInPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08, left: MediaQuery.of(context).size.width*0.08, top: MediaQuery.of(context).size.height*0.06),
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // #headlines
              const Text(
                "Create an account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              const Text(
                "Sign up to continue",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.04,
              ),

              // #name_field
              const Text("NAME", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
                child: const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),

              // #email_field
              const Text("EMAIL", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      suffixIcon: Icon(Icons.check_circle_outline, color: RegExp(r'^([a-zA-z\d\.\-\_]+)@[a-z]+\.[a-z]+(\.[a-z]+)?$')
                          .hasMatch(_controller.text)?Colors.green:Colors.grey,),
                      border: const OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),


              // #password_field
              const Text("PASSWORD", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
                child: TextField(
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          isObscure = !isObscure;
                        });
                      }, icon: Icon(isObscure?Icons.visibility:Icons.visibility_off),),
                      border: OutlineInputBorder(
                      )
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),

              // #get_started_button
              MaterialButton(
                onPressed: () {
                },
                height: MediaQuery.of(context).size.height*0.065,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Get Started",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),

              // #login_label
              MaterialButton(onPressed: (){
                Navigator.pop(context);
                _signin();
              }, child: Text("Already have an account? Login", style: TextStyle(color: Colors.grey, fontSize: 15),),)
            ],
          ),
        ),
      ),
    );
  }
}