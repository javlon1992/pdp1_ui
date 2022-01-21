import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/sign_in.dart';
import 'getstarted_page.dart';

class TaskUi extends StatefulWidget {
  static String id = "task_ui";

  const TaskUi({Key? key}) : super(key: key);

  @override
  _TaskUiState createState() => _TaskUiState();
}

class _TaskUiState extends State<TaskUi> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  void _getStarted() {
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
            )
        ),
        context: context,
        builder: (context) {
          return GetStartedPage();
        });
  }

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
    return Scaffold(
      backgroundColor: const Color(0xfffa6c3a),
      body: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              alignment: Alignment.topCenter,
              child: const Text(
                "Your Logo",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              )),
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
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "All Your Favourite Dishes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Order from your nearby best restaurant in the town.\n You can easily order from anywhere, anytime",
                          style: TextStyle(color: Colors.white, height: 2.5),
                          textAlign: TextAlign.center),
                    ],
                  )),
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "All Your Favourite Dishes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Order from your nearby best restaurant in the town.\n You can easily order from anywhere, anytime",
                          style: TextStyle(color: Colors.white, height: 2.5),
                          textAlign: TextAlign.center),
                    ],
                  )),
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "All Your Favourite Dishes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Order from your nearby best restaurant in the town.\n You can easily order from anywhere, anytime",
                          style: TextStyle(color: Colors.white, height: 2.5),
                          textAlign: TextAlign.center),
                    ],
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.67),
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xfffb8a60),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    _getStarted();
                  },
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    _signin();
                  },
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
