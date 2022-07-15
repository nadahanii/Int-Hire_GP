import 'package:history_feature/helpers/pair.dart';

class Question {
  final String question;
  final String answerA;
  final String answerB;
  final String labelA;
  final String labelB;
  late List<Pair<String, int>> _answerList;

  Question({required this.question, required this.answerA, required this.answerB, required this.labelA, required this.labelB}) {
    this._answerList = [
      Pair(answerA, 0),
      Pair(answerB, 1),
    ];
  }

  String getQuestion() {
    return question;
  }

  String getChooseA() {
    return answerA;
  }

  String getChooseB() {
    return answerB;
  }

  String getLabelA() {
    return labelA;
  }

  String getLabelB() {
    return labelB;
  }

  List<Pair<String, int>> getAnswerList() {
    return _answerList;
  }
}
