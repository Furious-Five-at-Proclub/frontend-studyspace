import 'package:equatable/equatable.dart';

final foodList = <Food>[
  const Food(
    title: 'Croissant',
    description: 'Croissant with butter',
    price: 15000,
    imageUrl:
        'https://images.unsplash.com/photo-1599940778173-e276d4acb2bb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1155&q=80',
  ),
  const Food(
    title: 'Cookies',
    description: 'Cookies with chocolate',
    price: 10000,
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1672916806667-4db17f753e54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
  ),
  const Food(
    title: 'Kentang Goreng',
    description: 'French Fries',
    price: 12000,
    imageUrl:
        'https://images.unsplash.com/photo-1585109649139-366815a0d713?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  )
];

final beverageList = <Food>[
  const Food(
    title: 'Mineral Water',
    description: 'Le Minerale',
    price: 4000,
    imageUrl:
        'https://images.unsplash.com/photo-1662650852280-38b7cac7785b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  ),
  const Food(
    title: 'Cappucino',
    description: 'Cappucino with milk',
    price: 15000,
    imageUrl:
        'https://images.unsplash.com/photo-1620052087057-bfd8235f5874?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
  ),
  const Food(
    title: 'Iced Tea',
    description: 'Iced Tea with sugar',
    price: 6000,
    imageUrl:
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
  )
];

class Food extends Equatable {
  final String title;
  final String description;
  final int price;
  final String imageUrl;

  const Food({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, description, price, imageUrl];
}
