import 'package:college_app/Screens/ShowThingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:college_app/Components/utils.dart';
import 'package:college_app/Components/subject_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:college_app/Components/ShowScreenCompo.dart';
import 'package:college_app/Screens/ShowThingsScreen.dart';

String Branch='Computer Science';
String Year = 'First Year';
String Subject;
String DocType='Notes';
class ShowScreen extends StatefulWidget {
  static String id = 'ShowScreen';

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {

  final TextEditingController _typeAheadController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: Branch,
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
                  Branch = newValue;
                  SubjectsService.getYear(Year, Branch);

                });
              },
              items: <String>[
                'Computer Science',
           'Information Technology'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(
              height: 5,
            ),
            DropdownButton<String>(
              value: Year,
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
                  Year = newValue;
                  SubjectsService.getYear(Year, Branch);

                });
              },
              items: <String>[
                'First Year',
                'Second Year',
                'Third Year',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 5,
            ),

            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: this._typeAheadController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  labelText: 'Subject',
                  hintText: 'Subject of Document',
                  hintStyle: kNormalTextStyle.copyWith(
                      fontWeight: FontWeight.bold),
                  labelStyle: kNormalTextStyle.copyWith(
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return SubjectsService.getSuggestions(pattern);
              },
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  hasScrollbar: true,
                  shadowColor: Colors.blue,
                  elevation: 20),
              keepSuggestionsOnLoading: false,
              hideOnLoading: true,
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                this._typeAheadController.text = suggestion;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please select a subject!';
                }
                return null;
              },
              hideSuggestionsOnKeyboardHide: false,
              onSaved: (value) => Subject = value,
            ),
            SizedBox(
              height: 5,
            ),

            DropdownButton<String>(
              value: DocType,
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
                setState(
                      () {
                    DocType = newValue;
                  },
                );
              },
              items: <String>[
                'Notes',
                'Mid Sem Test Paper',
                'End Sem Test Paper',
                'Assignment',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            RaisedButton(
              child: Text('Show'),
              onPressed: ()async{
await getProduct();

 Navigator.of(context).push(
  MaterialPageRoute(builder: (context) {
    return ShowData();
  }),
);
              },
            ),
          ],
        ),
      ),
    );
  }
}
