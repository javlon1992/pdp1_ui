import 'package:flutter/material.dart';
import 'package:pdp1_ui/animation/fade_animation.dart';

class PartyPage extends StatefulWidget {

  static String id="party_page";
  const PartyPage({Key? key}) : super(key: key);

  @override
  _PartyPageState createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;
  bool buttonChange = true;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/im_party.jpeg"),fit: BoxFit.cover,),
        ),
        child:
           FadeTransition(
             opacity: _animation,
             child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                    ],
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45),
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeAnimation(4, Text("Find the best parties near you.",
                        style: TextStyle(fontSize:35,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 25,),
                    FadeAnimation(5, Text("Let us find you a party for you interesrt",style: TextStyle(fontSize: 20,color: Colors.grey),)),
                    Spacer(),
                    FadeAnimation(6,
                       TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: buttonChange ? Colors.orange: Colors.redAccent,
                            shape: StadiumBorder(),
                            fixedSize: Size(MediaQuery.of(context).size.width, 50)
                        ),
                        onPressed: (){
                          setState(() {
                            buttonChange = !buttonChange;
                          });
                          },
                        child: Text(buttonChange ? "Start":"Google+",
                          style: TextStyle(fontSize: 20,color: Colors.white),),),
                    )
                  ],
                ),
              ),
          ),
           ),
        ),

    );
  }
}
