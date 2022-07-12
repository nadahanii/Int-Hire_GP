import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/jobs.dart';
import 'job_item.dart';

class JobsList extends StatelessWidget {
  const JobsList({Key? key, this.history = false}) : super(key: key);
  final bool history;
  @override
  Widget build(BuildContext context) {
    final jobs = Provider.of<Jobs>(context).items;
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemBuilder: (ctx, i) {
        return Column(
          children: [
            JobItem(job: jobs[i], history: history),
            SizedBox(height: 10.0),
          ],
        );
      },
      itemCount: jobs.length,
    );
  }
}
