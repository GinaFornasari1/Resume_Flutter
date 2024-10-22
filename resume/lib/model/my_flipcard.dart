import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class MyFlipCard extends StatelessWidget {
  const MyFlipCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 391,
        height: 202,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: MyFlipCardWidget(),
        ));
  }

  static BoxDecoration FlipCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
  }
}

class MyFlipCardWidget extends StatelessWidget {
  const MyFlipCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Container(
        width: 190,
        height: 190,
        decoration: MyFlipCard.FlipCardDecoration(context),
        child: FlipCardFront(),
      ),
      back: FlipCardBack(),
    );
  }
}

class FlipCardBack extends StatelessWidget {
  const FlipCardBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      decoration: MyFlipCard.FlipCardDecoration(context),
      child: const Align(
        alignment: AlignmentDirectional(0, 0),
        child: Text(
            'Yes I am so great \nHire me and pay me lots of money \nblah blah blah'),
      ),
    );
  }
}

class FlipCardFront extends StatelessWidget {
  const FlipCardFront({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        'https://picsum.photos/seed/89/600',
        width: 132,
        height: 151,
        fit: BoxFit.scaleDown,
        alignment: const Alignment(0, 0),
      ),
    );
  }
}
