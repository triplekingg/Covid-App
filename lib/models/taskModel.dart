class Task {
  String? title;
  String? endTime;
  String? startTime;
  String? note;
  String? date;
  bool? isCompleted;
  String? repeat;
  String? remind;

  Task(this.title, this.date, this.endTime, this.isCompleted, this.note,
      this.repeat, this.startTime, this.remind);

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    endTime = json['endTime'];
    startTime = json['startTime'];
    note = json['note'];
    date = json['date'];
    isCompleted = json['isCompleted'];
    repeat = json['repeat'];
    remind = json['remind'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'startTime': startTime,
        'endTime': endTime,
        'note': note,
        'date': date,
        'isCompleted': isCompleted,
        'repeat': repeat,
        'remind': remind
      };
}
