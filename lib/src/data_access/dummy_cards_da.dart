import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/card_model.dart';
import 'base_da.dart';

//class CardDummyDA extends BaseDA<CardModel, SharedPreferences> {
//  CardDummyDA(SharedPreferences dataAccess) : super(dataAccess);
//
//  @override
//  Future<List<CardModel>> getAll() async {
//    return this
//        .api
//        .getStringList('flutter_cards')
//        .map((c) => c.split('|'))
//        .map((c) => CardModel.params(DateTime.now().microsecondsSinceEpoch,
//            c[1], c[2], Random.secure().nextInt(1000)))
//        .toList();
//  }
//
//  @override
//  Future<void> saveList(List<CardModel> list) async {
//    final converted = list
//        .map((c) => '${c.id}|${c.name}|${c.number}|${c.indexType}')
//        .toList();
//    this.api.setStringList('flutter_cards', converted);
//  }
//
//  @override
//  Future<void> insert(CardModel item) {
//    // TODO: implement insert
//    throw UnimplementedError();
//  }
//
//  @override
//  Future<void> delete(CardModel item) {
//    // TODO: implement insert
//    throw UnimplementedError();
//  }
//
//  @override
//  Future<void> update(CardModel item) {
//    // TODO: implement update
//    throw UnimplementedError();
//  }
//}
