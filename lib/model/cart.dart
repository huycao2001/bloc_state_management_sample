import 'drink.dart';

class Cart {
  final String id;
  final Drink drink;
  int quantity;

  Cart({
    required this.id,
    required this.drink,
    this.quantity = 1,
  });
}
