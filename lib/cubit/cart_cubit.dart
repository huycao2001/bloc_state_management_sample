import 'package:bloc/bloc.dart';
import 'package:bloc_state_management_sample/model/cart.dart';
import 'package:bloc_state_management_sample/model/drink.dart';
import 'package:bloc_state_management_sample/repository/data_repository.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  final List<Drink> _drinkData = FakeDataRepository.someFakeDrinksData;
  List<Cart> cartItems = [];

  void addItem(String drinkId) {
    final item = _drinkData.firstWhere((drink) => drink.id == drinkId);
    if(cartItems.any((cart) => cart.drink.id == drinkId)) {
      cartItems.firstWhere((cart) => cart.drink.id == drinkId).quantity += 1;
    } else {
      cartItems.add(Cart(
        id: DateTime.now().toString(),
        drink: item,
        quantity: 1,
      ));
    }
    emit(CartState(cartItems));
  }

  void removeItem(String drinkId) {
    final cartItem = cartItems.firstWhere((cart) => cart.drink.id == drinkId);
    if(cartItem.quantity > 1) {
      cartItems[cartItems.indexOf(cartItem)].quantity -= 1;
    } else {
      cartItems.removeWhere((cart) => cart.drink.id == drinkId);
    }
    emit(CartState(cartItems));
  }

  bool isAdded(String drinkId) {
    return cartItems.any((cart) => cart.drink.id == drinkId);
  }

  void checkOut() {
    cartItems.clear();
    emit(CartState(cartItems));
  }

  int getTotalAmount() {
    var total = 0;
    for (var cart in cartItems) {
      total += cart.drink.price * cart.quantity;
    }
    return total;
  }
}
