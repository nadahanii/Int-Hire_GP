import 'package:flutter/material.dart';
import 'package:history_feature/models/job.dart';
import 'package:intl/intl.dart';

import '../models/test.dart';

class Jobs with ChangeNotifier {
  List<Job> _items = [
    Job(
      id: DateFormat.yMd().format(DateTime.now()),
      isNeedCV: true,
      careerLevel: Career.Student,
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
    Job(
      id: DateFormat.yMd().format(DateTime.now()),
      isNeedCV: false,
      careerLevel: Career.Fresh_Junior,
      educationLevel: Education.Bachelors,
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
        days: 36,
      ))),
      endDate: DateFormat.yMd().format(DateTime.now().add(Duration(
        days: 70,
      ))),
      experience: '1',
      tags: [
        'fhhhdf',
        'dddfghfddd',
        'dfhdhdddd',
        'dddhhhhdd',
        'errer',
      ],
      salary: '10,000 \$',
      title: 'flutter developer',
      typeOfJob: JobType.Part_Time,
      test: Test(),
    ),
    Job(
      id: DateFormat.yMd().format(DateTime.now()),
      isNeedCV: true,
      careerLevel: Career.Manager,
      educationLevel: Education.Luxurious,
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
        days: 66,
      ))),
      endDate: DateFormat.yMd().format(DateTime.now().add(Duration(
        days: 12,
      ))),
      experience: '10 to 12',
      tags: [
        'gdfgdfg',
        'gfg',
        'sdasd',
        'ddddd',
      ],
      salary: '100,000 \$',
      title: 'CEO',
      typeOfJob: JobType.Part_Time,
      test: Test(),
    ),
    Job(
      id: DateFormat.yMd().format(DateTime.now()),
      isNeedCV: false,
      careerLevel: Career.Senior,
      educationLevel: Education.Masters,
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
        days: 30,
      ))),
      endDate: DateFormat.yMd().format(DateTime.now().add(Duration(
        days: 165,
      ))),
      experience: '8',
      tags: [
        'qewdfsad',
        'ghjkhjyth',
        'dfsd',
      ],
      salary: '20,000 \$',
      title: 'frontend developer',
      typeOfJob: JobType.Internship,
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
