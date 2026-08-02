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

  static void saveBooking({
    required PropertyModel property,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    final index = bookings.indexWhere(
      (b) => b.property.id == property.id,
    );

    if (index == -1) {
      bookings.add(
        BookingModel(
          property: property,
          status: 'Waiting payment',
          startDate: startDate,
          endDate: endDate,
        ),
      );
    } else {
      bookings[index]
        ..startDate = startDate
        ..endDate = endDate
        ..status = 'Waiting payment';
    }
  }
static void confirmBooking(PropertyModel property) {
  final index = bookings.indexWhere(
    (b) => b.property.id == property.id,
  );

  if (index != -1) {
    bookings[index].status = 'Checkin';
  }
}
}