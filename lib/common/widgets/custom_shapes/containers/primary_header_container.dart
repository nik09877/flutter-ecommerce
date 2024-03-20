import 'package:e_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: SizedBox(
        height: 400,
        child: Container(
            color: TColors.primary,
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                const Positioned(
                    top: -150, right: -250, child: TCircularContainer()),
                const Positioned(
                    top: 100, right: -300, child: TCircularContainer()),
                child,
              ],
            )),
      ),
    );
  }
}
