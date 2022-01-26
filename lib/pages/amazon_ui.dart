import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmazonUi extends StatefulWidget {
  static String id="amazon_ui";
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
        title: SizedBox(
          //height: kToolbarHeight,
          child: Image.asset("assets/images/amazon_logo.png",width: 100,fit: BoxFit.cover,),
        ),
        elevation: 0,
        toolbarHeight: kToolbarHeight,
        actions: [
          IconButton(
              onPressed: (){}, icon: Icon(Icons.mic)),
          IconButton(
              onPressed: (){}, icon: Icon(Icons.shopping_cart_rounded)),
        ],
        bottom: PreferredSize(
          preferredSize: Size(size.width,size.width*0.16),
          child: Container(
            margin: const EdgeInsets.only(left: 9,right: 9,bottom: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.blue,),
                border: InputBorder.none,
                hintText: "What are you looking for?",
                suffixIcon: Icon(Icons.camera_alt,color: Colors.blue,)
              ),
            ),
          ),),

      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          Container(
            color: Colors.blueGrey,
            height: 40,
            child: Row(
              children: [
                Icon(Icons.location_on,color: Colors.white,),
                Text("Dilever to Korea,Republic of",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: size.width/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right:Radius.circular(100)),
                    color: Colors.lightBlueAccent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/image_1.jpeg"),
                    ),
                  ),
                ),
                Text("We ship 45 million \nproducts",style: TextStyle(fontSize: 15),),
                SizedBox(),
              ],
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 110,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Sign in for the best experience"),
                MaterialButton(
                  color: Colors.orange,
                    onPressed: (){},
                    child: Text("Sign in"),
                    ),
                Text("Create an account",style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
          SizedBox(height: 7,),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
           //height:  (Orientation.portrait == MediaQuery.of(context).orientation) ?  size.width : size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Deal of the Day",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Image.asset("assets/images/item_7.jpeg",fit: BoxFit.cover,),
                SizedBox(height: 10,),
                Text("Up to 31% off APC UPS Battery Back \n\$10.99 - \$79.9",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 7,),
          Container(
            //height: size.height*0.7,
            padding: EdgeInsets.all(10),
            color: Colors.white,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Best sellers in Electronics",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 7,
                        crossAxisSpacing: 7,
                        crossAxisCount: 2
                    ),
                    itemBuilder: (context,index){
                      return Image.asset("assets/images/item_${index+1}.jpeg",);
                    }
                ),
              ],
            ),
          ),
          SizedBox(height: 7,),
          Container(
            width: size.width,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Top products in Camera",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Image.asset("assets/images/item_3.jpeg",fit: BoxFit.cover,),
                SizedBox(height: 7,),
                GridView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context,index){
                      return Image.asset("assets/images/item_${index+1}.jpeg",);
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
