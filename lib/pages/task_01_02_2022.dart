import 'package:flutter/material.dart';

class TaskExam extends StatefulWidget {
  static String id="taskexam";
  const TaskExam({Key? key}) : super(key: key);

  @override
  _TaskExamState createState() => _TaskExamState();
}

class _TaskExamState extends State<TaskExam> {

  int _currentMax = 10;
  final ScrollController _scrollController = ScrollController();

  List name=["Dinner Steakhouse","Fire Hyper","Deli Hyper","Deli Cious","Deli Turbo"];
  List subname=["Sushi * Seambe","Branch * Colorado Springs","Deli * Hyper","Deli * Cious","Deli * Turbo"];

  _getMoreData() async{
    await Future.delayed(Duration(milliseconds: 1000));

    for (var i = _currentMax; i < 42; i++) {
        if(42-i < 10){
          _currentMax = 42; break;
        }else{
        _currentMax = _currentMax + 10; break;
      }}
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _getMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // if(MediaQuery.of(context).size.width < 700){
    //   return buildWeb();
    // }
    return buildScaffold();
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () {  }, icon: Icon(Icons.restaurant),),
        title: Text("FriendlyEats"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              height: 40,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.filter_list_outlined),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("All Restaurants",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Text("by raiting",style: TextStyle(fontSize: 12),),
                    ],
                  )
                ],
              )
          ),),
      ),
      body: GridView.builder(
          controller: _scrollController,
          itemCount: _currentMax == 42? _currentMax: _currentMax+1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.of(context).size.width < 700)? 1 : 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 2/1.6,
          ),
          itemBuilder: (context,index){
            if(index == _currentMax) {
              return Center(child: CircularProgressIndicator());
            }
            return buildBody(index);
          }),
    );
  }
  Widget buildBody(int index) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 4),
      child: GridTile(
          footer: Container(
            padding: EdgeInsets.all(5),
            height: 90,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name[index%5],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("\$\$\$",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star_half,color: Colors.yellow,),
                  ],
                ),
                SizedBox(height: 5,),
                Text(subname[index%5]),
                Divider(thickness: 1,),
              ],
            ),
          ),
          child:Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/img${index%4}.jpg"),

          )),
    );
  }
}