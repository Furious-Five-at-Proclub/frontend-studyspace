import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String name;
  final String image;

  const Payment({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [name, image];
}
