import 'package:flutter/material.dart';
import 'package:history_feature/models/job.dart';
import 'package:intl/intl.dart';

import '../models/test.dart';

class Jobs with ChangeNotifier {
  List<Job> _items = [
    Job(
      id: DateFormat.yMd().format(DateTime.now()),
      isNeedCV: true,
      careerLevel: Career.Undergraduate,
      educationLevel: Education.High_School,
      requirements:
      'cfls;lfjdslkfcjsfdklfjds dl;fdjsf;lskjf;osdfsdfsdfsdfks sdkfsdojfosdj fo '
          'dkls;adksa;dkas;dkaopdfkspkdasd'
          'asldkaspodkasp[dkasp[aks[pdaskdpa'
          'oasdkjaposdjkaopdkaposdkjaspodkasd'
          'osapd[kasodkoapsdkpas',
      description: 'aso;ajd oasjdf aspof jsf'
          'fdsjf posdfjopf jopdsg fjsdf'
          'sdofpjsdopfsajop opdfkdspofjkdsopf ofsjkdfposdkjf dsfds'
          'f ojfk ospdjop j jdpo fjspod fjdsop jo jsdpo fjsdpof jsdpo jsdpo fdfknlsfljk '
          ' kljsf  dofjks dojspod jopdjf opsdj fopj pods jpdso jpo jds',
      publishDate:
      DateFormat.yMd().format(DateTime.now().subtract(Duration(
        days: 10,
      ))),
      endDate: DateFormat.yMd().format(DateTime.now().add(Duration(
        days: 356,
      ))),
      experience: '5 to 6',
      tags: [
        'dddddd',
        'dddddd',
        'ddddd',
        'ddddd',
        'dddd',
      ],
      salary: '25,000 \$',
      title: '.Net developer',
      typeOfJob: JobType.Work_From_Home,
      test: Test(),
    ),
  ];

  List<Job> get items {
    return [..._items];
  }

  Job findById(String id) {
    return _items.firstWhere((job) => job.id == id);
  }

  void addJob(Job job) {
      _items.add(job);
      notifyListeners();
  }

  void removeJob(Job job) {
    _items.remove(job);
    notifyListeners();
  }

  void updateJob(Job job) {
    _items.removeWhere((element) {
      return element.id == job.id;
    });
    _items.add(job);
    notifyListeners();
  }
}
