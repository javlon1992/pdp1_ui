import 'package:flutter/material.dart';

class CarTask extends StatefulWidget {
  static String id="car_task";
  const CarTask({Key? key}) : super(key: key);

  @override
  _CarTaskState createState() => _CarTaskState();
}

class _CarTaskState extends State<CarTask> {
  List<String> categories =["All","Red","Blue","Yellow","White","Green"];

  List<Car> list= [ Car(color: "Red",image: 'asset/images/im_car0.jpg'),
               Car(color: "Blue",image: 'asset/images/im_car1.jpg'),
               Car(color: "Yellow",image: 'asset/images/im_car2.jpg'),
               Car(color: "White",image: 'asset/images/im_car3.jpg'),
               Car(color: "Green",image: 'asset/images/im_car4.jpg'),];

  String sort="All";
  bool isItemSelected=false;
  int selectedIndex=0,_count=0;
  List likes =[];
  List shopping =[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cars",style: TextStyle(color: Colors.red,fontSize: 27),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications,color: Colors.red,)),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart_rounded,color: Colors.red,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// #categories
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: MaterialButton(
                      elevation: 0,
                      color: selectedIndex==index ? Colors.red.shade300: Colors.white,
                      shape: StadiumBorder(),
                      onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(categories[index],style: TextStyle(fontSize: 18,color: selectedIndex==index ? Colors.white: Colors.black,),)),
                  );
                },
              ),
            ),


            /// #products
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                /// #Grid Tile
                itemBuilder: (context,index){
                  return _buildGridTile(index);
                }
            ),
          ],
        ),
      ),
    );
  }
  GridTile _buildGridTile(int index) {
    return GridTile(
      child: GestureDetector(
        onTap: isItemSelected ? () {
          list[index].isSelected = !list[index].isSelected;
          setState(() {
            list[index].isSelected ? _count++ : _count--;
          });
          if (_count == 0) {
            isItemSelected = false;
          }
        } : () {},
        onLongPress: !isItemSelected ? () {
          setState(() {
            list[index].isSelected = true;
            _count++;
            isItemSelected = true;
          });
        } : () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/im_car${index % 5}.jpg"),
              )
          ),
          child: Container(
            decoration: BoxDecoration(
              color: list[index].isSelected ? Colors.blue.withOpacity(0.45) : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
      header: GridTileBar(
        backgroundColor: Colors.transparent,
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${list[index].name}",style: TextStyle(fontSize: 20),),
            SizedBox(width: 10,),
            Text("${list[index].type}",style: TextStyle(fontSize:20,color: Colors.red),),
          ],
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.transparent,
        //subtitle: Text(""),
        leading: IconButton(
          onPressed: () {
            setState(() {
              list[index].likes = !list[index].likes;
              // list[index].likes ? _count++ : _count--;
            });
          },
          icon: Icon(list[index].likes ? Icons.favorite:Icons.favorite_border_rounded,
            size: 25, color: Colors.red,),),
        // Icon(Icons.favorite, size: 25, color: Colors.red,),
      ),
    );
  }
}

class Car{
  String name="PDP Car";
  String type="Electric";
  String cost="100\$";
  String color;
  String image;
  bool likes=false;
  bool isSelected=false;
  Car({required this.color,required this.image});
}