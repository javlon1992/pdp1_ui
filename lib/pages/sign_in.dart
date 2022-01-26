import 'package:flutter/material.dart';
import 'getstarted_page.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in_page";
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _controller = TextEditingController();
  bool isObscure = true;

  void _getStarted() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const GetStartedPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.08, left: MediaQuery.of(context).size.width*0.08, top: MediaQuery.of(context).size.height*0.06),
        height: MediaQuery.of(context).size.height * 0.625,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // #headlines
            const Text(
              "Sign in Account",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            const Text(
              "Sign in to continue",
              style: TextStyle(
                  fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }, icon: Icon(isObscure?Icons.visibility:Icons.visibility_off),),
                    border: const OutlineInputBorder(
                    )
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),

            // #get_started_button
            MaterialButton(
              onPressed: () {},
              height: MediaQuery.of(context).size.height*0.065,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              color: Colors.grey.shade700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                "Sign in",
                style: TextStyle(
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
              _getStarted();
            }, child: const Text("Don't you have an account? Sign up", style: TextStyle(color: Colors.grey, fontSize: 15),),)
          ],
        ),
      ),
    );
  }
}