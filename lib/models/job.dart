import 'package:history_feature/models/test.dart';

enum Education {
  High_School,
  Bachelors,
  Masters,
  Doctorate,
  Luxurious,
}

enum Career {
  Student,
  Fresh_Junior,
  Senior,
  Manager,
}

enum JobType {
  Full_Time,
  Part_Time,
  Work_From_Home,
  Internship,
}

class Job {
  final String id;
  final String title;
  final String description;
  final String requirements;
  final String experience;
  final String salary;
  final String endDate;
  final String publishDate;
  final List<String> tags;
  final bool isEnded;
  final bool isNeedCV;
  final Test test;
  final Education educationLevel;
  final Career careerLevel;
  final JobType typeOfJob;
  int applicantsCount;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.tags,
      required this.requirements,
      required this.endDate,
      required this.publishDate,
      this.isEnded = false,
      this.isNeedCV = false,
      required this.test,
      required this.experience,
      required this.educationLevel,
      required this.careerLevel,
      required this.typeOfJob,
      required this.salary,
      this.applicantsCount = 0});
}
