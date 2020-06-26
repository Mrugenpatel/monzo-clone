import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData iconData;
  final double size;
  const AppBarIcon({
    Key key,
    IconData iconData,
    double size,
  })  : this.iconData = iconData,
        this.size = size ?? 25,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {},
      child: Icon(iconData, color: Colors.lightBlue, size: size),
    );
  }
}
