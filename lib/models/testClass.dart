import 'package:history_feature/helpers/pair.dart';

class TestClass {
  final String _question;
  final String _a;
  final String _b;
  final String _labelA;
  final String _labelB;
  late List<Pair<String, int>> _answerList;

  TestClass(this._question, this._a, this._b, this._labelA, this._labelB)
  {
    this._answerList = [
      Pair(_a, 0),
      Pair(_b, 1),
    ];
  }
  String getQuestion()
  {
    return _question;
  }

  String getChooseA()
  {
    return _a;
  }
  String getChooseB()
  {
    return _b;
  }
  String getLabelA()
  {
    return _labelA;
  }
  String getLabelB()
  {

    return _labelB;
  }
  List<Pair<String, int>> getAnswerList()
  {
    return _answerList;
  }

}
