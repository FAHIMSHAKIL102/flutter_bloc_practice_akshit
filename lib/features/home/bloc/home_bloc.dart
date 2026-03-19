import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice_akshit/data/cart_items.dart';
import 'package:flutter_bloc_practice_akshit/data/grocery_data.dart';
import 'package:flutter_bloc_practice_akshit/data/wishlist_items.dart';
import 'package:flutter_bloc_practice_akshit/features/home/models/product_data_moodel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClikedEvent>(
      homeProductWishlistButtonClikedEvent,
    );
    on<HomeProductCartButtonClikedEvent>(homeProductCartButtonClikedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClikedEvent(
    HomeProductWishlistButtonClikedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Wishlist Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductAddWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClikedEvent(
    HomeProductCartButtonClikedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductAddCartActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Wishlist Navigate Clicked');
    emit(HomeNavigateWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart Navigate Clicked');
    emit(HomeNavigateCartPageActionState());
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (toElement) => ProductDataModel(
                id: toElement['id'],
                name: toElement['name'],
                description: toElement['description'],
                price: toElement['price'],
                imageUrl: toElement['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }
}
