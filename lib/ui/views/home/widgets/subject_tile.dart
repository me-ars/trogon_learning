import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class SubjectTile extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final String subject;
  final String imageUrl;
  final String description;

  const SubjectTile({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.subject,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: height * 0.1,
        right: height * 0.1,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:  AppPalette.purpleWhite,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: height,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppPalette.grey,
                      width: width,
                      height: height,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.broken_image,
                              size: 40, color: AppPalette.grey),
                          Text(
                            subject,
                            style: const TextStyle(color: AppPalette.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: height * 0.35,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppPalette.grey,
                    AppPalette.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  child: Text(
                      overflow: TextOverflow.ellipsis,
                      description,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppPalette.grey),
                      maxLines: 1,
                    ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
