import 'dart:convert';

class TaskDb {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? reminder;
  TaskDb({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.reminder,
  });

  TaskDb copyWith({
    int? id,
    String? title,
    String? note,
    int? isCompleted,
    String? date,
    String? startTime,
    String? endTime,
    int? color,
    int? reminder,
  }) {
    return TaskDb(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      reminder: reminder ?? this.reminder,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (note != null) {
      result.addAll({'note': note});
    }
    if (isCompleted != null) {
      result.addAll({'isCompleted': isCompleted});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (startTime != null) {
      result.addAll({'startTime': startTime});
    }
    if (endTime != null) {
      result.addAll({'endTime': endTime});
    }
    if (color != null) {
      result.addAll({'color': color});
    }
    if (reminder != null) {
      result.addAll({'reminder': reminder});
    }

    return result;
  }

  factory TaskDb.fromMap(Map<String, dynamic> map) {
    return TaskDb(
      id: map['id']?.toInt(),
      title: map['title'],
      note: map['note'],
      isCompleted: map['isCompleted']?.toInt(),
      date: map['date'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      color: map['color']?.toInt(),
      reminder: map['reminder']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskDb.fromJson(String source) => TaskDb.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskDb(id: $id, title: $title, note: $note, isCompleted: $isCompleted, date: $date, startTime: $startTime, endTime: $endTime, color: $color, reminder: $reminder)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskDb &&
        other.id == id &&
        other.title == title &&
        other.note == note &&
        other.isCompleted == isCompleted &&
        other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.color == color &&
        other.reminder == reminder;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        note.hashCode ^
        isCompleted.hashCode ^
        date.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        color.hashCode ^
        reminder.hashCode;
  }
}
