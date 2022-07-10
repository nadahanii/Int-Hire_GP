import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class add_test extends StatefulWidget {
  const add_test({Key? key}) : super(key: key);
  static const routeName = '/add_test';

  @override
  State<add_test> createState() => _add_testState();
}

class _add_testState extends State<add_test> {
  static List<List<dynamic>> _csvData = [
   /* ['hey', '1', '0'],
    ['hello','2','1']*/
  ];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/testData.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _csvData = _listData;
      print(_csvData);
    });
  }


  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => _loadCSV());
    _loadCSV();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _csvData.length,
          itemBuilder: (_, i) {
            return Card(
              child: ListTile(
                leading: Text(
                  _csvData[i][0].toString(),
                  style: TextStyle(fontSize: 25),
                ),
                title: Text(
                  _csvData[i][1].toString(),
                  style: TextStyle(fontSize: 25),
                ),
                trailing: Text(
                  _csvData[i][2].toString(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
