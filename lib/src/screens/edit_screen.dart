import 'package:flutter/cupertino.dart';
import 'package:karticky/src/models/card_model.dart';
import 'package:karticky/src/ui/widgets/cards/card_form_widget.dart';

@immutable
class EditScreen extends StatelessWidget {
  final CardModel _cardModel;

  EditScreen(this._cardModel);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Edit card'),
      ),
      child: Center(
        child: CardFormWidget.edit(this._cardModel),
      ),
    );
  }
}
