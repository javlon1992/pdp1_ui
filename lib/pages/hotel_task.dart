import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  static String id="hotel_page";
  const HotelPage({Key? key}) : super(key: key);

  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  late Size size = MediaQuery.of(context).size;
  List list=List.generate(5, (index) => "assets/images/ic_hotel${index%5}.jpg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height*0.32,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ic_header.jpg"), fit: BoxFit.cover,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// #Text
                  Text("What kind of hotel you \n need?",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: TextField(
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
            ),
          /// #body
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// #Text
              Padding(
                padding: const EdgeInsets.only(top: 9,left: 8),
                child: Text("Best Hotels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              /// List View
              Container(
                height: size.width*0.45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                      width: size.width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/ic_hotel$index.jpg"),
                        )
                      ),
                      child: Align(alignment: Alignment(-0.8,0.8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hotel ${index+1}",style: TextStyle(fontSize: 18,color: Colors.white),),
                              SizedBox(width: 100,),
                              Icon(Icons.favorite,color: Colors.red,)
                            ],
                          )),
                    );
                  },

                ),
              ),
              /// #Text
              Padding(
                padding: const EdgeInsets.only(left: 8),
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
                      margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                      width: size.width*0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/ic_hotel${4-(index%5)}.jpg"),
                          )
                      ),
                      child: Align(alignment: Alignment(-0.8,0.8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hotel ${index+1}",style: TextStyle(fontSize: 18,color: Colors.white),),
                              SizedBox(width: 100,),
                              Icon(Icons.favorite,color: Colors.red,)
                            ],
                          )),
                    );
                  },

                ),
              ),
              /// #Text
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text("Resort Hotels",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              /// List View
              SizedBox(
                height: size.width*0.45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                      width: size.width*0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/ic_hotel${3-(index%5)}.jpg"),
                          )
                      ),
                      child: Align(alignment: Alignment(-0.8,0.8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hotel ${index+1}",style: TextStyle(fontSize: 18,color: Colors.white),),
                              SizedBox(width: 100,),
                              Icon(Icons.favorite,color: Colors.red,)
                            ],
                          )),
                    );
                  },

                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
