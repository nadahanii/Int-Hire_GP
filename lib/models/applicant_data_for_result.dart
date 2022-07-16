class ApplicantResInfo {
  late List<String> kindred_spirits;
  late List<String> potential_complements;
  late List<String> challenging_opposites;
  late List<String> intriguing_differences;
  ApplicantResInfo(
      {
      required this.kindred_spirits,
      required this.challenging_opposites,
      required this.potential_complements,
      required this.intriguing_differences});

  ApplicantResInfo.fromJson(Map<String, dynamic> json) {
    kindred_spirits = json['kindred_spirits'].cast<String>() ?? [];
    potential_complements = json['potential_complements'].cast<String>() ?? [];
    challenging_opposites = json['challenging_opposites'].cast<String>() ?? [];
    intriguing_differences =
        json['intriguing_differences'].cast<String>() ?? [];
  }
}
