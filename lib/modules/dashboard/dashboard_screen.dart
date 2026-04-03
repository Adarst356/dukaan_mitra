import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/extensions.dart';
import 'package:flutter_demo/core/widgets/floating_nav_bar.dart';
import 'package:flutter_demo/modules/dashboard/profile/profile_details_screen.dart';
import 'package:flutter_demo/modules/dashboard/purchase/purchase_history.dart';
import 'package:get/get.dart';

import '../../core/common_controller.dart';
import '../field_inspector/ fi_status/fi_status_screen.dart';
import 'dashboard_controller.dart';
import 'home/home_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            if (CommonController.to.userData.value?.roleId.isFieldInspector == true)
            FiStatusScreen()
            else HomeScreen() ,

            if (CommonController.to.userData.value?.roleId.isDashboardUser == true)
              PurchaseHistory(),

            ProfileDetailsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(() {
          return FloatingNavBar(
            selectedIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            icons:  [
              Icons.home_outlined,
              if (CommonController.to.userData.value?.roleId.isDashboardUser == true)
              Icons.shopping_bag_outlined,
              Icons.person_outline,
            ],
          );
        }),
      ),
    );
  }
}
