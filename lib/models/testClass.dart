import 'package:history_feature/helpers/pair.dart';

class TestClass {
  final String question;
  final String a;
  final String b;
  final String labelA;
  final String labelB;
  late List<Pair<String, int>> answerList;

  TestClass(this.question, this.a, this.b, this.labelA, this.labelB)
  {
    this.answerList = [
      Pair(a, 0),
      Pair(b, 1),
    ];
  }
  String getQuestion()
  {
    return question;
  }

  String getChooseA()
  {
    return a;
  }
  String getChooseB()
  {
    return b;
  }
  String getLabelA()
  {
    return labelA;
  }
  String getLabelB()
  {

    return labelB;
  }
  List<Pair<String, int>> getAnswerList()
  {
    return answerList;
  }

}
