import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_akshit/features/home/models/product_data_moodel.dart';
import 'package:flutter_bloc_practice_akshit/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTile({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(
                        WishlistRemoveItemEvent(
                          productDataModel: productDataModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite, color: Colors.pinkAccent),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
