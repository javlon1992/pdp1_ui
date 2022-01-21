import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/home_page.dart';

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
      backgroundColor: Colors.white,

      body: Stack(
        children: [
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
                     const SizedBox(height: 20,),
                     Text(Texts.textTitle[index],style: const TextStyle(fontSize: 30,color: Colors.red),),
                     const SizedBox(height: 20,),
                     Text(Texts.textContent[index],textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey)),
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset("assets/images/image_${_selectedIndex+1}.png")),
                    ],
                  );
                }
            ),
          Align(
            alignment: const Alignment(0,0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) =>
                  AnimatedContainer(
                    margin: const EdgeInsets.all(2),
                    height: 6,
                    width: _selectedIndex == index ? 20 : 6,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: _selectedIndex == index ? Colors.red : Colors.grey,
                    ),
                  )
              ),
            ),
          ),
         Align(
            alignment: const Alignment(0.85,0.95),
           child: IconButton(onPressed: () {
                   _selectedIndex==2 ? Navigator.of(context).pushNamed(HomePage.id):{};
           },
           icon: Text(_selectedIndex==2 ? "Skip":"",style: const TextStyle(color: Colors.red),)),
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
