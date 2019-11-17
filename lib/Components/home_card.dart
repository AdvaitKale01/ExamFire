import 'package:flutter/material.dart';
import 'package:college_app/Components/utils.dart';

class HomeCard extends StatelessWidget {
  final onPressed;
  final String image;
  final colors;
  final String text;
  final double height, width;
  HomeCard(
      {@required this.onPressed,
      @required this.image,
      @required this.colors,
      @required this.text,
      @required this.height,
      @required this.width});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onPressed,
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage('images/$image'),
                  height: 90,
                  width: 90,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  text,
                  style: kCardTitleTextStyle,
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.bottomRight,
                colors: colors,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
