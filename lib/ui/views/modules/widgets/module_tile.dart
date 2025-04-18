import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class ModuleTile extends StatelessWidget {
  final String title;
  final String description;
  final double width;
  final double height;
final int index;
final Function onTap;
  const ModuleTile(
      {super.key,
        required this.onTap,
      required this.title,
      required this.description,
      required this.width,
      required this.height, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * 0.03),
      child: GestureDetector(
        onTap: (){onTap();},
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppPalette.purpleWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppPalette.white,
              child: Text(
                index.toString(),
                style:
                    Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppPalette.white, fontSize: 18),
            ),
            subtitle: Text(description,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppPalette.grey)),
          ),
        ),
      ),
    );
  }
}
