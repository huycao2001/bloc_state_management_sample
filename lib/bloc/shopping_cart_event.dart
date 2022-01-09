part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
  @override
  List<Object> get props => [];
}

class AddToCartEvent extends ShoppingCartEvent {
  final String drinkId;
  const AddToCartEvent(this.drinkId);
}

class RemoveFromCartEvent extends ShoppingCartEvent {
  final String drinkId;
  const RemoveFromCartEvent(this.drinkId);
}

class CheckOutEvent extends ShoppingCartEvent {
  const CheckOutEvent();
}
