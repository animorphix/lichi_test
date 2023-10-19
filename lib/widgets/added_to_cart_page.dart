import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter_material;
import '../models/product_model.dart';
import 'cart_page.dart';

class AddedToCartScreen extends StatelessWidget {
  final Product product;

  const AddedToCartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 8,),
          const Text('Добавлено в корзину', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              product.aData?.photos?[0].thumbs?.the7681024 ?? '',
              fit: BoxFit.cover,
              height: 120,
              width: 120,
            ),
          ),
          Column(
            children: [
              Text(product.aData?.name ?? "Product Name Unavailable", style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
              const SizedBox(height: 16,),
              Text('Размер ${product.aData?.sizes?.keys.first}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const CartPage(),
        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: flutter_material.Colors.black,
                    minimumSize: const flutter_material.Size(double.infinity, 48),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0,16,0,16),
                    child: Text('Перейти в корзину',
                        style: TextStyle(color: flutter_material.Colors.white)),
                  ),
                ),
              ),
              TextButton(
                child: const Text(
                  "Закрыть",
                  style: TextStyle(color: flutter_material.Colors.black),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
