import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/cart/ui/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Screen')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CartTile(
                    productDataModel: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
                itemCount: successState.cartItems.length,
              );
          }
          return Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
