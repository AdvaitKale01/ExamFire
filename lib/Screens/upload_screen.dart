import 'package:college_app/Components/utils.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:college_app/Components/subject_data.dart';
import 'package:college_app/Components/upload_data.dart';
import 'package:college_app/Components/SelectDoucumentAndUpload.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //Datatypes
  String _filePath ='',
      _title,
      _year = 'First Year',
      _subject,
      _branch = 'Computer Science',
      _teacher,
      _docType = 'Notes';
  bool _showTeacher = true;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SubjectsService.getYear(_year, _branch);
    _subject = _typeAheadController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              //The card design
              // height: 640, //Card Height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4DD0E1), Color(0xFFFFCFFF)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                          child: Image(
                            image: AssetImage('images/upload.png'),
                            height: 75,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Text(
                          'SELECT FILE',
                          style: TextStyle(
                            fontFamily: Fonts.primaryFont,
                            fontSize: 30.0,
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          _filePath,
                          style: TextStyle(
                            fontFamily: Fonts.primaryFont,
                            fontSize: 16.0,
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      //_subject = _typeAheadController.text;

                      var file = await SelectDocAndUpload();
                      setState(() {
                        _filePath=file;
                      });
                      //print('Upload pressed! $_subject\n$_branch\n$_year');


                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Fetching Your File...'),
                        ),
                      );
                    },
                  ),
                  Divider(
                    thickness: 6,
                    indent: 30,
                    endIndent: 30,
                    color: Color(0x77FFFFFF),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RoundedTextBox(
                      labelText: 'Title',
                      hintText: 'Eg: Physics Unit 1',
//                      onChanged: (value) {
//                        _title = value;
//                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter document title!';
                        }
                        return null;
                      },
                      onSaved: (value) => this._title = value,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          value: _year,
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
                              _year = newValue;
                              SubjectsService.getYear(_year, _branch);
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
                          value: _branch,
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
                              _branch = newValue;
                              SubjectsService.getYear(_year, _branch);
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
                  //Type Ahed Form Field
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TypeAheadFormField(
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
                      onSaved: (value) => this._subject = value,
                    ),
                  ),
                  //Notes
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: 160,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: AppColors.primaryBlack,
                            style: BorderStyle.solid,
                            width: 0.70),
                      ),
                      child: DropdownButton<String>(
                        value: _docType,
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
                              _docType = newValue;
                              if (_docType == 'Notes' ||
                                  _docType == 'Assignment') {
                                _showTeacher = true;
                              } else {
                                _showTeacher = false;
                              }
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
                    ),
                  ),
                  //Teacher
                  _showTeacher
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 5.0),
                          child: RoundedTextBox(
                            labelText: 'Teacher',
                            hintText: 'Teacher of Document',
//                      onChanged: (value) {
//                        _teacher = value;
//                      },
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter teacher of the notes!';
                              }
                              return null;
                            },
                            onSaved: (value) => this._teacher = value,
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),

                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      _submitForm();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Uploading Your File...'),
                      ));

                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 12),
                      decoration: BoxDecoration(
                        color: Color(0xEFFFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          topRight: Radius.circular(150),
                        ),
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'UPLOAD',
                        style: TextStyle(
                          fontFamily: Fonts.primaryFont,
                          fontSize: 30.0,
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {}

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      Scaffold.of(context).showSnackBar(
        new SnackBar(
          backgroundColor: Colors.red,
          content: new Text('Please Review the details!'),
        ),
      );
    } else {
      form.save(); //This invokes each onSaved event
      UploadData(
          Title: this._title,
          Branch: this._branch,
          DocType: this._docType,
          Teacher: this._teacher,
          Year: this._year,
          Subject: this._subject);
      print('Form ok!');
      _uploadToFireBase();
    }
  }

  void _uploadToFireBase() {
    //TODO: Upload Details and File to Fire Store
  }

  @override
  void dispose() {
    super.dispose();
    _typeAheadController.dispose();
  }
}
