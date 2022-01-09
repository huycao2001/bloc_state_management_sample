import 'package:bloc_state_management_sample/bloc/shopping_cart_bloc.dart';
import 'package:bloc_state_management_sample/model/cart.dart';
import 'package:bloc_state_management_sample/views/screens/cart/cart_screen.dart';
import 'package:bloc_state_management_sample/views/widgets/badge.dart';
import 'package:bloc_state_management_sample/views/widgets/drink_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverViewScreen extends StatelessWidget {
  const OverViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Impl State Management Demo'),
        actions: [
          _buildCartAction(context),
        ],
      ),
      body: const DrinkList(),
    );
  }

  Widget _buildCartAction(BuildContext ctx) {
    return BlocBuilder<ShoppingCartBloc, List<Cart>>(
      builder: (context, state) {
        return Badge(
          value: state.length,
          iconButton: IconButton(
            icon: const Icon(Icons.shopping_bag_rounded),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
            },
          ),
        );
      },
    );
  }
}
