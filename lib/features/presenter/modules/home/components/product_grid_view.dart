import 'package:clean_architeture_flutter/features/core/components/product_tile_square.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(top: AppDefaults.padding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return ProductTileSquare(data: Dummy.products.first);
        },
      ),
    );
  }
}
