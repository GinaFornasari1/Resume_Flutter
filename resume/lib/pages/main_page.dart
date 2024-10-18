import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
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
  CardSwiperController cardSwiperController = CardSwiperController();
  //final animationsMap = <String, AnimationInfo>{};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          drawer: contact_drawer(),
          appBar: my_appBar(),
          body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      flipCardCell(),
                      DescriptionCell(),
                      SkillsSwipe(),
                      skills_checklist()
                    ]),
              ))),
    );
  }

  AppBar my_appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 39, 101, 41),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(
          Icons.more_vert_sharp,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () async {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      title: const Text('Gina Fornasari',
          style: TextStyle(color: Colors.white, fontSize: 25)),
      actions: [],
      centerTitle: false,
      elevation: 2,
    );
  }

  Drawer contact_drawer() {
    return Drawer(
      elevation: 16,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 316,
              height: 243,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: const AlignmentDirectional(0, 0),
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
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 193, 186, 206)),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            speed: 400,
            front: Container(
              width: 190,
              height: 190,
              decoration: const BoxDecoration(
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
                  alignment: const Alignment(0, 0),
                ),
              ),
            ),
            back: Container(
              width: 190,
              height: 190,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: const Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                    'Yes I am so great \nHire me and pay me lots of money \nblah blah blah'),
              ),
            ),
          ),
        ));
  }

  Container DescriptionCell() {
    return Container(
      width: 396,
      height: 123,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 210, 237, 245)),
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

  Container SkillsSwipe() {
    return Container(
        width: 400,
        height: 202,
        decoration: const BoxDecoration(color: Colors.orange),
        child: Stack(children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
              'https://picsum.photos/seed/280/600',
              width: 90,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Swiper(
            itemCount: 4,
            pagination: const SwiperPagination(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.white,
                    size: 20,
                    activeSize: 20)),
            layout: SwiperLayout.CUSTOM,
            itemWidth: 310,
            itemHeight: 400,
            customLayoutOption: CustomLayoutOption(
              startIndex: -1,
              stateCount: 3,
            )
              ..addRotate([-45 / 180, 0, 45 / 100])
              ..addTranslate([
                const Offset(-370, -40),
                const Offset(0, 0),
                const Offset(370, -40)
              ]),
            itemBuilder: (context, index) {
              return Row(children: [
                Card(
                    child: SizedBox(
                        height: 300,
                        width: 300,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://picsum.photos/seed/280/600',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ))))
              ]);
            },
          )
        ]));
  }

  Container skills_checklist() {
    return Container(
      width: 400,
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0x97A98CB4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Text(
                      'Hello World',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Flexible(
                  child: Theme(
                    data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        unselectedWidgetColor: Colors.yellow),
                    child: CheckboxListTile(
                      value: true, //_model.checkboxListTileValue1 ??= true,
                      onChanged: null,

                      title: const Text(
                        'Java',
                        textAlign: TextAlign.start,
                      ),
                      tileColor: Colors.pink,
                      activeColor: Colors.purple,
                      checkColor: const Color(0xFF4B986C),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
