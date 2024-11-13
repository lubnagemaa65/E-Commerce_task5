import 'package:e_commerce_task5/app/modules/home/controllers/products_controller.dart';
import 'package:e_commerce_task5/app/modules/profile/views/profile_view.dart';
import 'package:e_commerce_task5/app/modules/settings/views/settings_view.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:e_commerce_task5/widgets/auth/productCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final ProductController productController = Get.find<ProductController>();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _navController =
        PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _navController,
      screens: _buildScreens(),
      items: _navBarItems(),
      navBarStyle: NavBarStyle.style3,
      onItemSelected: (index) {
        homeController.changeTabIndex(index);
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border, color: ColorApp.primaryColor),
              onPressed: () {
                Get.toNamed('/favorites');
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_basket_outlined,
                  color: ColorApp.primaryColor),
              onPressed: () {
                Get.toNamed('/cart');
              },
            ),
          ],
        ),
        body: Container(
          color: ColorApp.primaryColor,
          child: Obx(() => GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  final product = productController.products[index];
                  return ProductCart(
                    product: product,
                    onFavoritePressed: () =>
                        productController.toggleFavorite(index),
                    onAddToCartPressed: () =>
                        productController.addToCart(index),
                  );
                },
              )),
        ),
      ),
      ProfileView(),
      SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: ColorApp.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: ColorApp.secondColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: 'Settings',
        activeColorPrimary: ColorApp.thirdColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
