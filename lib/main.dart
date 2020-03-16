import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karticky/src/data_access/cards_da.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/utility/database_helper.dart';
import 'src/models/card_model.dart';
import 'src/models/cards_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper.instance;
  final cardDA = CardDA(dbHelper);
  final viewModel = CardsModel(cardDA);
  viewModel.load();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => viewModel),
        ChangeNotifierProvider(create: (_) => CardModel()),
      ],
      child: App(),
    ),
  );
}
