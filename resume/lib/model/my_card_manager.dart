import 'package:resume/model/my_card_model.dart';

class MyCardManager {
  final List<MyCardModel> _cards = [];

  void addCard(String title, String imageUrl) {
    _cards.add(MyCardModel(title: title, url: imageUrl));
  }

  List<MyCardModel> get cards => _cards;
}
