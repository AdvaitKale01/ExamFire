import 'package:flutter/material.dart';
import 'package:college_app/Components/utils.dart';

class ConnectButton extends StatelessWidget {
  final String text;
  final onPressed;
  final icon;
  final color;
  ConnectButton({
    @required this.onPressed,
    @required this.text,
    @required this.icon,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 250,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: onPressed,
        color: color,
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: kButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
