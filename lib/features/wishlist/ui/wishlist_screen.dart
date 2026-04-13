import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/wishlist/ui/wishlist_tile.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist Screen')),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return WishlistTile(
                    productDataModel: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
                itemCount: successState.wishlistItems.length,
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
