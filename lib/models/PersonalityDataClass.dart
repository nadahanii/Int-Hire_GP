class PersonalityData {
  final String nickname;
  final String definition;
  final String introduction;
  final String strenAndweak;
  final String careerPaths;
  final String workplaceHabit;
  final String description;

  PersonalityData(
      {required this.nickname,
      required this.definition,
      required this.introduction,
      required this.strenAndweak,
      required this.careerPaths,
      required this.workplaceHabit,
      required this.description});
  PersonalityData.notByName(
      this.nickname,
      this.definition,
      this.introduction,
      this.strenAndweak,
      this.careerPaths,
      this.workplaceHabit,
      this.description);
  String getNickname() {
    return nickname;
  }

  String getDefinition() {
    return definition;
  }

  String getIntroduction() {
    return introduction;
  }

  String getStrenAndWeak() {
    return strenAndweak;
  }

  String getCareerPaths() {
    return careerPaths;
  }

  String getWorkplaceHabit() {
    return workplaceHabit;
  }

  String getDescription() {
    return description;
  }
}
