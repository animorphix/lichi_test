import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Cart/cart.dart';
import '../Pages/cart_page.dart';

class CartButtonBlack extends StatelessWidget {
  const CartButtonBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CartPage(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    final itemCount = cartProvider.totalQuantity;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        itemCount > 0 ? itemCount.toString() : 0.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 6.0),
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
