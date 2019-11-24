import 'package:college_app/Screens/ShowThingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:college_app/Components/utils.dart';
import 'package:college_app/Components/subject_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:college_app/Components/ShowScreenCompo.dart';
import 'package:college_app/Screens/ShowThingsScreen.dart';
import 'package:college_app/Screens/setting_page.dart';

String Branch = 'Computer Science',
    Year = 'First Year',
    Subject,
    DocType = 'Notes';

class ShowScreen extends StatefulWidget {
  static String id = 'ShowScreen';

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SubjectsService.getYear(Year, Branch);
    Subject = _typeAheadController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image(
            image: AssetImage('images/appbarlogo.png'),
          ),
        ),
        title: Text(
          'EXAMFIRE',
          style: TextStyle(
            color: Color(0xFFFFA900),
            fontFamily: 'Roboto',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SettingPage.id);
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9796f0), Color(0xFFfbc7d4)],
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 110,
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: AppColors.primaryBlack,
                        style: BorderStyle.solid,
                        width: 0.70),
                  ),
                  child: DropdownButton<String>(
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
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 180,
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: AppColors.primaryBlack,
                        style: BorderStyle.solid,
                        width: 0.70),
                  ),
                  child: DropdownButton<String>(
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
                      'Information Technology',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: this._typeAheadController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  labelText: 'Subject',
                  hintText: 'Subject of Document',
                  hintStyle:
                      kNormalTextStyle.copyWith(fontWeight: FontWeight.bold),
                  labelStyle:
                      kNormalTextStyle.copyWith(fontWeight: FontWeight.bold),
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
            RaisedButton(
              child: Text('Show'),
              onPressed: () async {
                Subject = _typeAheadController.text;
                print(Subject);
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
