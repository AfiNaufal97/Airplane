import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String imageUrl;
  final String nameDestination;
  final String city;
  final double rating;
  final int travaler;
  final String seat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;

  Transaction({
    required this.imageUrl,
    required this.nameDestination,
    required this.city,
    required this.rating,
    required this.travaler,
    required this.seat,
    required this.insurance,
    required this.refundable,
    required this.vat,
    required this.price,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        nameDestination,
        city,
        rating,
        travaler,
        seat,
        insurance,
        refundable,
        vat,
        price,
      ];
}
