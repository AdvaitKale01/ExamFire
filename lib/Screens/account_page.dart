import 'package:flutter/material.dart';
import 'package:college_app/Components/utils.dart';

class AccountPage extends StatefulWidget {
  final String userEmail, userName, userProfilePicURL, year, branch, program;
  AccountPage(this.userEmail, this.userName, this.userProfilePicURL, this.year,
      this.branch, this.program);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  height: 130.0,
                  decoration: BoxDecoration(color: AppColors.primaryBlack),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.userProfilePicURL)),
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: 'Hello ',
                  style: TextStyle(
                    fontFamily: Fonts.primaryFont,
                    fontSize: 28.0,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ), // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.userName,
                    ),
                  ],
                ),
              ),
              Text(
                widget.userEmail,
                style: TextStyle(
                  fontFamily: Fonts.primaryFont,
                  fontSize: 14.0,
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        //Year Drop Down Start
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text.rich(
                TextSpan(
                  text: 'You are currently in ',
                  style: TextStyle(
                    fontFamily: Fonts.primaryFont,
                    fontSize: 20.0,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ), // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.year,
                    ),
                    TextSpan(
                      text: '!\nYou are persuading ',
                    ),
                    TextSpan(
                      text: widget.program,
                    ),
                    TextSpan(
                      text: ' in ',
                    ),
                    TextSpan(
                      text: widget.branch,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30, left: 20),
          child: Text(
            'Your Posts',
            style: kNormalTextStyle.copyWith(
                fontSize: 24, color: AppColors.primaryBlack),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
              child: Text(
                'Feels loneny Here    : (',
                style: kNormalTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserImage(AssetImage img, double size, double margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
