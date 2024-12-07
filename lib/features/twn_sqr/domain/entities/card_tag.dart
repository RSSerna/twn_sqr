import 'package:equatable/equatable.dart';

enum CardTagEnum { light, medium, high, childcare }

class CardTag extends Equatable {
  final CardTagEnum tag;

  const CardTag({
    required this.tag,
  });

  @override
  List<Object> get props => [tag];
}
