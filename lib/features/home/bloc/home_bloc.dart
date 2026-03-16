import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
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
  ) {}

  FutureOr<void> homeProductCartButtonClikedEvent(
    HomeProductCartButtonClikedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Wishlist Clicked');
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart Clicked');
  }
}
