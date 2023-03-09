class WorkExperience {
  WorkExperience(
    this.company,
    this.startsAt,
    this.endsAt, {
    required this.currentlyWorking,
    required this.jobTitle,
  });
  final String jobTitle;
  final String company;
  final DateTime startsAt;
  final DateTime endsAt;
  final bool currentlyWorking;
}