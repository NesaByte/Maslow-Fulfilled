import 'package:my_needs/util/questions_class.dart';

List<Question> _list = [
  //Deficiency needs- triggered by a lack
  //Physiological Questions
  Question('Physiological', 'Are you inhaling good quality air today?', false),
  Question('Physiological',
      'Do you have access to sufficient amount of water today?', false),
  Question('Physiological', 'Did you eat enough today?', false),
  Question('Physiological', 'Do you have a roof over your head today?', false),
  Question('Physiological', 'Did you have a peaceful slumber?', false),
  Question('Physiological', 'Does your clothes keep you warm?', false),
  Question('Physiological', 'Are you feeling productive today?', false),
  Question('Physiological', 'Are you in good physical health?', false),

  //Safety Questions
  Question('Safety', 'Do you feel safe?', false),
  Question('Safety', 'Hows your work today?', false),
  Question('Safety', 'Are you able to do what you planned to do today?', false),
  Question('Safety', 'How\'s your health today?', false),
  Question('Safety', 'Are you financially secured right now?', false),
  Question('Safety', 'Are you feeling stressed?', false),
  Question('Safety', 'Do you feel in danger of being injured?', false),

  //Belonging Questions
  Question('Belong', 'Do you feel lonely today?', false),
  Question('Belong', 'How are your friends doing?', false),
  Question('Belong', 'How\'s your relationship with your partner?', false),
  Question('Belong', 'How\'s your family doing today?', false),
  Question('Belong', 'How are you catching up with your friends?', false),
  Question('Belong', 'Do you have someone you can confide in?', false),

  //Esteem Questions
  Question('Esteem', 'Do you think you are respected by everyone around you?',
      false),
  Question('Esteem', 'Do you feel beautiful today?', false),
  Question('Esteem', 'Do you feel powerful today?', false),
  Question('Esteem', 'Are you appreciated?', false),
  Question('Esteem', 'How is your fighting spirit today?', false),
  Question('Esteem', 'Are you able to do what you want to do?', false),
  Question('Esteem', 'Do you feel independent?', false),
  Question('Esteem', 'Do you have feel proud of yourself?', false),

  //Growth needs- triggered by a desire to grow
  //Actualization Questions
  Question('Actualization', 'Are you contented with your life today?', false),
  Question('Actualization', 'Are you working towards becoming your best self?',
      false)
];

class QBank {
  static int _index = 0;
  static bool finished = false;

  static void inc() {
    if (_index < (_list.length - 1))
      _index++;
    else if (_index == (_list.length - 1)) finished = true;
  }

  static int qcount() {
    return _list.length;
  }

  static String getCategory() {
    return _list[_index].qcategory;
  }

  static String getText() {
    if (_index < (_list.length - 1)) {
      return _list[++_index].qtext;
    }
  }

  static bool getAns() {
    return _list[_index].qscore;
  }

  static void reset() {
    _index = 0;
    finished = false;
  }
}
