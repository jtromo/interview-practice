import 'package:flutter/material.dart';
import 'package:simple_example/models/bottle.dart';
import 'package:simple_example/widgets/drawing/level_group_card.dart';

class LevelGroupCards extends StatefulWidget {
  final List<Bottle> bottles;

  const LevelGroupCards(
    this.bottles, {
    super.key,
  });

  @override
  State<LevelGroupCards> createState() => LevelGroupCardsState();
}

class LevelGroupCardsState extends State<LevelGroupCards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // Use SingleChildScrollView instead of a ListView since a horizontal ListView requires height Container
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Row(
            children: _renderLevelGroupCards(widget.bottles),
          ),
        ));
  }

  bool _cardIsClickable(int index) {
    // Only clickable if has details
    return widget.bottles[index].hasDetails;
  }

  List<Widget> _renderLevelGroupCards(List<Bottle> bottlesList) {
    const groupCardWidth = 160.0;
    return List<Widget>.generate(bottlesList.length, (int index) {
      return Container(
          // Add right spacing for all cards except for the last one
          margin: index == (bottlesList.length - 1) ? null : const EdgeInsets.only(right: 12),
          child: LevelGroupCard(
            bottle: widget.bottles[index],
            width: groupCardWidth,
            clickable: _cardIsClickable(index),
          ));
    });
  }
}
