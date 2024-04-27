class NotificationMessage {
  final String iconURL;
  final String title;
  final String message;
  final String date;
  final String time;
  final bool isRead;

  NotificationMessage(
      {
        required this.iconURL,
        required this.title,
      required this.message,
      required this.date,
      required this.time,
      required this.isRead});
}
