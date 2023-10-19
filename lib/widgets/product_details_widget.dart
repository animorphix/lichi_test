import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter_material;
import 'package:flutter/rendering.dart';
import 'package:lichi_flutter/widgets/cart_button_white.dart';
import 'package:provider/provider.dart';
import '../Cart/cart.dart';
import '../models/product_model.dart';
import '../Pages/added_to_cart_page.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.69,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.network(
                      product.aData?.photos![0].thumbs!.the7681024 ?? '',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const Positioned(top: 36, left: 0, child: CartButtonWhite()),
                  Positioned(
                    top: 36,
                    right: 16,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: const BoxDecoration(
                        color: flutter_material.Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: flutter_material.Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.aData?.name ?? 'No name',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              if (product.aData?.colors != null)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(int.parse(
                            '0xFF${product.aData!.colors!.current!.value}')),
                        radius: 10,
                      ),
                      const SizedBox(width: 4.0),
                      if (product.aData?.colors?.other != null)
                        for (var color in product.aData!.colors!.other!)
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color(int.parse('0xFF${color.value}')),
                                radius: 10,
                              ),
                              const SizedBox(width: 4.0),
                            ],
                          ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${product.aData?.price ?? "Price Unavailable"} руб.',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(product, 1);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            AddedToCartScreen(product: product),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: flutter_material.Colors.black,
                    minimumSize:
                        const flutter_material.Size(double.infinity, 48),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: flutter_material.Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  product.aData?.descriptions?.text != null
                      ? product.aData!.descriptions!.text!
                          .replaceAll(RegExp(r'\s*- '), '• ')
                          .replaceAll(RegExp(r'• '), '\n • ')
                      : 'No description available',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          )
        ],
      ),
    );
  }
}
