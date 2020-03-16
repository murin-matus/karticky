import 'package:flutter/cupertino.dart';
import 'package:karticky/src/models/card_model.dart';
import 'package:karticky/src/models/cards_model.dart';
import 'package:karticky/src/screens/details_page.dart';
import 'package:karticky/src/screens/edit_screen.dart';
import 'package:provider/provider.dart';

@immutable
class CardWidget extends StatelessWidget {
  final CardModel _cardModel;

  CardWidget(this._cardModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _cardDetails(context),
      onHorizontalDragEnd: (details) => {
        Provider.of<CardsModel>(context, listen: false).remove(_cardModel),
      },
      child: Container(
        decoration: BoxDecoration(
          color: _getColor(),
          border: Border(
            bottom: BorderSide(width: 0.0, color: CupertinoColors.inactiveGray),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIcon(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _buildCardBody(),
                ),
              ),
              _editButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardBody() {
    return Text(
      _cardModel.name,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildIcon() {
    return Icon(
      CupertinoIcons.circle,
      size: 35,
      color: _getColor(),
    );
  }

  void _cardDetails(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => DetailsPage(_cardModel),
      ),
    );
  }

  Widget _editButton(BuildContext context) {
    return CupertinoButton(
      child: Text(
        'Edit',
        style: TextStyle(color: CupertinoColors.placeholderText),
      ),
      onPressed: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => EditScreen(_cardModel),
          ),
        );
      },
    );
  }

  Color _getColor() {
    final colors = [
      CupertinoColors.activeGreen,
      CupertinoColors.activeBlue,
      CupertinoColors.activeOrange,
      CupertinoColors.destructiveRed,
      CupertinoColors.systemPink,
      CupertinoColors.systemPurple,
      CupertinoColors.systemYellow,
      CupertinoColors.systemIndigo,
      CupertinoColors.systemTeal
    ];

    final color = (DateTime.now().microsecondsSinceEpoch) % colors.length;
    return colors[color];
  }
}
