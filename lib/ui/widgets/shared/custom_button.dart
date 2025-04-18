import 'package:flutter/material.dart';
import 'package:trogon_learning/core/theme/app_palette.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onTap;
  final String buttonText;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppPalette.darkPurple,
          borderRadius: BorderRadius.circular(height * 0.4),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: AppPalette.white),
          ),
        ),
      ),
    );
  }
}
