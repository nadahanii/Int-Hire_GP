class PersonalityData {
  final String _nickname;
  final String _definition;
  final String _introduction;
  final String _strenAndweak;
  final String _careerPaths;
  final String _workplaceHabit;
  final String _description;

  PersonalityData(
      this._nickname,
      this._definition,
      this._introduction,
      this._strenAndweak,
      this._careerPaths,
      this._workplaceHabit,
      this._description);
  String getNickname() {
    return _nickname;
  }

  String getDefinition() {
    return _definition;
  }

  String getIntroduction() {
    return _introduction;
  }

  String getStrenAndWeak() {
    return _strenAndweak;
  }

  String getCareerPaths() {
    return _careerPaths;
  }

  String getWorkplaceHabit() {
    return _workplaceHabit;
  }

  String getDescription() {
    return _description;
  }
}
