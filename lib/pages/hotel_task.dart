import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pdp1_ui/modals/shimmer_effect.dart';

class HotelPage extends StatefulWidget {
  static String id="hotel_page";
  const HotelPage({Key? key}) : super(key: key);

  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  //List list=List.generate(5, (index) => "assets/images/ic_hotel${index%5}.jpg");
  late Size size = MediaQuery.of(context).size;
  final PageController _pageController = PageController();
  int selectedIndex=0;
  bool swiper=true,load=false;
  late Timer timer;

  loading(){
   timer = Timer.periodic(const Duration(seconds: 3),(timer){
      (swiper) ? selectedIndex++ : selectedIndex--;
      if(selectedIndex==5) {selectedIndex-=2; swiper=false;}
      if(selectedIndex==0) swiper=true;
      _pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 1100), curve: Curves.linear);
    });
  }
  Future<void>shimmerLoad()async{
      load = true;
    await Future.delayed(const Duration(seconds: 10));
    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
    shimmerLoad();
  }
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: load ? ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height*0.32,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return Shimmar(
                          child: Container(
                            height: size.height*0.32,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/ic_hotel$index.jpg"), fit: BoxFit.fill,
                                )
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0.4),
                                      Colors.black.withOpacity(0.1),
                                    ]
                                ),
                              ),

                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height*0.32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// #Text
                      Shimmar(
                        child: const Text("What kind of hotel you \n need?",
                          style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Shimmar(
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: "Search for hotels...",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// #body
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// #Text
                Padding(
                  padding: const EdgeInsets.only(top: 9,left: 8),
                  child: Shimmar(child: const Text("Best Hotels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                ),
                /// List View
                SizedBox(
                  height: size.width*0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                        child: Shimmar(
                          child: Container(
                            //margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                            width: size.width*0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/ic_hotel$index.jpg"),
                                )
                            ),
                            child: Align(alignment: const Alignment(-0.8,0.8),
                                child: Text("Hotel ${index+1}",style: const TextStyle(fontSize: 18,color: Colors.white),)),
                          ),
                        ),
                      );
                    },

                  ),
                ),
                /// #Text
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Shimmar(child: const Text("Luxury Hotels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                ),
                /// List View
                SizedBox(
                  height: size.width*0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                        child: Shimmar(
                          child: Container(
                            //margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                            width: size.width*0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/ic_hotel${4-(index%5)}.jpg"),
                                )
                            ),
                            child: Align(alignment: const Alignment(-0.8,0.8),
                                child: Text("Hotel ${index+1}",style: const TextStyle(fontSize: 18,color: Colors.white),)),
                          ),
                        ),
                      );
                    },

                  ),
                ),
              ],
            )
          ],
        ):ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height*0.32,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return Container(
                          height: size.height*0.32,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/ic_hotel$index.jpg"), fit: BoxFit.fill,
                              )
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  colors: [
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.6),
                                    Colors.black.withOpacity(0.4),
                                    Colors.black.withOpacity(0.1),
                                  ]
                              ),
                            ),

                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height*0.32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// #Text
                      const Text("What kind of hotel you \n need?",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: "Search for hotels...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   height: size.height*0.32,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/images/ic_header.jpg"), fit: BoxFit.cover,
            //     )
            //   ),
            //   child: Container(
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.bottomCenter,
            //             end: Alignment.center,
            //             colors: [
            //               Colors.black.withOpacity(0.8),
            //               Colors.black.withOpacity(0.6),
            //               Colors.black.withOpacity(0.4),
            //               Colors.black.withOpacity(0.1),
            //             ]
            //         ),
            //       ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         /// #Text
            //         Text("What kind of hotel you \n need?",textAlign: TextAlign.center,
            //           style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
            //         Container(
            //           margin: EdgeInsets.symmetric(horizontal: 30),
            //           height: 45,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(22),
            //           ),
            //           child: TextField(
            //             decoration: InputDecoration(
            //               prefixIcon: Icon(Icons.search),
            //               border: InputBorder.none,
            //               hintText: "Search for hotels...",
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     ),
            //   ),
            /// #body
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// #Text
                const Padding(
                  padding: EdgeInsets.only(top: 9,left: 8),
                  child: Text("Best Hotels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                /// List View
                SizedBox(
                  height: size.width*0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/ic_hotel$index.jpg"),
                            )
                        ),
                        child: Align(alignment: const Alignment(-0.8,0.8),
                            child: Text("Hotel ${index+1}",style: const TextStyle(fontSize: 18,color: Colors.white),)),
                      );
                    },

                  ),
                ),
                /// #Text
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("Luxury Hotels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                /// List View
                SizedBox(
                  height: size.width*0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/ic_hotel${4-(index%5)}.jpg"),
                            )
                        ),
                        child: Align(alignment: const Alignment(-0.8,0.8),
                            child: Text("Hotel ${index+1}",style: const TextStyle(fontSize: 18,color: Colors.white),)),
                      );
                    },

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



