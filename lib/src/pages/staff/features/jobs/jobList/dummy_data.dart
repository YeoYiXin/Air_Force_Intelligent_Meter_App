class JobItem {
  final String title;
  final String location;
  final String date;
  final String status;
  final List<String> personInCharge;
  final bool isCompleted;

  JobItem(
      {required this.title,
      required this.location,
      required this.date,
      required this.status,
      required this.personInCharge,
      required this.isCompleted});
}
