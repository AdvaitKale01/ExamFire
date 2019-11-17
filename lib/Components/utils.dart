import 'package:flutter/material.dart';

class Fonts {
  static const primaryFont = "Quicksand";
}

class AppColors {
  static const primaryBlack = const Color(0xFF313544);
  static const primaryBlue = const Color(0xFF272F5F);
  static const secondaryColor = const Color(0xFFFF8C33);
}

class Texts {
  static const welcomeText2 = const Text(
    'Tell us more about yourself. Don\'t worry, it\'s a secret  ;)',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 16.0,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );

  static const nextText = const Text(
    'Next',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 18.0,
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.bold,
    ),
  );

  static const headerTextTrade = const Text(
    'Trade',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 30.0,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.bold,
    ),
  );

  static const headerTextTrade2 = const Text(
    'I would like to trade:',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 18.0,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.bold,
    ),
  );

  static const headerTextTrade3 = const Text(
    'For:',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 18.0,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.bold,
    ),
  );

  static const headerTextTrade4 = const Text(
    'With:',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 18.0,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.bold,
    ),
  );

  static const makeOffer = const Text(
    'Make Offer',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  static const headerTextManage = const Text(
    'Manage',
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontSize: 30.0,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.bold,
    ),
  );
}

class TabText {
  static const tabText1 = const Text(
    "Visible",
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  );

  static const tabText2 = const Text(
    "Hidden",
    style: TextStyle(
      fontFamily: Fonts.primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  );
}

const kTitleTextStyle = TextStyle(
  fontSize: 30.0,
  color: AppColors.primaryBlue,
  fontFamily: 'Quicksand',
);

const kButtonTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Quicksand',
);

const kCardTitleTextStyle = TextStyle(
  fontSize: 35.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Quicksand',
);

const kNormalTextStyle = TextStyle(
  fontFamily: Fonts.primaryFont,
  fontSize: 18.0,
  color: AppColors.primaryBlue,
  fontWeight: FontWeight.bold,
);

class RoundedTextBox extends StatelessWidget {
  //final onChanged;
  final validate, onSaved;
  final String labelText, hintText;

  RoundedTextBox(
      {@required this.hintText,
      @required this.labelText,
      // @required this.onChanged,
      @required this.validate,
      @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryBlue),
      // onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        labelText: labelText,
        hintText: hintText,
        hintStyle: kNormalTextStyle,
        labelStyle: kNormalTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      validator: validate,
    );
  }
}
