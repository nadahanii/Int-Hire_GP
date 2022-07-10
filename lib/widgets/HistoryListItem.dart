import 'package:flutter/material.dart';

import '../models/job.dart';
import '../screens/job_details.dart';




class HistoryListItem extends StatelessWidget {
  final Job job;
  const HistoryListItem({Key? key,required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return JobDetails(
              job: job,
            );
          }));
        },
        child: Container(

          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            title: Text(this.job.title,style: TextStyle(fontSize: 20),),
            subtitle: Text(this.job.description,style: TextStyle(fontSize: 13),),
          ),
        )
    );
  }
}


