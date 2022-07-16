import 'package:flutter/material.dart';
import 'package:history_feature/screens/add_test.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../helpers/pair.dart';
import '../models/job.dart';
import '../providers/auth.dart';
import '../providers/jobs.dart';
import 'job_operations_screen.dart';

class JobDetails extends StatefulWidget {
  JobDetails({Key? key, required this.job}) : super(key: key);
  static const routeName = '/job_details';

  Job job;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  final List<Pair<String, Education>> _educationList = const [
    Pair('High School', Education.High_School),
    Pair('Bachelor\'s Degree', Education.Bachelors),
    Pair('Master\'s Degree', Education.Masters),
    Pair('Doctorate\'s Degree', Education.Doctorate),
    Pair('Luxurious Degree', Education.Luxurious),
  ];

  String formatDate(String date) {
    int time = DateTime.now()
        .difference(DateFormat('dd-MM-yyyy hh:mm a').parse(date))
        .inMinutes;
    String out = '';
    if (time < 43200) {
      out = '${(time / (60 * 24)).floor()} days ago';
    } else {
      out = '${(time / (60 * 24 * 30)).floor()} months ago';
    }
    return out;
  }

  Widget buildContainer(Widget child, double h) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      height: h,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    String endDate = '';
    int time = DateFormat('dd-MM-yyyy hh:mm a')
        .parse(widget.job.endDate)
        .difference(DateTime.now())
        .inDays;
    if (time >= 0) {
      endDate = 'available until ${widget.job.endDate}';
    } else {
      endDate = 'closed';
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (Provider.of<Auth>(context).userType != 'Applicant')
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return JobOperations(job: widget.job);
                })).then((value) {
                  setState(() {
                    widget.job = value as Job;
                  });
                });
              },
            ),
          if (Provider.of<Auth>(context).userType != 'Applicant')
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Delete Confirmation"),
                      content: const Text(
                          "Are you sure you want to delete this item?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Provider.of<Jobs>(context, listen: false)
                                  .removeJob(widget.job);
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                            child: const Text("Delete")),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancel"),
                        ),
                      ],
                    );
                  },
                ).then((value) {});
              },
            )
        ],
        title: Text('Job details'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      widget.job.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Spacer(),
                  Text(
                    formatDate(widget.job.publishDate),
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200),
                    child: Text(
                      '${widget.job.applicantsCount} applicants',
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: time >= 0 ? Colors.green : Colors.redAccent),
                    child: Text(
                      endDate,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              buildContainer(
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Experience: ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text('${widget.job.experience} year'),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Job Type: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(widget.job.typeOfJob
                                .toString()
                                .replaceAll('_', ' ')),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Career Level: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(widget.job.careerLevel
                                .toString()
                                .replaceAll('_', '&')),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Salary: ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(widget.job.salary),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Education Level: ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              _educationList
                                  .singleWhere((element) =>
                                      element.item2 ==
                                      widget.job.educationLevel)
                                  .item1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: Color(0xffd9dde4), width: 1.5),
                            color: Color(0xfffafafb),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tags:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey)),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Wrap(
                                alignment: WrapAlignment.start,
                                children: widget.job.tags.map((e) {
                                  return Container(
                                    margin: EdgeInsets.all(4.0),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Text(
                                      e,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  280),
              SizedBox(
                height: 20,
              ),
              buildContainer(
                  Column(
                    children: [
                      Text('Description:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey)),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 140,
                        child: SingleChildScrollView(
                          child: Text(widget.job.description,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ],
                  ),
                  200),
              SizedBox(
                height: 20,
              ),
              buildContainer(
                  Column(
                    children: [
                      Text('Requirements',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey)),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 140,
                        child: SingleChildScrollView(
                          child: Text(widget.job.requirements,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      ),
                    ],
                  ),
                  200),
              SizedBox(
                height: 20,
              ),
              if (Provider.of<Auth>(context).userType == "Applicant")
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTest(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context)
                            .appBarTheme
                            .backgroundColor /*Color.fromRGBO(4, 88, 125, 1)*/,
                        fixedSize: Size(150, 35)),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
