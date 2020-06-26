import 'package:flutter/material.dart';

class AccountAction extends StatelessWidget {
  const AccountAction({
    Key key,
    @required IconData iconData,
    @required Function onPress,
    @required String text,
  })  : this.iconData = iconData,
        this.onPress = onPress,
        this.text = text,
        super(key: key);

  final IconData iconData;
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Ink(
          width: 35,
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(iconData, size: 20),
            color: Colors.white,
            onPressed: onPress,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Colors.lightBlue[400],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
