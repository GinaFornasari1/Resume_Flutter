import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Resume App',
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color.fromARGB(255, 39, 176, 135),
            appBarTheme: AppBarTheme(
              backgroundColor: Color.fromARGB(255, 109, 178, 233),
              // titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
                .copyWith(background: Colors.green)
                .copyWith(secondary: Color.fromARGB(255, 210, 42, 81))),
        home: MainPage(),
      ),
    );
    // return const MaterialApp(
    //     debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MyAppState extends ChangeNotifier {
  GlobalKey? historyListKey;

  void getNext() {
    // history.insert(0, current);
    // var animatedList = historyListKey?.currentState as AnimatedListState?;
    // animatedList?.insertItem(0);
    // current = WordPair.random();
    // notifyListeners();
  }
}
