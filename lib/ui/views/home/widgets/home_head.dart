import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/image_constants.dart';
import '../../../../core/theme/app_palette.dart';
//place inside the home  directory because this widget is only used for the home screen.
class HomeHead extends StatelessWidget {
  final double height;
  final double width;

  const HomeHead({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * 0.08),
      child: Center(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppPalette.purpleWhite),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppPalette.litePurple,
                          AppPalette.darkPurple
                        ])),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Let's learn\n together",
                      style: GoogleFonts.akayaKanadaka(
                        color: AppPalette.white,
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: height*0.9,
                        width: width*0.4,
                        child: const Image(
                            image:
                                AssetImage(ImageConstants.studentIllustration)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
