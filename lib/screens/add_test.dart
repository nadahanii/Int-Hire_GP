import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/components.dart';
import '../models/PersonalityDataClass.dart';
import '../models/question.dart';
import '../providers/test.dart';
import 'applicant_result_screen.dart';

class AddTest extends StatefulWidget {
  const AddTest({Key? key}) : super(key: key);
  static const routeName = '/add_test';

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  late PersonalityData personalityData = PersonalityData.notByName(
      "Architect",
      "Imaginative and strategic thinkers, with a plan for everything.",
      "WHO IS AN ARCHITECT (INTJ)?",
      "Architect (INTJ) Strengths",
      "Professional know-how is often where Architects (INTJs) shine most brilliantly.",
      "What Architects (INTJs) want",
      "An Architect (INTJ) is a person with the Introverted.");
  late List<Question> _testData = Provider.of<Test>(context).items;
  List<int> _answers = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  late String _testType = "";

  void setType() {
    int label1 = 0;
    int label2 = 0;
    int label3 = 0;
    int label4 = 0;
    int inc = 1;

    for (int i = 0; i < _answers.length; i += 4) {
      inc = 1;
      if (_answers[i] == 1) {
        inc = -1;
      }

      if (_testData[i].labelA == "J") {
        label4 += inc;
      } else if (_testData[i].labelA == "T") {
        label3 += inc;
      } else if (_testData[i].labelA == "S") {
        label2 += inc;
      } else {
        label1 += inc;
      }
    }

    if (label1 > 0) {
      _testType += "E";
    } else {
      _testType += "I";
    }

    if (label2 > 0) {
      _testType += "S";
    } else {
      _testType += "N";
    }

    if (label3 > 0) {
      _testType += "T";
    } else {
      _testType += "F";
    }

    if (label4 > 0) {
      _testType += "J";
    } else {
      _testType += "P";
    }

    print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" + _testType);
  }

  Widget _radioButtonGroup({required String text, required List<Widget> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Color.fromRGBO(4, 88, 125, 1)),
        ),
        ...list,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_testData.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Personality Test"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _testData.length,
                itemBuilder: (_, i) {
                  return _radioButtonGroup(
                    text: _testData[i].getQuestion(),
                    list: _testData[i].getAnswerList().map((pair) {
                      return ListTile(
                        title: Text(pair.item1),
                        leading: Radio<int>(
                          value: pair.item2,
                          groupValue: _answers[i],
                          onChanged: (int? value) {
                            setState(() {
                              _answers[i] = value!;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ); // Radio
                },
              ),
              TextButton.icon(
                onPressed: (() {
                  setType();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApplicantResult(
                                personality_type: _testType,
                                personalityData:
                                    mapOfTypes[_testType] ?? personalityData,
                              )));
                }),
                icon: const Icon(
                  Icons.app_registration,
                  size: 28,
                ),
                label: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 35,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(4, 88, 125, 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
