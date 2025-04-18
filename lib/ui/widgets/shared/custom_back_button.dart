import 'package:flutter/material.dart';
import '../../../core/theme/app_palette.dart';

class CustomBackButton extends StatelessWidget {
  final double height;
  final double width;

  const CustomBackButton(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: AppPalette.white,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: AppPalette.purpleWhite,
        ),
      ),
    );
  }
}
