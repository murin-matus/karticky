import 'package:flutter/material.dart';
import 'package:karticky/src/models/card_model.dart';
import 'package:karticky/src/models/cards_model.dart';
import 'package:provider/provider.dart';

import 'card_widget.dart';

class CardsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardsModel>(
      builder: (context, model, _) => SafeArea(
          child: ListView(
              children: model.cards.length > 0
                  ? ([
//                      Text('Pridat last_used, update pri otvoreni'),
//                      Text('Pridat color per record'),
                    ]..addAll(
                      _buildCardsList(model.cards),
                    ))
                  : [Center(child: Text('Cards not loaded.'))])),
      child: Center(child: Text('No cards')),
    );
  }

  List<Widget> _buildCardsList(List<CardModel> cards) {
    return cards.map((c) => CardWidget(c)).toList();
  }
}
