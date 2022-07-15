import 'package:flutter/material.dart';

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
  late PersonalityData personalityData = PersonalityData(
      "Architect",
      "Imaginative and strategic thinkers, with a plan for everything.",
      "WHO IS AN ARCHITECT (INTJ)?",
      "Architect (INTJ) Strengths",
      "Professional know-how is often where Architects (INTJs) shine most brilliantly.",
      "What Architects (INTJs) want",
      "An Architect (INTJ) is a person with the Introverted.");
  //**************************************************************
  late List<Question> _testData1 = Test().testData;
  List<int> _answers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  late String _testType = "";
  void setType(int start, String labelA, String labelB, int rest) {
    if (rest == 1) _testType = "";
    int labelACount = 0;
    for (int i = start; i < _answers.length; i += 4) {
      if (_answers[i] == 0) labelACount++;
    }
    if (labelACount > 1) _testType += labelA;
    //print(_testType);
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
                itemCount: _testData1.length,
                itemBuilder: (_, i) {
                  return _radioButtonGroup(
                    text: _testData1[i].getQuestion(),
                    list: _testData1[i].getAnswerList().map((pair) {
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
                  setType(0, _testData1[0].getLabelA(),
                      _testData1[0].getLabelB(), 1);
                  setType(1, _testData1[1].getLabelA(),
                      _testData1[1].getLabelB(), 0);
                  setType(2, _testData1[2].getLabelA(),
                      _testData1[2].getLabelB(), 0);
                  setType(3, _testData1[3].getLabelA(),
                      _testData1[3].getLabelB(), 0);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApplicantResult(
                                personality_type: _testType,
                                personalityData: personalityData,
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
