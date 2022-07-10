import 'package:flutter/material.dart';
import 'package:history_feature/widgets/main_drawer.dart';
import 'package:provider/provider.dart';



import 'widgets/HistoryListItem.dart';

class HistoryHomePage extends StatefulWidget {
  static const routeName = '/history';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HistoryHomePage> {

  bool searching = false;


  @override
  Widget build(BuildContext context) {
    final jobs = Provider.of<Jobs>(context).items;
    return Scaffold(
      drawer: SafeArea(
        child: MainDrawer(),
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
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: jobs.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  HistoryListItem(job: jobs[index])
                ],
              );
            },
          ),

      ),
    );

  }
}