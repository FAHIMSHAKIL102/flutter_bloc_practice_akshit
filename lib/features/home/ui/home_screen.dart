import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_practice_akshit/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_practice_akshit/features/home/ui/product_tile.dart';
import 'package:flutter_bloc_practice_akshit/features/wishlist/ui/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartScreen();
              },
            ),
          );
        } else if (state is HomeNavigateWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistScreen()),
          );
        } else if (state is HomeProductAddWishlistActionState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item Added to Wishlist')));
        } else if (state is HomeProductAddCartActionState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item Added to Cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Grocery App',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return ProductTile(
                    productDataModel: successState.products[index],
                    homeBloc: homeBloc,
                  );
                },
                itemCount: successState.products.length,
              ),
            );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return Scaffold(body: SizedBox());
        }
      },
    );
  }
}
