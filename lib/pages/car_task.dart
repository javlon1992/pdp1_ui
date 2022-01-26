import 'package:flutter/material.dart';

class CarTask extends StatefulWidget {
  static String id="car_task";
  const CarTask({Key? key}) : super(key: key);

  @override
  _CarTaskState createState() => _CarTaskState();
}

class _CarTaskState extends State<CarTask> {
  List<String> categories =["All","Red","Blue","Yellow","White","Green"];
  late List<Car> cars = List.generate(10, (index) => Car(image: "assets/images/im_car${index % 5}.jpg", color: categories[(index%5)+1],));

  List<Car>list=[], shoppinglist=[], likes=[];
  bool isItemSelected=false;
  int selectedIndex=0,_count=0,selected=0;

  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();

  // Future<Null> refreshlist()async{
  //   await Future.delayed(Duration(seconds: 1));
  //   setState(() {selectedIndex=0; list.clear(); list.addAll(cars);});
  //   return null;
  // }

@override
  void initState() {
    super.initState();
    list.addAll(cars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(selected==0?"Cars":selected==1?"Likes":"Shopping",style: const TextStyle(color: Colors.black,fontSize: 27),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          /// #delete icon
          isItemSelected ? IconButton(
              onPressed: (){
                setState(() { _count=0; isItemSelected=false;
                  for (var element in cars) {
                  if(element.isSelected.isNotEmpty) {
                    list.remove(element);
                    if(selected==1){element.likes=false;likes.remove(element);}
                    if(selected==2){shoppinglist.remove(element);}
                    element.isSelected="";}}
                });
              },
              icon: const Icon(Icons.delete_forever,color: Colors.black,)):const SizedBox.shrink(),
           /// #favorite icon
          IconButton(
                  onPressed: (){selected=1; list.clear(); list.addAll(likes); setState(() {});},
                  icon: Icon(likes.isEmpty? Icons.favorite_border_rounded :Icons.favorite,color: Colors.black,)),
          /// #shopping icon
          Stack(
            children: [
              IconButton(
                  onPressed: (){
                    if(isItemSelected){
                    shoppinglist=list.where((element) => element.isSelected.isNotEmpty).toList();
                    for (var element in list) {element.isSelected="";}
                    isItemSelected=false;
                    }else{
                    list.clear();
                    list.addAll(shoppinglist);}
                   setState(() {_count=0;selected=2;});
                  },
                  icon: Icon(isItemSelected ? Icons.add_shopping_cart_outlined :Icons.shopping_cart_rounded,color: Colors.black,)),
            Positioned(top: 0,right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: _count!=0? CircleAvatar(
                    minRadius: 8,
                    backgroundColor: Colors.red,
                      child: Text("$_count",style: const TextStyle(fontSize: 13,color: Colors.white),)):const SizedBox.shrink(),
                ))
            ],
          )
        ],
      ),
      /// #refreshindicator
      body: RefreshIndicator(
        key: _key,
        onRefresh: () async{
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            selectedIndex=0; list.clear();
          if(selected==0)list.addAll(cars);
          if(selected==1)list.addAll(likes);
          if(selected==2)list.addAll(shoppinglist);
          });
          //await refreshlist();
        },
          /// #body
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// #categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: MaterialButton(
                        elevation: 0,
                        color: selectedIndex==index ? Colors.grey.shade400: Colors.white,
                        shape: const StadiumBorder(),
                        onPressed: () {
                          list.clear(); selected=0; list.addAll(cars);
                          setState(() {
                            selectedIndex = index;
                          });
                          for(var i=0;i<list.length;i++){
                            if(list[i].color==categories[index]){
                              list.insert(0,list[i]);
                              list.removeAt(i+1);
                            }}
                        },
                        child: Text(categories[index],style: TextStyle(fontSize: 18,color: selectedIndex==index ? Colors.white: Colors.black,),)),
                  );
                },
              ),
            ),

            /// #cars
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                /// #grid tile
                itemBuilder: (context,index){
                  return _buildGridTile(index);
                }
            ),
          ],
        ),
      )),
    );
  }
  GridTile _buildGridTile(int index) {
    return GridTile(
      /// #gridtile image and isSelected
      child: GestureDetector(
        onTap: isItemSelected ? () {

          setState(() {
            list[index].isSelected.isEmpty ? list[index].isSelected=index.toString() : list[index].isSelected="";
            list[index].isSelected == index.toString() ? _count++ : _count--;
          });
          if (_count == 0) {isItemSelected = false;}
        } : () {},
        onLongPress: !isItemSelected ? () {
          setState(() {
            list[index].isSelected = index.toString();
            _count++;
            isItemSelected = true;
          });
        } : () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(list[index].image),    //"assets/images/im_car${index % 5}.jpg"
              )
          ),
          child: Container(
            decoration: BoxDecoration(
              color: list[index].isSelected==index.toString() ? Colors.blue.withOpacity(0.45) : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
      /// #header gridtilebar
      header: GridTileBar(
        backgroundColor: Colors.transparent,
        title: RichText(
            text: TextSpan(text: "${list[index].name} ", style: const TextStyle(fontSize: 20),
              children: [
                TextSpan(text: list[index].type, style: const TextStyle(color: Colors.red),),
              ]
            )),
        trailing: isItemSelected ? Icon(list[index].isSelected==index.toString()?Icons.done:Icons.add)
            :IconButton(
            onPressed: () {
              setState(() {shoppinglist.add(list[index]);_count++;});
             },
            icon: const Icon(Icons.add_shopping_cart_outlined )),
      ),
      /// #footer gridtilebar
      footer: GridTileBar(
        backgroundColor: Colors.transparent,
        //subtitle: Text(""),
        leading: IconButton(
              onPressed: () {
                setState(() {
                  list[index].likes = !list[index].likes;
                });
                list[index].likes ? likes.add(list[index]) : likes.remove(list[index]);
              },
              icon: Icon(list[index].likes ? Icons.favorite:Icons.favorite_border_rounded,
                size: 25, color: Colors.red,),),
      ),
    );
  }
}

class Car{
  String name="Car";
  String type="Electric";
  String cost="100\$";
  String color;
  String image;
  bool likes=false;
  String isSelected="";
  Car({required this.color,required this.image});
}