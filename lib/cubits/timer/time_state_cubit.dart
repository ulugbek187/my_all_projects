class TimeState {
  final String taskName;
  final int hour;
  final int minute;
  final double progressValue;
  final int second;
  final int targetHour;
  final int targetMinute;
  final bool finishTime;

  TimeState({
    required this.taskName,
    required this.hour,
    required this.progressValue,
    required this.minute,
    required this.second,
    required this.targetHour,
    required this.targetMinute,
    required this.finishTime,
  });

  TimeState copyWith(
      {
    String? taskName,
    int? hour,
    int? minute,
    int? second,
    int? targetHour,
    double? progressValue,
    int? targetMinute,
    bool? finishTime,
  }
  ) =>
      TimeState(
        taskName: taskName ?? this.taskName,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
        second: second ?? this.second,
        targetHour: targetHour ?? this.targetHour,
        targetMinute: targetMinute ?? this.targetMinute,
        finishTime: finishTime ?? this.finishTime,
        progressValue: progressValue ?? this.progressValue,
      );

  static TimeState initialValue() => TimeState(
      progressValue: 0.0,
      taskName: '',
      hour: 0,
      minute: 0,
      second: 59,
      targetHour: 0,
      targetMinute: 0,
      finishTime: false);
}
