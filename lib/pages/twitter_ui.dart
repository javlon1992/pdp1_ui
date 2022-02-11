import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/app_bar.dart';

class TwitterUI extends StatefulWidget {
  static String id="twitter_ui";
  const TwitterUI({Key? key}) : super(key: key);

  @override
  _TwitterUIState createState() => _TwitterUIState();
}

class _TwitterUIState extends State<TwitterUI> {

  List click = List.generate(5, (index) => false);

  List<TweetModel> items = [
     TweetModel(userImage: "assets/images/imgg_0.png",contentImage: "assets/images/imgg_3.png", userName: "Tabitha Potter", nickName: "@mis_potter", tweetTime: "·3h",
         textContent: "Kobe’s passing is really sticking w/ me in a way I didn’t @expect. He was an #icon, the kind of person who wouldn’t die @this way. My wife compared it to #Princess Di’s accident. But the end can happen for anyone at any time, & I can’t help but think of anything else lately.",
         commentNumber: 46, retweetNumber: 18, likeNumber: 363,actionIcon: Icon(CupertinoIcons.arrow_2_squarepath,size: 17,),actionUserNameList: ["Kieron Dotson Retweeted"]),

    TweetModel(userImage: "assets/images/imgg_2.png",contentImage: "assets/images/imgg_4.png", userName: "Martha CraigMartha", nickName: "@craig_love", tweetTime: "·12h",
        textContent: "UXR/UX: You can only bring one item to a remote #island to assist your research of @native use of tools and usability. What do you bring? #TellMeAboutYouKobe's passing is really sticking w/ me in a way I didn't expect",
        commentNumber: 46, retweetNumber: 18, likeNumber: 363,actionIcon: Icon(Icons.favorite,size: 17,),actionUserNameList: ["Zack John liked"]),

    TweetModel(userImage: "assets/images/imgg_1.png",contentImage: "assets/images/imgg_0.png", userName: "Maximmilian", nickName: "@maxjacobson", tweetTime: "·8h",
        textContent: "Name a show where the lead #character is the worst @character on the show I’ll get Sabrina #Spellman But the end can happen for anyone at any time, & I can’t help but think of anything else lately.",
        commentNumber: 46, retweetNumber: 18, likeNumber: 363,actionIcon: Icon(CupertinoIcons.arrow_2_squarepath,size: 17,),actionUserNameList: ["Zack John Retweeted"]),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset("assets/images/Twitter Logo.png",height: 27,width: 27,fit: BoxFit.cover,),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage("assets/images/imgg_4.png"),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 10,width: 10,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.2,color: Colors.white),
                  color: Colors.blue,
                  shape: BoxShape.circle
                ),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            height: 27,width: 27,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Twitter icon.png"),
              )
            ),
          ),
          //Image.asset("assets/images/Twitter icon.png",height: 20,width: 20,fit: BoxFit.cover,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt,color: Colors.black,), label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search,color: Colors.black,), label: '',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell,color: Colors.black,), label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline,color: Colors.black,), label: '',
          ),
        ],
      ),
     floatingActionButton: FloatingActionButton(onPressed: () {  },
       child: Image.asset("assets/images/Add text icon.png",fit: BoxFit.cover,height: 25,width: 25,),
     ),
     body: ListView.builder(
       itemCount: 5,
         itemBuilder: (context,index){
           return postTweet(items[index%3],index);
         }),
    );
  }

  Widget postTweet(TweetModel tweet,int index) {
    return Container(
      //padding: EdgeInsets.only(left: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
             padding: const EdgeInsets.only(left: 8,right: 8),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 SizedBox(height: 5,),
                 tweet.actionIcon!,
                 SizedBox(height: 5,),
                 CircleAvatar(radius: 27, backgroundImage: AssetImage(tweet.userImage),),
               ],
             ),
           ),
           Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
            /// #ExpansionTile
                 Theme(
                   data: ThemeData().copyWith(dividerColor: Colors.transparent),
                   child: ExpansionTile(
                     maintainState: click[index],
                     initiallyExpanded: click[index],
                     tilePadding: EdgeInsets.only(right: 10), childrenPadding: EdgeInsets.only(right: 20),
                     onExpansionChanged: ((newState) {
                       setState(() {click[index] = newState;});
                     }),

                     /// #title
                       title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(tweet.actionUserNameList![0],style: TextStyle(color: Colors.grey,fontSize: 15),),
                           SizedBox(height: 5,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(tweet.userName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),overflow: TextOverflow.ellipsis,),
                               //SizedBox(width: 5,),
                               (index==1||index==3)? Icon(CupertinoIcons.checkmark_seal_fill,color: Colors.blue,size: 17,):SizedBox.shrink(),
                               SizedBox(width: 5,),
                               Flexible(child: Text(tweet.nickName,style: TextStyle(color: Colors.grey,fontSize: 16),overflow: TextOverflow.ellipsis,)),
                               Text(tweet.tweetTime,style: TextStyle(color: Colors.grey),),
                             ],
                           ),
                         ],
                       ),
                     /// #subtitle
                       subtitle: (click[index])? RichText(text: textSpan(tweet))
                                          : RichText(text: textSpan(tweet),overflow: TextOverflow.ellipsis,maxLines: 3,),

                     /// #Children
                       children: [
                       //Text(tweet.textContent,overflow: TextOverflow.ellipsis,maxLines: 2,),
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                           child: Image.asset(tweet.contentImage!)),
                     ],
                   ),
                 ),
                 /// #Icons
                 Row(
                   children: [
                     ElevatedButton.icon(onPressed: (){},
                     style: ElevatedButton.styleFrom(
                       elevation: 0,primary: Colors.transparent,onPrimary: Colors.grey
                     ),
                         icon: Icon(CupertinoIcons.conversation_bubble,color: Colors.grey,), label: Text(tweet.commentNumber.toString())),
                     ElevatedButton.icon(onPressed: (){},
                         style: ElevatedButton.styleFrom(
                             elevation: 0,primary: Colors.transparent,onPrimary: Colors.grey
                         ),
                         icon: Icon(CupertinoIcons.arrow_2_squarepath,color: Colors.grey,), label: Text(tweet.retweetNumber.toString())),
                     ElevatedButton.icon(onPressed: (){},
                         style: ElevatedButton.styleFrom(
                             elevation: 0,primary: Colors.transparent,onPrimary: Colors.grey
                         ),
                         icon: Icon(Icons.favorite_border,color: Colors.grey,), label: Text(tweet.likeNumber.toString())),
                     IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.square_arrow_up,size: 20,color: Colors.grey,)),
                   ],
                 ),
               ],
             ),
           ),
        ],
      ),
    );
  }

  TextSpan textSpan(TweetModel tweet) {
    return
       TextSpan(
        children: List.generate(tweet.textContent.split(" ").length, (index) {
            List list = tweet.textContent.split(" ");
             return (RegExp(r'^((#|@)(.)+)$').hasMatch(list[index]))
            //return (list[index][0] == "#" || list[index][0] == "@")
                ? TextSpan(text: list[index],
                    style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  )
                : TextSpan(text: " ${list[index]} ", style: const TextStyle(color: Colors.black,)
             );
          },
        ),
       );
  }
}

class TweetModel {
  Icon? actionIcon;
  List<String>? actionUserNameList;
  String userImage;
  String userName;
  String nickName;
  String tweetTime;
  String textContent;
  String? contentImage;
  int commentNumber = 0;
  int retweetNumber = 0;
  int likeNumber = 0;

  TweetModel({
    this.actionIcon,
    this.actionUserNameList,
    required this.userImage,
    required this.userName,
    required this.nickName,
    required this.tweetTime,
    required this.textContent,
    this.contentImage,
    required this.commentNumber,
    required this.retweetNumber,
    required this.likeNumber,
  });
}