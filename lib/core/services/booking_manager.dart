import 'package:flutter_application/feature/booking_payement/data/my_booking_model.dart';
import 'package:flutter_application/feature/home/data/model.dart';

class BookingManager {
  static List<BookingModel> bookings = [];
  static BookingModel? getBookingByProperty(PropertyModel property) {
  final index = bookings.indexWhere(
    (booking) => booking.property.id == property.id,
  );

  if (index == -1) {
    return null;
  }

  return bookings[index];
}
static void updateBookingDate({
  required BookingModel booking,
  required DateTime startDate,
  required DateTime endDate,
}) {
  booking.startDate = startDate;
  booking.endDate = endDate;
}
  static void saveBooking({
    required PropertyModel property,
    required DateTime startDate,
    required DateTime endDate,
      String? cardNumber,
        String? userCard,
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
              cardNumber: cardNumber,
                userCard: userCard,
        ),
      );
    } else {
      bookings[index]
        ..startDate = startDate
        ..endDate = endDate
        ..cardNumber = cardNumber
        ..userCard = userCard
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