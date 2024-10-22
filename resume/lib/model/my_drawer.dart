import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
