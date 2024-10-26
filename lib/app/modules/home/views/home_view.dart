import 'package:e_commerce_task5/app/modules/profile/views/profile_view.dart';
import 'package:e_commerce_task5/app/modules/settings/views/settings_view.dart';
import 'package:e_commerce_task5/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);  

    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
          ),
          body: Center(
            child: Text('Welcome Home'),
          ),
        ),
        ProfileView(),
        SettingsView(),
      ],
      items: [
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
      ],
       // selectedIndex:controller.initialIndex, // Set the initial selected tab index
      onItemSelected: (index) {
        controller.changeTabIndex(index);
      },
    );
  }
}
