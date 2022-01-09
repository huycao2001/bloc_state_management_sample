import 'package:bloc_state_management_sample/bloc/shopping_cart_bloc.dart';
import 'package:bloc_state_management_sample/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = Provider.of<ShoppingCartBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: cartCubit.state.length,
        itemBuilder: (context, index) {
          return CartItem(cartCubit.state[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => cartCubit.add(const CheckOutEvent()),
        label: Text('${cartCubit.getTotalAmount()} vnd'),
        icon: const Icon(Icons.monetization_on_sharp),
      ),
    );
  }
}
