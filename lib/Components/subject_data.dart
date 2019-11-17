class SubjectsService {
  static List<String> subjects;

  static final List<String> year1cs = [
    'Mathematics - 1',
    'Applied Physics',
    'Introduction to   Computer Science and Engineering',
    'Digital Logic And Circuit Design',
    'Principal of C Language',
    'Computer Peripherals and Interfaces',
    'Software Foundation and Programming-1 (with C)',
    'Web Development Lab-1(xml & html)',
    'Programming Skills with C',
    'Red Hat Administration - 1',
    'Mobile Application Development - 1',
    'Mathematics - 2',
    'Data Structure and Algorithms',
    'Computer System Organisation',
    'Object Oriented Programming',
    'Programming Skills with C++',
    'Introduction To Core Java',
    'Communication Skills',
    'Software Foundation and Programming - 1(with C++)',
    'Red Hat Administration - 2',
    'Mobile Application Development - 2',
  ];

  static final List<String> year2cs = [
    'Year2cs',
  ];

  static final List<String> year3cs = [
    'Year3cs',
  ];
  static final List<String> year1it = [
    'Year1it',
  ];

  static final List<String> year2it = [
    'Year2it',
  ];

  static final List<String> year3it = [
    'Year3it',
  ];

  static getYear(String year, String branch) {
    if (year == 'First Year') {
      if (branch == 'Computer Science')
        subjects = year1cs;
      else
        subjects = year1it;
    } else if (year == 'Second Year') {
      if (branch == 'Computer Science')
        subjects = year2cs;
      else
        subjects = year2it;
    } else {
      if (branch == 'Computer Science')
        subjects = year3cs;
      else
        subjects = year3it;
    }
  }

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(subjects);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
