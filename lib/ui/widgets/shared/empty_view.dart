import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/animation_constants.dart';

class EmptyView extends StatelessWidget {
  final double height;
  final double width;
//generic view empty viewState
  const EmptyView({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          Lottie.asset(AnimationConstants.empty,
              height: height*0.5,
              width: width/2),
          Text(
            'Nothing in the list to show.\nWe will upload soon.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
