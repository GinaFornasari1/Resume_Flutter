import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:resume/model/my_appbar.dart';
import 'package:resume/model/my_card_swiper.dart';
import 'package:resume/model/my_drawer.dart';
import 'package:resume/model/my_flipcard.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPage>
    with TickerProviderStateMixin {
  //late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  CardSwiperController cardSwiperController = CardSwiperController();
  final MyTileManager tileManager = MyTileManager();
  //final animationsMap = <String, AnimationInfo>{};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          drawer: MyDrawerWidget(),
          appBar: MyAppBarWidget(scaffoldKey: scaffoldKey),
          body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                    //mainAxisSize: MainAxisSize.max,

                    //crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [
                      MyFlipCard(),
                      DescriptionCell(),
                      MyCardSwiper(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: MyTileList(
                            myList: ['java', 'sql', 'python'],
                          )),
                          Expanded(
                              child: MyTileList(
                            myList: ['VsCode', 'WB', 'IntelliJ'],
                          ))
                        ],
                      )
                    ]),
              ))),
    );
  }

  Container DescriptionCell() {
    return Container(
      width: 396,
      height: 123,
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: const Align(
        alignment: AlignmentDirectional(-1, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Text(
            'Hello World\nHire me and pay me lots of money \nblah blah \nblah blah lol      lol   ojojoihiuhhuytfrtvsesrtfessebbrfrdvdtb  ',
            textAlign: TextAlign.start,
            // ).animateOnPageLoad(
            //     animationsMap['textOnPageLoadAnimation1']!),
          ),
        ),
      ),
    );
  }
}

// Tile stuff here
class MyTileModel {
  final Icon icon; // Icon to be displayed
  final String text; // Text to be displayed

  MyTileModel({required this.text})
      : icon = Icon(Icons.check_outlined, size: 40);
}

class MyTileManager {
  final List<MyTileModel> _tiles = [];

  void addTiles(String text) {
    _tiles.add(MyTileModel(text: text));
  }

  List<MyTileModel> get tiles => _tiles;
}

class MyTileList extends StatefulWidget {
  final List<String> myList;
  MyTileList({required this.myList});

  @override
  _MyTileLanguages createState() => _MyTileLanguages();
}

class _MyTileLanguages extends State<MyTileList> {
  final MyTileManager tileManager = MyTileManager();
  late List<String> myList = [];

  @override
  void initState() {
    super.initState();
    myList = widget.myList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white, // Background color
      //   border: Border.all(
      //     color: Colors.blue, // Border color
      //     width: 2, // Border width
      //   ),
      //   borderRadius: BorderRadius.circular(8), // Optional: rounded corners
      // ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.lightBlue, // Border color
                width: 3, // Border width
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check_sharp, size: 24),
                SizedBox(width: 10), // Example icon
                Text(
                  myList[index],
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
