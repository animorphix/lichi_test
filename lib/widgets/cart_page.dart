import 'package:flutter/material.dart';
import 'package:lichi_flutter/widgets/product_details.dart';
import 'package:provider/provider.dart';
import '../Cart/cart.dart';
import '../provider/change_notifier.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Корзина',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isNotEmpty
                ? ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = cart[index];
                      return CartItemWidget(cartItem: cartItem);
                    },
                  )
                : const Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ),
          TotalPriceWidget(cartItems: cart),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return GestureDetector(
      onTap: () async {
        final product = await productProvider
            .fetchProductDetail(cartItem.product.aData?.id ?? 1);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                cartItem.product.aData?.photos?[0].thumbs?.the7681024 ?? '',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 3,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    cartItem.product.aData?.name ?? 'No name',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Размер ${cartItem.product.aData!.sizes?.keys.first}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '${cartItem.product.aData?.price?.toStringAsFixed(0) ?? "Price Unavailable"} руб.',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  QuantityAdjustmentButtons(cartItem: cartItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityAdjustmentButtons extends StatelessWidget {
  final CartItem cartItem;

  const QuantityAdjustmentButtons({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: IconButton(
            icon: const Icon(Icons.remove, size: 9),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .removeFromCart(cartItem.product);
            },
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        Text('${cartItem.quantity} ед.',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              size: 9,
            ),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addToCart(cartItem.product, 1);
            },
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class TotalPriceWidget extends StatelessWidget {
  final List<CartItem> cartItems;

  const TotalPriceWidget({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "К оплате",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              Consumer<CartProvider>(builder: (context, cartProvider, child) {
                final price = cartProvider.total;
                return Text(
                  '${price.toStringAsFixed(0)} руб.',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
