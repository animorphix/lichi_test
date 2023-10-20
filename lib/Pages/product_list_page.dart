import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/change_notifier.dart';
import '../widgets/cart_button_black.dart';
import '../widgets/product_widget.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productList = productProvider.productList;
    final aProducts = productList.aProduct;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
            'Каталог товаров',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.right,
          ),
        
        actions: const <Widget>[
          CartButtonBlack(),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
                child: Text(
                  'Каждый день тысячи девушек распаковывают пакеты с новинками Lichi и становятся счастливее, ведь очевидно, что новое платье может изменить день, а с ним и всю жизнь!', // Add your sample text here
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
            ),
            itemCount: aProducts!.length,
            itemBuilder: (context, index) {
              final aProduct = aProducts[index];
              return ProductWidget(aProduct: aProduct);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
