import 'package:flutter/cupertino.dart';
import 'package:karticky/src/ui/widgets/cards/card_form_widget.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('New card'),
      ),
      child: CardFormWidget(),
    );
  }
}
