import 'package:flutter/material.dart';
import 'package:pdp1_ui/pages/home_page.dart';
import 'package:shake/shake.dart';

class ApplePage extends StatefulWidget {
  static String id="/apple_page";
  const ApplePage({Key? key}) : super(key: key);

  @override
  _ApplePageState createState() => _ApplePageState();
}

class _ApplePageState extends State<ApplePage> {
  List<GridItem> list = List.generate(10, (index) => GridItem(image: "assets/images/img_${index%5}.png"));
  int _count = 0;
  late ShakeDetector detector;
  bool isItemSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detector = ShakeDetector.autoStart(
        onPhoneShake: () {
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    detector.stopListening();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("AppleProduct"),
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12.5,horizontal: 5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(7.5),
            ),
            child: Text("$_count",style: const TextStyle(fontSize:16,color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img_3.png"),
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.1),
                      ]
                  ),
                ),
                child: Column(
                  children: [
                    /// #Lifestyle
                    const Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Lifestyle Safe",style: TextStyle(color: Colors.white,fontSize: 30),),
                        )
                    ),
                   /// #Shop Now
                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: MaterialButton(
                         onPressed: (){},
                         height: 55,
                       minWidth: double.infinity,
                       color: Colors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                       child: const Text("Shop Now",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                     ),
                   ),
                  ],
                ),
              ),
            ),
            /// #body
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
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
                        image: AssetImage("assets/images/img_${index % 5}.png"),
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
                footer: GridTileBar(
                  backgroundColor: Colors.transparent,
                  subtitle: const Text(""),
                  trailing: IconButton(
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
class GridItem{
  late String image;
  bool likes = false;
  bool isSelected = false;

  GridItem({required this.image});
}