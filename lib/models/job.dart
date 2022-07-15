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
  late int id;
  late String title;
  late String description;
  late String requirements;
  late String experience;
  late String salary;
  late String endDate;
  late String publishDate;
  late List<String> tags;
  late bool isEnded;
  late Education educationLevel;
  late Career careerLevel;
  late JobType typeOfJob;
  late int applicantsCount;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.tags,
      required this.requirements,
      required this.endDate,
      required this.publishDate,
      this.isEnded = false,
      required this.experience,
      required this.educationLevel,
      required this.careerLevel,
      required this.typeOfJob,
      required this.salary,
      this.applicantsCount = 0});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'];
    description = json['description'];
    requirements = json['requirements'];
    experience = json['expLevel'].toString();
    salary = json['salary'].toString();
    endDate = json['deadline'];
    publishDate = json['postingTime'];
    tags = json['tags'].cast<String>();
    isEnded = json['active'] as bool;
    educationLevel = Education.values[json['educationLevel']];
    careerLevel = Career.values[json['career']];
    typeOfJob = JobType.values[json['jobType']];
    applicantsCount = json['numberOfApplicants'];
  }
}
