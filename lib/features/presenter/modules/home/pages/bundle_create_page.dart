import 'package:clean_architeture_flutter/features/core/components/app_back_button.dart';
import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/bundle_create_bottom_action_bar.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/bundle_create_food_categories.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/product_grid_view.dart';
import 'package:flutter/material.dart';

class BundleCreatePage extends StatelessWidget {
  const BundleCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Create My Pack'),
      ),
      body: const Column(
        children: [
          // SearchBar(),
          FoodCategories(),
          SizedBox(height: AppDefaults.padding / 2),
          ProductGridView(),
          BottomActionBar(),
        ],
      ),
    );
  }
}
