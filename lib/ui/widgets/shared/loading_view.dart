import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/animation_constants.dart';
import '../../../core/theme/app_palette.dart';
class LoadingView extends StatelessWidget {
  final double height;
  final double width;

  const LoadingView({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Lottie.asset(AnimationConstants.loadingAnimation,
          height: height*0.5,
          width: width/2),
          Text(
            "Loading....",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppPalette.prussianBlue),
          )
        ],
      ),
    );
  }
}
