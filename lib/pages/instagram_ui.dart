import 'package:flutter/material.dart';

class InstagramUI extends StatefulWidget {
  static String id = "instagram_ui";

  const InstagramUI({Key? key}) : super(key: key);

  @override
  _InstagramUIState createState() => _InstagramUIState();
}

class _InstagramUIState extends State<InstagramUI> with SingleTickerProviderStateMixin {
  // late TabController _controller;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TabController(length: 2, vsync: this,);
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.lock, color: Colors.black, size: 18,),
              Text(" jacob_w", style: TextStyle(color: Colors.black, fontSize: 20),),
              Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black,),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        /// #body
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
             physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                // SliverAppBar(
                //   backgroundColor: Colors.white,
                //   elevation: 0,
                //   pinned: true,
                //   floating: true,
                //   toolbarHeight: 315,
                //   title: buildSliverAppBar(),
                //   bottom: TabBar(
                //     indicatorPadding: EdgeInsets.only(bottom: 2),
                //     indicatorColor: Colors.black,
                //     //controller: _controller,
                //     tabs: [
                //       Tab(icon: Icon(Icons.apps,color: Colors.black,),
                //       ),
                //       Tab(icon: Icon(Icons.person_pin_outlined,color: Colors.black,),
                //       )
                //     ],
                //   ),
                // ),
                SliverAppBar(
                  backgroundColor: Colors.white,
                  collapsedHeight: 315,
                  expandedHeight: 315,
                  flexibleSpace: buildSliverAppBar(),
                ),
                SliverPersistentHeader(
                  delegate: MyDelegate(
                      TabBar(
                        indicatorPadding: EdgeInsets.only(bottom: 2),
                        tabs: [
                          Tab(icon: Icon(Icons.grid_on_sharp,color: Colors.black,)),
                          Tab(icon: Icon(Icons.person_pin_outlined,color: Colors.black,)),
                        ],
                        indicatorColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                      )
                  ),
                  floating: true,
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              /// #Photos
              children: [1,2].map((tab) => GridView.builder(
                  itemCount: 18,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (tab==1)? 3 : 1,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: (tab==2)? 2/1.3 : 1,
                  ),
                  itemBuilder: (context,index){
                    return Image(
                        fit: BoxFit.cover,
                        image: AssetImage((tab==1)?"assets/images/item_${(index%7)+1}.jpeg"
                                                  :"assets/images/ic_hotel${index%5}.jpg"));
                  }),).toList(),
                /// #Photos
                // GridView.builder(
                //     itemCount: 15,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3,
                //         mainAxisSpacing: 2,
                //         crossAxisSpacing: 2,
                //     ),
                //     itemBuilder: (context,index){
                //       return Image(
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/images/img_${index%5}.png"));
                //     }),
                /// My photos
                // GridView.builder(
                //   itemCount: 10,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 1,
                //         mainAxisSpacing: 5,
                //         crossAxisSpacing: 5,
                //         childAspectRatio: 2/1.3,
                //     ),
                //     itemBuilder: (context,index){
                //      return Image(
                //          fit: BoxFit.cover,
                //          image: AssetImage("assets/images/img_${index%5}.png"));
                //     }),

            ),
          ),
        ));
  }

  Widget buildSliverAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// #User information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1, color: Colors.grey)),
                            child: Container(
                              height: 75, width: 75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/imgg_4.png"),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text("54", style: TextStyle(fontSize: 18,color: Colors.black),),
                              Text("points",style: TextStyle(fontSize:14,color: Colors.black),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("834", style: TextStyle(fontSize: 18,color: Colors.black),
                              ),
                              Text("Follows",style: TextStyle(fontSize:14,color: Colors.black),),
                            ],
                          ),
                          Column(
                            children: [
                              Text("182", style: TextStyle(fontSize: 18,color: Colors.black),
                              ),
                              Text("Fallowing",style: TextStyle(fontSize:14,color: Colors.black),),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 15,),

                      Text("Jocob West", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),),
                      Text.rich(
                          TextSpan(text: "Digital goodies designer", style: TextStyle(fontSize:16,color: Colors.black),
                          children: [
                            TextSpan(text: " @pixsellz", style: TextStyle(color: Colors.blue,),),
                          ])),
                      Text("Everything is designed.",style: TextStyle(color: Colors.black,fontSize: 16),),

                      SizedBox(height: 15,),
                      /// #Button
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Center(
                            child: Text(
                          "Edit Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),
                        )),
                      ),

                      SizedBox(height: 15,),
                      /// #Storys
                      Container(
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return buildStorys(index);
                            }),
                      ),
                      Divider(),
                    ],
                  ),
    );
  }

  Widget buildStorys(int index) {
    return (index == 0)
        ? Container(
            height: 70, width: 70,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey)),
            child: Icon(Icons.add, color: Colors.black,
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey)),

            child: CircleAvatar( radius: 35, backgroundImage: AssetImage("assets/images/imgg_$index.png",),
            )
          );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate{
  final TabBar tabBar;
  MyDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}
