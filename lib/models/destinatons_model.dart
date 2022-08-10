import 'package:equatable/equatable.dart';

class DestinationsModel extends Equatable {
  String id;
  String name;
  String city;
  String imageUrl;
  double price;
  double rating;

  DestinationsModel(
      {required this.id,
      required this.city,
      required this.name,
      required this.imageUrl,
      this.price = 0.0,
      this.rating = 5.0});

  factory DestinationsModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationsModel(
          id: id,
          city: json['city'],
          name: json['name'],
          imageUrl: json['imageUrl'],
          price: json['price'].toDouble(),
          rating: json['rating'].toDouble());

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
