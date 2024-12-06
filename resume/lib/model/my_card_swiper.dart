import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:resume/model/my_card_manager.dart';

class MyCardSwiper extends StatefulWidget {
  @override
  _MyCardSwiperState createState() => _MyCardSwiperState();
}

class _MyCardSwiperState extends State<MyCardSwiper> {
  final MyCardManager cardManager = MyCardManager(); // Instantiate CardManager

  @override
  void initState() {
    super.initState();
    // Adding some initial cards
    //cardManager.addCard('title 1','https://github.com/GinaFornasari1/BlurImageProject.git'); //'https://picsum.photos/seed/888/600');
    cardManager.addCard('Google',
        'https://google.com'); //'title 2', 'https://picsum.photos/seed/103/600');
    //cardManager.addCard('title 3', 'https://picsum.photos/seed/198/600');
  }

  ConstrainedBox SwipeBackgroundImage() {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Image.network(
        'https://picsum.photos/seed/280/600',
        width: 90,
        height: 90,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 202,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Stack(
        children: [
          SwipeBackgroundImage(),
          Swiper(
              itemCount: cardManager.cards.length,
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
                final card = cardManager.cards[index];
                return Card(
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        card.url,
                        width: 90,
                        height: 90,
                        //width: double.infinity
                        //height: double.infinity
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
