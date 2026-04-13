import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice_akshit/data/wishlist_items.dart';
import 'package:flutter_bloc_practice_akshit/features/home/models/product_data_moodel.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveItemEvent>(wishlistRemoveItemEvent);
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit((WishlistSuccessState(wishlistItems: wishlistItems)));
  }

  FutureOr<void> wishlistRemoveItemEvent(
    WishlistRemoveItemEvent event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
