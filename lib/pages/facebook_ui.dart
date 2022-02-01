import 'package:flutter/material.dart';

class FacebookUI extends StatefulWidget {
  static String id="facebook_id";
  const FacebookUI({Key? key}) : super(key: key);

  @override
  _FacebookUIState createState() => _FacebookUIState();
}

class _FacebookUIState extends State<FacebookUI> {
  bool theme=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:theme? Colors.grey.shade800 : Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:theme? Colors.black: Colors.white,
        title: Text("facebook",style: TextStyle(color: Colors.blue),overflow: TextOverflow.ellipsis,),
        actions: [
          IconButton(icon: Icon(Icons.search,color:theme? Colors.white :Colors.black,), onPressed: () {  },),
          IconButton(icon: Icon(Icons.camera_alt,color:theme? Colors.white : Colors.black,),
            onPressed: () {
            setState(() {theme = !theme;});
            },),
          ],
      ),
      body: ListView(
        children: [
          /// #Search
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            color:theme? Colors.black : Colors.white,
            child: buildSearch(),
          ),
          /// #Icons
          Container(
            height: 50,
            color:theme? Colors.black : Colors.white,
            child: buildIcons(),
          ),
          /// #Storys
          Container(
            color:theme? Colors.black : Colors.white,
            height: 200,
            margin: EdgeInsets.only(top: 5,bottom: 5),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
                itemBuilder: (context,index){
                  return buildStorys(index);
            }),
          ),
          /// #Post
          Container(
            color:theme? Colors.black : Colors.white,
            child: ListView.builder(
              itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return buildPost(index);
                })
          ),
        ],
      ),
    );
  }

  Row buildSearch() {
    return Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/imgg_4.png"),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10,bottom: 6),
                        hintText: "What's on your mind?",
                        hintStyle: TextStyle(color: Colors.grey),
                        ),
                  ),
                ),
              ),
            ],
          );
  }

  Widget buildIcons() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.video_call,color: Colors.red,),
                  label: Text("Live"),
                  onPressed: () => print("it's pressed"),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    onPrimary: Colors.grey,
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0),),
                  ),
                ),
              ),
              VerticalDivider(endIndent: 7, indent: 7,thickness: 1,color: Colors.grey.shade300,),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.photo,color: Colors.green,),
                  label: Text("Photo"),
                  onPressed: () => print("it's pressed"),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    onPrimary: Colors.grey,
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0),),
                  ),
                ),
              ),
              VerticalDivider(thickness: 1,endIndent: 7, indent: 7,color: Colors.grey.shade300,),
              ElevatedButton.icon(
                icon: Icon(Icons.location_on,color: Colors.red,),
                label: Text("Check in",),
                onPressed: () => print("it's pressed"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                  onPrimary: Colors.grey,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0),),
                ),
              ),
            ],
          );
  }

  Container buildStorys(int index) {
    return Container(
                  margin: EdgeInsets.only(top: 7,bottom: 7,left: 7),
                  padding: EdgeInsets.all(5),
                  width: 110,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/img_${index%5}.png"),
                    ),
                    //gradient: LinearGradient(colors: [Colors.black.withOpacity(0.9),Colors.black.withOpacity(0.8)]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: Colors.blue),
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("assets/images/imgg_${index%6}.png"),),
                        ),
                      ),
                      Text("User $index",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                );
  }

  Column buildPost(int index) {
    return Column(
                  children: [
                    /// #User profiles
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("assets/images/imgg_${index%6}.png"),
                      ),
                      title: Text("User ${index+1}",style: TextStyle(fontWeight: FontWeight.bold,color:theme? Colors.white : Colors.black),),
                      subtitle: Text("${index+1} hr ago",style: TextStyle(color: Colors.grey),),
                      trailing: Icon(Icons.more_horiz_outlined,color: Colors.grey,),
                    ),
                    /// #Comment
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
                      child: Text("All the Lorem Ipsum generators on thr Internet tend to repeat predefined.",
                      style: TextStyle(color: theme? Colors.white :Colors.black),
                      ),
                    ),
                    /// #Image
                    Image.asset("assets/images/img_${(index%4)+1}.png",fit: BoxFit.cover,height: 200,width: double.infinity,),
                    /// #Likes
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 25,width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(width: 1,color: Colors.white),
                            ),
                            child: Icon(Icons.thumb_up,color: Colors.white,size: 15,),
                          ),
                          Transform.translate(
                              offset:Offset(-5,0),
                            child:  Container(
                              height: 25,width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                                border: Border.all(width: 1,color: Colors.white),
                              ),
                              child: Icon(Icons.favorite,color: Colors.white,size: 15,),
                            ),
                          ),
                          Text("2.5k",style: TextStyle(color: Colors.grey),),
                          Spacer(),
                          Text("400 comments",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                    /// #Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.thumb_up,color: Colors.blue,),
                          label: Text("Like"),
                          onPressed: () => print("it's pressed"),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                            onPrimary: Colors.blue,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0),),
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.comment,color: Colors.grey,),
                          label: Text("Comment"),
                          onPressed: () => print("it's pressed"),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                            onPrimary: Colors.grey,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0),),
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.share,color: Colors.grey,),
                          label: Text("Share"),
                          onPressed: () => print("it's pressed"),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.transparent,
                            onPrimary: Colors.grey,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0),),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 0.8,),
                  ],
                );
  }
}
