import 'package:flutter/material.dart';
import 'package:history_feature/screens/job_operations_screen.dart';
import 'package:history_feature/widgets/jobs_list.dart';
import 'package:provider/provider.dart';

import '../providers/jobs.dart';

class JobView extends StatelessWidget {
  JobView({Key? key, this.history = false}) : super(key: key);
  static const routeNameForView = '/home';
  static const routeNameForHistory = '/history';
  final bool history;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          if (history &&
              Provider.of<Jobs>(context, listen: false).userType != "Applicant")
            IconButton(
              icon: Icon(Icons.add),
              color: Theme.of(context).bottomAppBarColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return JobOperations();
                }));
              },
            )
        ],
        title: Text(history ? 'History' : 'Jobs',
            style: Theme.of(context).textTheme.headline1),
      ),
      body: FutureBuilder(
        future: !history
            ? Provider.of<Jobs>(context, listen: false).fetchAndSetJobs()
            : Provider.of<Jobs>(context, listen: false).userType == "Applicant"
                ? Provider.of<Jobs>(context, listen: false)
                    .fetchAndSetHistoryJobsOfApplicant()
                : Provider.of<Jobs>(context, listen: false)
                    .fetchAndSetJobsOfRecruiter(),
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
                builder: (_, cart, ch) => JobsList(
                  history: history,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
