import 'package:flutter/material.dart';

class AmazonUi extends StatefulWidget {
  static String id = "amazon_ui";

  const AmazonUi({Key? key}) : super(key: key);

  @override
  _AmazonUiState createState() => _AmazonUiState();
}

class _AmazonUiState extends State<AmazonUi> {
  late Size size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                icon: Icon(Icons.menu,color: Colors.black,),
              onPressed: () {
                 Scaffold.of(context).openDrawer();
              },);
          }
        ),
        backgroundColor: Colors.cyanAccent,
        title: SizedBox(
          //height: kToolbarHeight,
          child: Image.asset(
            "assets/images/amazon_logo.png",color: Colors.black,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        elevation: 0,
        toolbarHeight: kToolbarHeight,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mic,color: Colors.black,)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded,color: Colors.black,)),
        ],
        bottom: PreferredSize(
          preferredSize: Size(size.width, size.width * 0.16),
          child: Container(
            margin: const EdgeInsets.only(left: 9, right: 9, bottom: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: "What are you looking for?",
                  suffixIcon: Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
      ),
      drawer: Drawer(),
      body: ListView(
        addAutomaticKeepAlives:false,   addRepaintBoundaries:false,   addSemanticIndexes:false,
        children: [
          Container(
            color: Colors.cyanAccent.shade100,
            height: 40,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text("Dilever to Uzbekistan"),
                Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 320,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.width / 2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          //spreadRadius: 7,
                          blurRadius: 8,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/item_6.jpeg"),
                      )),
                ),
                /// #ListView
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 170,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return horizontalItemList(index);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            //height:  (Orientation.portrait == MediaQuery.of(context).orientation) ?  size.width : size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Deal of the Day",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/item_7.jpeg",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Up to 31% off APC UPS Battery Back \n\$10.99 - \$79.9",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            //height: size.height*0.7,
            padding: EdgeInsets.all(10),
            color: Colors.white,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Best sellers in Electronics",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 7,
                        crossAxisSpacing: 7,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Image.asset(
                        "assets/images/item_${index + 1}.jpeg",
                      );
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Top products in Camera",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/item_3.jpeg",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 7,
                ),
                GridView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Image.asset(
                        "assets/images/item_${index + 1}.jpeg",
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontalItemList(int index) {
    return Container(
      width: 130,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: Text(
                "Beauty \nPicks",
                style: TextStyle(fontSize: 13),
              ),
            ),
            Container(
              height: 130,
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/item_${index + 1}.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.01),
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
