import 'package:flutter/material.dart';
import 'package:trogon_learning/core/theme/app_palette.dart';
import 'package:trogon_learning/ui/widgets/shared/custom_button.dart';

class ErrorView extends StatelessWidget {
  final double width;
  final double height;
  final Function onRetry;
  final Function onCancel;
final bool canPopScreen;
  const ErrorView({
    super.key,
    required this.width,
    required this.height,
    required this.onRetry,
    required this.onCancel,
    required this.canPopScreen

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppPalette.white,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went\nwrong',textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: height * 0.1),
          CustomButton(
            width: width * 0.8,
            height: height * 0.15,
            onTap: () {
              onRetry();
            },
            buttonText: 'Retry',
          ),
          SizedBox(height: height * 0.08),
          //visibility used , because not every view may contain the cancel button requirement ,
          Visibility(
            visible: !canPopScreen,
            child: CustomButton(
              width: width * 0.8,
              height: height * 0.15,
              onTap: () {
                onCancel();
              },
              buttonText: 'Cancel',
            ),
          ),
        ],
      ),
    );
  }
}
