import 'question.dart';

class Quizbrain {
  int _questionnumber = 0;
  List<Question> _questionbank = [
    Question('Bats are blind.', false),
    Question('t takes a sloth two weeks to digest a meal.', true),
    Question('An ant can lift 1,000 times its body weight.', false),
    Question('Sharks are mammals.', false),
    Question(
        'Sea otters have a favorite rock they use to break open food.', true),
    Question('The blue whale is the biggest animal to have ever lived.', true),
    Question('The hummingbird egg is the world\'s smallest bird egg.', true),
    Question('A dog sweats by panting its tongue.', false),
    Question(
        'The largest living frog is the Goliath frog of West Africa.', true),
    Question('An octopus has seven hearts.', false),
    Question('The goat is the national animal of Scotland.', false),
  ];

  void nextquestion() {
    if (_questionnumber < _questionbank.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestiontext() {
    return _questionbank[_questionnumber].questionText;
  }

  bool getcorrectans() {
    return _questionbank[_questionnumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionnumber >= _questionbank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionnumber = 0;
  }
}
/*
we are encapsulating this because we want ki koi aur answer update nakrde like ki
mne ans true ko false kar dia pr wo to glt h na meanwhile ki koi ans update na krer jo h whi rhe uske
liye ham ek kam kr skte h ki praivate bnade ham ab private bnane ke liye _question bank likhna pdta h bas
taki koi aur ise update na kr ske bas le ske;
 */
