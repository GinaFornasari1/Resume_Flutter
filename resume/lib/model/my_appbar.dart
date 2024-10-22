import 'package:flutter/material.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  MyAppBarWidget({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
