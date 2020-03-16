import 'package:flutter/cupertino.dart';
import 'package:karticky/src/models/cards_model.dart';
import 'package:karticky/src/ui/screens/home/cards_widget.dart';

import 'package:provider/provider.dart';
import '../models/cards_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: _delete(context),
        middle: Text('Cards'),
        trailing: _newCard(context),
      ),
      child: CardsWidget(),
    );
  }

  Widget _newCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<CardsModel>(context, listen: false).generate();
//        Navigator.of(context).push(
//          CupertinoPageRoute(
//            builder: (context) => NewScreen(),
//          ),
//        );
      },
      child: Icon(
        CupertinoIcons.add,
        size: 35,
      ),
    );
  }

  Widget _delete(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<CardsModel>(context, listen: false).delete();
      },
      child: Icon(
        CupertinoIcons.delete,
        size: 35,
      ),
    );
  }
}
