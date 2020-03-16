import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karticky/src/models/card_model.dart';

import '../barcodes/barcode_widget.dart';

@immutable
class CardDetailWidget extends StatelessWidget {
  final CardModel _cardModel;

  CardDetailWidget(this._cardModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BarcodeWidget(this._cardModel.number, this._cardModel.indexType),
        Center(
          child: _buildItem(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this._cardModel.number,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(Widget child) {
    return Container(
      decoration: BoxDecoration(color: CupertinoColors.systemBackground),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: child),
      ),
    );
  }
}
