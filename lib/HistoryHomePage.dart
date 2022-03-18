import 'package:flutter/material.dart';



import 'History/HistoryListItem.dart';

class HistoryHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HistoryHomePage> {

  bool searching = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Settings')
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                if (searching == true)
                  searching = false;
                else
                  searching = true;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
          child: ListView(

            scrollDirection: Axis.vertical,
            children: [

              HistoryListItem('Software Developer','Solving problems along with good communication are required , graduate with at least '
                  '1 year experience'),
              HistoryListItem('Mobile App Developer','Flutter knowledge along with 3 years experience'),
              HistoryListItem('Accountant','Experienced · 2 - 4 Yrs of Exp · Accounting/Finance· Accounting· Finance· '
                  'Financial Management· Cash Flow· Business Administration· '
                  'Commerce· Financial Analysis· Financial Statements'),
              HistoryListItem('Showroom sales representative','Entry Level · 1 - 3 Yrs of Exp · Sales/Retail· '
                  'Sales· Showroom Sales· Customer Service'),
            ],
          ),

      ),
    );

  }
}