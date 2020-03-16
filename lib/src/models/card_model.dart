import 'package:karticky/src/data_access/cards_da.dart';
import 'package:karticky/src/models/base_model.dart';

class CardModel extends BaseModel {
  String name;
  String number;
  int indexType;
  String color;

  CardModel() : super(DateTime.now().microsecondsSinceEpoch);

  CardModel.card(this.name, this.number)
      : super(DateTime.now().microsecondsSinceEpoch);

  CardModel.params(id, this.name, this.number, this.indexType) : super(id);
}
