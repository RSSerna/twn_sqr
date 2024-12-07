import 'package:equatable/equatable.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/card_tag.dart';

class CardInfo extends Equatable {
  final String title;
  final String time;
  final String location;
  final int minutes;
  final int spotsLeft;
  final double price;
  final List<CardTag> tags;

  const CardInfo({
    required this.title,
    required this.time,
    required this.location,
    required this.minutes,
    required this.spotsLeft,
    required this.price,
    required this.tags,
  });

  @override
  List<Object> get props {
    return [
      title,
      time,
      location,
      minutes,
      spotsLeft,
      price,
      tags,
    ];
  }
}
