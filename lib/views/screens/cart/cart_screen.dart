import 'package:bloc_state_management_sample/cubit/cart_cubit.dart';
import 'package:bloc_state_management_sample/cubit/cart_state.dart';
import 'package:bloc_state_management_sample/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          itemCount: cartCubit.cartItems.length,
          itemBuilder: (context, index) {
            return CartItem(cartCubit.cartItems[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => cartCubit.checkOut(),
        label: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) =>
              Text('${cartCubit.getTotalAmount()} vnd'),
        ),
        icon: const Icon(Icons.monetization_on_sharp),
      ),
    );
  }
}
