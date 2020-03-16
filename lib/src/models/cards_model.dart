import 'package:flutter/material.dart';
import 'package:karticky/src/data_access/cards_da.dart';

import 'card_model.dart';

class CardsModel extends ChangeNotifier {
  final CardDA _cardDa;

  CardModel _card;
  CardModel get card => _card;

  List<CardModel> _cards;
  List<CardModel> get cards => _cards;

  CardsModel(this._cardDa) : this._cards = [];

  void addCard(CardModel card) async {
    await _cardDa.insert(card);

    load();
  }

  void update(CardModel card) async {
    await _cardDa.update(card);

    load();
  }

  void generate() {
    for (int i = 0; i < 100; i++) {
      final cardNumber = DateTime.now().microsecondsSinceEpoch.toString();
      _cardDa.insert(CardModel.params(
        DateTime.now().microsecondsSinceEpoch,
        'CARD: ${_cards.length + i}',
        cardNumber,
        i,
      ));
    }
    load();
  }

  void remove(CardModel cart) async {
    await _cardDa.delete(cart);

    load();
  }

  void delete() async {
    _cards.forEach((element) {
      _cardDa.delete(element);
    });

    load();
  }

  void load() async {
    _cards = await _cardDa.getAll();
    if (_card != null) {
      _card = _cards.firstWhere((element) => element.id == _card.id);
    }

    notifyListeners();
  }
}
