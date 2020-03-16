import 'package:flutter/foundation.dart';

abstract class BaseModel extends ChangeNotifier {
  int _id;
  DateTime _insertedAt;

  int get id => _id;
  DateTime get insertedAt => _insertedAt;

  BaseModel(this._id) : this._insertedAt = DateTime.now().toUtc();
}
