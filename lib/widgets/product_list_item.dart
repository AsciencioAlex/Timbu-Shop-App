import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'http://api.timbu.cloud/images/';

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: product.photos.isNotEmpty
            ? Image.network(
                '$imgUrl${product.photos[0]}',
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 50);
                },
              )
            : const Icon(Icons.image_not_supported, size: 50),
        title: Text(product.name),
        subtitle: Text(product.description.isEmpty
            ? 'No description'
            : product.description),
        trailing: Text('\$${product.currentPrice.toStringAsFixed(2)}'),
        onTap: () {
          // Handle tap if necessary
        },
      ),
    );
  }
}
