import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flip_card/flip_card.dart';

import 'Main_page_model.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPage>
    with TickerProviderStateMixin {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  //final animationsMap = <String, AnimationInfo>{};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          drawer: Contact_Drawer(),
          appBar: MyAppBar(),
          body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(),
              ))),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 39, 101, 41),
      automaticallyImplyLeading: false,
      leading: IconButton(
        //borderColor: Colors.transparent,
        //borderRadius: 30,
        //borderWidth: 1,
        //buttonSize: 60,
        icon: Icon(
          Icons.more_vert_sharp,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () async {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      title: Text('Gina Fornasari',
          style: TextStyle(color: Colors.white, fontSize: 25)),
      actions: [],
      centerTitle: false,
      elevation: 2,
    );
  }

  Drawer Contact_Drawer() {
    return Drawer(
      elevation: 16,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 316,
              height: 243,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: AlignmentDirectional(0, 0),
                      image: Image.network(
                        'https://picsum.photos/seed/979/600',
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container flipCardCell() {
    return Container(
        width: 391,
        height: 202,
        decoration: BoxDecoration(color: Color.fromARGB(255, 193, 186, 206)),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            speed: 400,
            front: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/89/600',
                  width: 132,
                  height: 151,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment(0, 0),
                ),
              ),
            ),
            back: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                    'Yes I am so great \nHire me and pay me lots of money \nblah blah blah'),
              ),
            ),
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
        title: Text('Gina Fornasari',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 153, 114, 164),
        elevation: 2,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.all(14),
              child: SvgPicture.asset('assets/icons/dots.svg')),
        ));
  }
}
