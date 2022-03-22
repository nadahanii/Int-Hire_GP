import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';
import '../providers/jobs.dart';
import '../screens/job_operations_screen.dart';

class JobItem extends StatelessWidget {
  final Job job;
  const JobItem({Key? key, required this.job}) : super(key: key);

  String formatDate(String date) {
    int time =
        DateTime.now().difference(DateFormat.yMd().parse(date)).inMinutes;
    print(time);
    String out = '';
    if (time < 43200) {
      out = '${(time / (60 * 24)).floor()} days ago';
    } else {
      out = '${(time / (60 * 24 * 30)).floor()} months ago';
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            border: Border.all(
              color: DateFormat.yMd()
                          .parse(job.endDate)
                          .difference(DateTime.now())
                          .inDays >=
                      0
                  ? Colors.green
                  : Colors.red,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(children: [
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(job.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(job.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: false,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                )),
                          ]),
                    )
                  ]),
                ),
                SizedBox(
                  width: 6.0,
                ),
                true
                    ? Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                                return JobOperations(job: job,);
                              }));
                            },
                            child: Container(
                                height: 35,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.green.shade100,
                                    )),
                                child: Center(
                                    child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ))),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          InkWell(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Delete Confirmation"),
                                  content: const Text("Are you sure you want to delete this item?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<Jobs>(context,listen: false).removeJob(job);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Delete")
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                              );
                            },
                            child: Container(
                                height: 35,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.red.shade100,
                                    )),
                                child: Center(
                                    child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))),
                          ),
                        ],
                      )
                    : InkWell(
                      onTap: () {
                        print('2');
                      },
                      child: Container(
                          height: 35,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black54.withAlpha(100),
                            ),
                          ),
                          child: Center(
                            child: FaIcon(FontAwesomeIcons.solidFaceAngry,
                                color: Colors.black54),
                        ),
                      ),
                    )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Text(
                        job.typeOfJob.name.replaceAll('_', ' '),
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Text(
                        job.careerLevel.name.replaceFirst('_', '&'),
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Text(
                  formatDate(job.publishDate),
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 10),
                )
              ],
            ),
          ],
        ));
  }
}
