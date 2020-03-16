import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'models/cards_model.dart';
import 'screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardsModel>(
      builder: (context, model, _) {
        return CupertinoApp(home: HomeScreen());
      },
    );
  }
}
