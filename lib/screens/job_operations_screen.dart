import 'package:flutter/material.dart';
import 'package:history_feature/models/job.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../helpers/pair.dart';
import '../providers/test.dart';
import '../providers/auth.dart';
import '../providers/jobs.dart';

class JobOperations extends StatefulWidget {
  static const routeName = '/job_operations';
  final Job? job;
  const JobOperations({Key? key, this.job}) : super(key: key);

  @override
  State<JobOperations> createState() => _JobOperationsState();
}

class _JobOperationsState extends State<JobOperations> {
  bool _isAddCV = false;

  JobType _jobType = JobType.Full_Time;
  Career _career = Career.Fresh_Junior;
  Education _education = Education.Bachelors;

  Set<String> _tags = {};
  final List<Pair<String, Education>> _educationList = const [
    Pair('High School', Education.High_School),
    Pair('Bachelor\'s Degree', Education.Bachelors),
    Pair('Master\'s Degree', Education.Masters),
    Pair('Doctorate\'s Degree', Education.Doctorate),
    Pair('Luxurious Degree', Education.Luxurious),
  ];
  final List<Pair<String, Career>> _careerList = const [
    Pair('Student', Career.Student),
    Pair('Fresh & Junior', Career.Fresh_Junior),
    Pair('Senior', Career.Senior),
    Pair('Manager', Career.Manager),
  ];
  final List<Pair<String, JobType>> _jobTypeList = const [
    Pair('Internship', JobType.Internship),
    Pair('Work From Home', JobType.Work_From_Home),
    Pair('Part Time', JobType.Part_Time),
    Pair('Full Time', JobType.Full_Time),
  ];

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _requirementsController = TextEditingController();
  final _experienceController = TextEditingController();
  final _salaryController = TextEditingController();
  final _tagsController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.job != null) {
      _jobType = widget.job!.typeOfJob;
      _tags = widget.job!.tags.toSet();
      _titleController.text = widget.job!.title;
      _salaryController.text = widget.job!.salary;
      _experienceController.text = widget.job!.experience;
      _education = widget.job!.educationLevel;
      _career = widget.job!.careerLevel;
      _descriptionController.text = widget.job!.description;
      _endDateController.text = widget.job!.endDate;
      _isAddCV = widget.job!.isNeedCV;
      _requirementsController.text = widget.job!.requirements;
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _endDateController.text =
            DateFormat('dd-MM-yyyy hh:mm a').format(pickedDate);
      });
    });
  }

  Widget _radioButtonGroup({required String text, required List<Widget> list}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        ...list,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add new job"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter product price';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'description',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _requirementsController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'requirements',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _endDateController,
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter product price';
                      }
                      return null;
                    },
                    onTap: _presentDatePicker,
                    decoration: const InputDecoration(
                      labelText: 'end date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _experienceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'experience',
                            border: OutlineInputBorder(),
                            suffix: Text('years'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _salaryController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'salary',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _tagsController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'tag',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _tags.add(_tagsController.text);
                            _tagsController.text = '';
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: _tags.map((e) {
                      return Card(
                        color: Colors.lightBlue.shade200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(e),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _tags.remove(e);
                                    _tagsController.text = '';
                                  });
                                },
                                iconSize: 20.0,
                                constraints: const BoxConstraints(
                                  maxWidth: 25,
                                  minWidth: 25,
                                  minHeight: 35,
                                  maxHeight: 35,
                                ),
                                splashRadius: 10.0,
                                icon: const Icon(Icons.cancel),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _radioButtonGroup(
                    text: 'Job Type',
                    list: _jobTypeList.map((pair) {
                      return ListTile(
                        title: Text(pair.item1),
                        leading: Radio<JobType>(
                          value: pair.item2,
                          groupValue: _jobType,
                          onChanged: (JobType? value) {
                            setState(() {
                              _jobType = value!;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _radioButtonGroup(
                    text: 'Career',
                    list: _careerList.map((pair) {
                      return ListTile(
                        title: Text(pair.item1),
                        leading: Radio<Career>(
                          value: pair.item2,
                          groupValue: _career,
                          onChanged: (Career? value) {
                            setState(() {
                              _career = value!;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  _radioButtonGroup(
                    text: 'Education',
                    list: _educationList.map((pair) {
                      return ListTile(
                        title: Text(pair.item1),
                        leading: Radio<Education>(
                          value: pair.item2,
                          groupValue: _education,
                          onChanged: (Education? value) {
                            setState(() {
                              _education = value!;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  /*const Divider(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Applicant must add CV'),
                        Switch(
                            value: _isAddCV,
                            onChanged: (value) {
                              setState(() {
                                _isAddCV = value;
                              });
                            }),
                      ],
                    ),
                  ),*/
                  ElevatedButton(
                    onPressed: () {
                      final job = Job(
                        id: widget.job != null ? widget.job!.id : 0,
                        isNeedCV: _isAddCV,
                        careerLevel: _career,
                        educationLevel: _education,
                        requirements: _requirementsController.text,
                        description: _descriptionController.text,
                        publishDate: DateFormat('dd-MM-yyyy hh:mm a')
                            .format(DateTime.now()),
                        endDate: _endDateController.text,
                        experience: _experienceController.text,
                        tags: _tags.toList(),
                        salary: _salaryController.text,
                        title: _titleController.text,
                        typeOfJob: _jobType,
                        test: Test(),
                      );
                      if (widget.job == null) {
                        Provider.of<Jobs>(
                          context,
                          listen: false,
                        ).addJob(job,
                            Provider.of<Auth>(context, listen: false).token);
                      } else {
                        Provider.of<Jobs>(
                          context,
                          listen: false,
                        ).updateJob(job,
                            Provider.of<Auth>(context, listen: false).token);
                      }
                      Navigator.of(context).pop(job);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).appBarTheme.backgroundColor,
                        fixedSize: Size(150, 35)),
                    child: widget.job == null
                        ? const Text(
                            'Add Job',
                            style: TextStyle(fontSize: 17),
                          )
                        : const Text(
                            'Update Job',
                            style: TextStyle(fontSize: 17),
                          ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
