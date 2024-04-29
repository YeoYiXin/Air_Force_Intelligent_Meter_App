class MeterMovementArrival {
  final String meterName;
  final String trackId;
  final int quantity;
  final String status;
  final String from;
  final String to;
  final String shipDate;
  final String arrivalDate;

  MeterMovementArrival(
      {required this.meterName,
      required this.trackId,
      required this.quantity,
      required this.status,
      required this.from,
      required this.to,
      required this.shipDate,
      required this.arrivalDate});
}
