import 'package:bloc_state_management_sample/repository/data_repository.dart';
import 'package:flutter/material.dart';

import 'drink_item.dart';

class DrinkList extends StatelessWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drinks = FakeDataRepository.someFakeDrinksData;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: drinks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => DrinkItem(drinks[index]),
    );
  }
}
