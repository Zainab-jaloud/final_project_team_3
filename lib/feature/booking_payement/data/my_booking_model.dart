import 'package:flutter_application/feature/home/data/model.dart';

class BookingModel {
  final PropertyModel property;
  String status;
   DateTime startDate;
  DateTime endDate;
   String? cardNumber;
 String? userCard;
  BookingModel({
    required this.property,  this.userCard,
    required this.status, required this.startDate, required this.endDate, this.cardNumber,

  });
}
