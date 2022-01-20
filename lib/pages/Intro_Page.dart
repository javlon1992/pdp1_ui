import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  static String id="intro_page";
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.transparent,
         actions: [
           Center(
             child: Text("Skip",style: TextStyle(color: Colors.green),),
           ),
           SizedBox(width: 20,),
         ],
       ),
      body: Stack(
        children: [
          // Center(
          //   child: Container(
          //     height: 200,
          //       width: 200,
          //       child: Image.asset("assets/images/image_${_selectedIndex+1}.png")),
          // ),
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex=index;
                });
              },
              itemCount: 3,
                itemBuilder: (context,index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Container(
                      height: 200,
                        width: 200,
                        child: Image.asset("assets/images/image_${_selectedIndex+1}.png")),
                     SizedBox(height: 20,),
                     Text("${Texts.textTitle[index]}",style: TextStyle(fontSize: 30,color: Colors.green),),
                     SizedBox(height: 20,),
                     Text("${Texts.textContent[index]}",style: TextStyle(color: Colors.grey)),
                    ],
                  );
                }
            ),
          Align(
            alignment: Alignment(0,0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) =>
                  AnimatedContainer(
                    margin: EdgeInsets.all(2),
                    height: 6,
                    width: _selectedIndex == index ? 20 : 6,
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: _selectedIndex == index ? Colors.green : Colors.grey,
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Texts{
  static var stepOneTitle = "Learn from experts";
  static var stepOneContent = "Select from top instructors around the world";
  static var stepTwoTitle = "Go at your own pace";
  static var stepTwoContent = "Enjoy lifetime access to courses \non Udemy’s website and app";
  static var stepThreeTitle = "Find video courses";
  static var stepThreeContent = "Build your library for your career \nand personal growth";

  static List<String> textTitle = [stepOneTitle,stepTwoTitle,stepThreeTitle];
  static List<String> textContent = [stepOneContent,stepTwoContent,stepThreeContent];
}
