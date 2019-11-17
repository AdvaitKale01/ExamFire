import 'package:flutter/material.dart';
import 'package:college_app/Components/utils.dart';
import 'package:line_icons/line_icons.dart';

class RoundedDropDown extends StatefulWidget {
  final String title;
  String value;
  final List<String> items;
  String getValue() {
    print(value);
    return value;
  }

  RoundedDropDown(
      {@required this.title, @required this.value, @required this.items});
  @override
  _RoundedDropDownState createState() => _RoundedDropDownState();
}

class _RoundedDropDownState extends State<RoundedDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30, right: 20),
          child: Text(
            widget.title,
            style: kNormalTextStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 15, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: AppColors.primaryBlack,
                style: BorderStyle.solid,
                width: 0.80),
          ),
          child: DropdownButton<String>(
            value: widget.value,
            icon: Icon(LineIcons.arrow_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: AppColors.primaryBlue,
            ),
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              setState(() {
                widget.value = newValue;
                print(widget.getValue());
              });
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
