import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karticky/src/models/card_model.dart';
import 'package:karticky/src/models/cards_model.dart';
import 'package:karticky/src/ui/widgets/barcodes/barcodeParams.dart';
import '../barcodes/barcodeParams.dart';
import 'package:provider/provider.dart';

import '../barcodes/barcode_widget.dart';

@immutable
class CardFormWidget extends StatefulWidget {
  final CardModel _cardModel;

  CardFormWidget() : this._cardModel = CardModel();

  CardFormWidget.edit(this._cardModel);

  @override
  _CardFormWidgetState createState() => _CardFormWidgetState();
}

class _CardFormWidgetState extends State<CardFormWidget> {
  String _barcode;
  bool _showBarcodes = false;
  int _paramsType;
  TextEditingController _nameController;
  TextEditingController _numberController;

  @override
  void initState() {
    super.initState();

    _barcode = '';
    _nameController = TextEditingController();
    _numberController = TextEditingController();

    if (this.widget._cardModel != null) {
      _nameController.text = this.widget._cardModel.name;
      _numberController.text = this.widget._cardModel.number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTextFieldName(),
              Container(height: 10),
              _buildTextFieldNumber(),
              _buildButtons(context),
//              _barcodeTypePicker(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    this._barcode,
                    style: TextStyle(color: CupertinoColors.systemRed),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldName() {
    return CupertinoTextField(
      controller: _nameController,
      prefix: Icon(
        CupertinoIcons.bookmark,
        color: CupertinoColors.lightBackgroundGray,
        size: 28.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Card name',
      autofocus: true,
    );
  }

  Widget _buildTextFieldNumber() {
    return CupertinoTextField(
      controller: _numberController,
      prefix: Icon(
        CupertinoIcons.eye_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Card number',
    );
  }

  Widget _barcodeTypePicker() {
    if (this._showBarcodes) {
      return Container(
        height: 300,
        child: CupertinoPicker(
          itemExtent: 100,
          onSelectedItemChanged: (int value) {
            this.setState(() => _paramsType = value);
          },
          children: _buildList(),
        ),
      );
    } else {
      this.setState(() {
        _showBarcodes = false;
      });

      return CupertinoButton(
        child: Text('Show barcodes'),
        onPressed: () {
          this.setState(() {
            _showBarcodes = true;
          });
        },
      );
    }
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildScanButton(),
        _buildSubmitButton(context),
      ],
    );
  }

  Widget _buildScanButton() {
    return Center(
      child: CupertinoButton(
        onPressed: _scan,
        child: Text('Scan'),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Center(
      child: CupertinoButton(
        onPressed: () {
          _handleSubmitted(context);
        },
        child: Text('Submit'),
      ),
    );
  }

  void _handleSubmitted(context) {
    final model = Provider.of<CardsModel>(context, listen: false);

    final name = _nameController.text;
    final number = _numberController.text;

    model.addCard(CardModel.params(
        this.widget._cardModel.id, name, number, this._paramsType));

    _nameController.clear();
    _numberController.clear();

    Navigator.of(context).pop();
  }

  void _scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this._numberController.text = barcode;
      });
    } on PlatformException catch (e) {
      setState(() {
        this._barcode = (e.code == BarcodeScanner.CameraAccessDenied)
            ? 'Missing camera permission.'
            : 'Unknown error: $e';
      });
    } on FormatException {
      setState(() => this._barcode = 'Nothing.');
    } catch (e) {
      setState(() => this._barcode = 'Unknown error: $e');
    }
  }

  List<Widget> _buildList() {
    List<Widget> items = [];
    for (int i = 0; i < BarcodeTypes.getParams(this._barcode).length; i++) {
      items.add(BarcodeWidget(this._barcode, i));
    }
    return items;
  }
}
