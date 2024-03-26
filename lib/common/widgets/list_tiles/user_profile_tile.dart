import 'package:e_mart/common/widgets/images/circular_image.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(
      () => ListTile(
        leading: const TCircularImage(
            image: TImages.user, width: 50, height: 50, padding: 0),
        title: Text(controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white)),
        subtitle: Text(controller.user.value.email ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white)),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(Iconsax.edit, color: TColors.white)),
      ),
    );
  }
}
