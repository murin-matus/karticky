import 'package:barcode_flutter/barcode_flutter.dart';

class BarcodeTypes {
  static List<BarCodeParams> getParams(String data) {
    return [
      EAN8BarCodeParams(data),
      EAN13BarCodeParams(data),
      Code39BarCodeParams(data),
      Code93BarCodeParams(data),
      Code128BarCodeParams(data),
      UPCABarCodeParams(data),
      UPCEBarCodeParams(data),
      ITFBarCodeParams(data),
      CodabarBarCodeParams(data)
    ];
  }
}
