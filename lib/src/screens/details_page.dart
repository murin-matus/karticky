import 'package:flutter/cupertino.dart';
import 'package:karticky/src/models/card_model.dart';
import 'package:karticky/src/ui/widgets/cards/card_detail_widget.dart';

@immutable
class DetailsPage extends StatelessWidget {
  final CardModel _cardModel;

  DetailsPage(this._cardModel);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          CupertinoNavigationBar(middle: Text('#${this._cardModel.id}')),
      child: Center(child: CardDetailWidget(this._cardModel)),
    );
  }
}
