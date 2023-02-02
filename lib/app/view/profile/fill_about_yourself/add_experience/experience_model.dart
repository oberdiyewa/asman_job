import 'package:flutter/material.dart';

class WorkExperience {
  final String jobTitle;
  final String company;
  final DateTime startsAt;
  final DateTime endsAt;
  final bool currentlyWorking;

  WorkExperience(
      this.company, this.startsAt, this.endsAt, this.currentlyWorking,
      {required this.jobTitle});
}
