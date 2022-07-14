import 'package:history_feature/models/testClass.dart';

class Test {
  late List<TestClass> testData;

  Test()
  {
    testData = <TestClass>[];
    TestClass test1 = TestClass("01- What is your name?", "A) 1- Hossam", "b) 1- Mohamed","I", "E");
    testData.add(test1);

    TestClass test2 = TestClass("02- What is your name?", "A) 2- Hossam", "b) 2- Mohamed","I", "E");
    testData.add(test2);

    TestClass test3 = TestClass("03- What is your name?", "A) 3- Hossam", "b) 3- Mohamed","I", "E");
    testData.add(test3);

    TestClass test4 = TestClass("04- What is your name?", "A) 4- Hossam", "b) 4- Mohamed","I", "E");
    testData.add(test4);

    TestClass test5 = TestClass("05- What is your name?", "A) 5- Hossam", "b) 5- Mohamed","N", "S");
    testData.add(test5);

    TestClass test6 = TestClass("06- What is your name?", "A) 6- Hossam", "b) 6- Mohamed","N", "S");
    testData.add(test6);

    TestClass test7 = TestClass("07- What is your name?", "A) 7- Hossam", "b) 7- Mohamed","T", "F");
    testData.add(test7);

    TestClass test8 = TestClass("08- What is your name?", "A) 8- Hossam", "b) 8- Mohamed","T", "F");
    testData.add(test8);

    TestClass test9 = TestClass("09- What is your name?", "A) 9- Hossam", "b) 9- Mohamed","P", "J");
    testData.add(test9);

    TestClass test10 = TestClass("10- What is your name?", "A) 10- Hossam", "b) 10- Mohamed","P", "J");
    testData.add(test10);

  }
  List<TestClass> getTestData()
  {
    return testData;
  }
}
