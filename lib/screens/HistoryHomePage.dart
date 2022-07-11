import 'package:flutter/material.dart';
import 'package:history_feature/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/jobs.dart';
import '../widgets/HistoryListItem.dart';

class HistoryHomePage extends StatefulWidget {
  final ThemeData historyTheme;
  static const routeName = '/history';
  const HistoryHomePage({Key? key,required this.historyTheme}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HistoryHomePage> {

  bool searching = false;


  @override
  Widget build(BuildContext context) {
    final jobs = Provider.of<Jobs>(context).items;
    return Scaffold(
      backgroundColor: widget.historyTheme.backgroundColor,
      drawer: SafeArea(
        child: MainDrawer(widget.historyTheme),
      ),
      appBar: AppBar(
        backgroundColor: widget.historyTheme.appBarTheme.backgroundColor,
        title: Text('History',style: widget.historyTheme.textTheme.headline1,),
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
                  HistoryListItem(jobs[index].title,jobs[index].description, job: jobs[0],)
                ],
              );
            },
          ),

      ),
    );

  }
}