import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'barcodeParams.dart';

@immutable
class BarcodeListWidget extends StatelessWidget {
  final String _barcode;

  BarcodeListWidget(this._barcode);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: BarcodeTypes.getParams(this._barcode)
          .map((p) => BarCodeImage(params: p))
          .toList(),
    );
  }
}
