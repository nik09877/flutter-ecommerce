import 'package:e_mart/dummy_data.dart';
import 'package:e_mart/features/shop/screens/all_products/all_products.dart';
import 'package:e_mart/utils/constants/colors.dart';

import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: TColors.primary,
              ),
              child: Text(
                'Popular Categories',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: dummyCategories.length,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 20,
                    child: Image(
                        image: AssetImage(dummyCategories[index]["image"]),
                        fit: BoxFit.cover,
                        color: THelperFunctions.isDarkMode(context)
                            ? TColors.dark
                            : TColors.dark),
                  ),
                  title: Text(dummyCategories[index]["name"]),
                  onTap: () => Get.to(() => const AllProducts()),
                );
              }),
        ],
      ),
    );
    // return Drawer(
    //   child: ListView(
    //     // shrinkWrap: true,
    //     padding: const EdgeInsets.all(16.0),
    //     children: <Widget>[
    //       ListTile(
    //         leading: const Icon(Icons.home),
    //         title: const Text('Home'),
    //         onTap: () {
    //           Get.to(() => const NavigationMenu());
    //         },
    //       ),
    //       ListTile(
    //         leading: const Icon(Icons.info),
    //         title: const Text('About'),
    //         onTap: () {
    //           Get.to(() => const NavigationMenu());
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
