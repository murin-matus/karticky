import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'barcodeParams.dart';

@immutable
class BarcodeWidget extends StatelessWidget {
  final String _barcode;
  final int _barcodeIndex;

  BarcodeWidget(String barcode, int barcodeIndex)
      : this._barcode = barcode,
        this._barcodeIndex = barcodeIndex;

  @override
  Widget build(BuildContext context) {
    return BarCodeImage(params: _barCodeParams());
  }

  BarCodeParams _barCodeParams() {
    final params = BarcodeTypes.getParams(this._barcode);
    final index = this._barcodeIndex % params.length;
    return params[index == 0 ? 1 : index];
  }
}
