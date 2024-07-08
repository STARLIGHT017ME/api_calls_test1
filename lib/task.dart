class Task {
  String title;
  DateTime? duedate;
  final String categories;

  Task(this.categories, {required this.title, this.duedate});
}
