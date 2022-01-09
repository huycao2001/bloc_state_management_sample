import 'package:bloc_state_management_sample/cubit/cart_cubit.dart';
import 'package:bloc_state_management_sample/cubit/cart_state.dart';
import 'package:bloc_state_management_sample/model/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;

  const DrinkItem(this.drink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context, listen: false);
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: _buildFooter(drink, context, cartCubit),
        ),
      ),
    );
  }

  Widget _buildFooter(Drink drink, BuildContext context, CartCubit cartCubit) {
    return GridTileBar(
      backgroundColor: Colors.black38,
      title: Text(drink.title),
      subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            '${drink.price} vnd',
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          )),
      trailing: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return cartCubit.isAdded(drink.id)
              ? IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () => cartCubit.removeItem(drink.id),
          )
              : IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => cartCubit.addItem(drink.id),
          );
        },
      ),
    );
  }
}
