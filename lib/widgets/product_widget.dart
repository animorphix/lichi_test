import 'package:flutter/material.dart';
import 'package:lichi_flutter/widgets/product_details_widget.dart';
import 'package:provider/provider.dart';
import '../models/product_list_model.dart';
import '../provider/change_notifier.dart';

class ProductWidget extends StatelessWidget {
  final AProduct aProduct;

  const ProductWidget({super.key, required this.aProduct});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return GestureDetector(
      onTap: () async {
        final product =
            await productProvider.fetchProductDetail(aProduct.id ?? 1);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 0.77,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  aProduct.photos?[0].thumbs?.the7681024 ?? '',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                '${aProduct.price?.toStringAsFixed(0) ?? "Price Unavailable"} руб.',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                aProduct.name ?? "Product Name Unavailable",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (aProduct.colors != null)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color(
                          int.parse('0xFF${aProduct.colors!.current!.value}')),
                      radius: 4,
                    ),
                    const SizedBox(width: 4.0),
                    if (aProduct.colors?.other != null)
                      for (var color in aProduct.colors!.other!)
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color(int.parse('0xFF${color.value}')),
                              radius: 4,
                            ),
                            const SizedBox(width: 4.0),
                          ],
                        ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
