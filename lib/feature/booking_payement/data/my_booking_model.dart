import 'package:flutter_application/feature/home/data/model.dart';

class BookingModel {
  final PropertyModel property;
  String status;
   DateTime ?startDate;
  DateTime ?endDate;
  BookingModel({
    required this.property,
    required this.status, required this.startDate, required this.endDate,

  });
}
class BookingManager {
  static List<BookingModel> bookings = [];
}