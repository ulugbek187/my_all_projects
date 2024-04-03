import 'package:flutter/material.dart';

class TimerModel {
  final String time;
  final bool isFinished;
  final String title;
  final TimeOfDay timeOfDay;

  TimerModel({
    required this.timeOfDay,
    required this.title,
    required this.isFinished,
    required this.time,
  });
}
