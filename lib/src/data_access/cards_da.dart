import '../utility/database_helper.dart';

import '../models/card_model.dart';
import 'base_da.dart';

class CardDA extends BaseDA<CardModel, DatabaseHelper> {
  CardDA(DatabaseHelper dataAccess) : super(dataAccess);

  @override
  Future<List<CardModel>> getAll() async {
    return (await this.api.queryAllRows())
        .map(
          (c) => CardModel.params(
            c[DatabaseHelper.columnId],
            c[DatabaseHelper.columnName],
            c[DatabaseHelper.columnNumber],
            c[DatabaseHelper.columnParamsType],
          ),
        )
        .toList();
  }

  @override
  Future<void> update(CardModel card) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: card.id,
      DatabaseHelper.columnName: card.name,
      DatabaseHelper.columnNumber: card.number,
      DatabaseHelper.columnParamsType: card.indexType
    };
    await api.update(row);
  }

  @override
  Future<void> insert(CardModel card) async {
    final Map<String, dynamic> row = {
      DatabaseHelper.columnName: card.name,
      DatabaseHelper.columnNumber: card.number,
      DatabaseHelper.columnParamsType: card.indexType,
    };
    api.insert(row);
  }

  @override
  Future<void> saveList(List<CardModel> list) async {
    for (var i = 0; i < list.length; i++) {
      final Map<String, dynamic> row = {
        DatabaseHelper.columnName: list[i].name,
        DatabaseHelper.columnNumber: list[i].number,
        DatabaseHelper.columnParamsType: list[i].indexType
      };
      api.insert(row);
    }
  }

  @override
  Future<void> delete(CardModel item) async {
    await api.delete(item.id);
  }
}
