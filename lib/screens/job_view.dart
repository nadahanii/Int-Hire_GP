import 'package:flutter/material.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/widgets/jobs_list.dart';
import 'package:provider/provider.dart';

import '../providers/jobs.dart';
import '../widgets/main_drawer.dart';

class JobView extends StatelessWidget {
  final ThemeData jobTheme;
  const JobView({Key? key,required this.jobTheme}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.jobTheme.backgroundColor,
      drawer: MainDrawer(this.jobTheme),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return JobOperations();
              }));
            },
          )
        ],
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 0),
            child: Text(
              'Jobs',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Container(
          height: 40.0,
          child: TextField(
            decoration: InputDecoration(
              // constraints: BoxConstraints(
              //   minHeight: 40.0,
              //   maxHeight: 40.0,
              // ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
        leadingWidth: 70.0,
      ),
      body: FutureBuilder(
        future: Provider.of<Jobs>(context, listen: false).fetchAndSetJobs(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Jobs>(
                builder: (_, cart, ch) => JobsList(),
              );
            }
          }
        },
      ),
    );
  }
}
