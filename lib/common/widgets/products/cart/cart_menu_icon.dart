import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({super.key, required this.onPressed, this.iconColor});

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              '2',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: TColors.white,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
