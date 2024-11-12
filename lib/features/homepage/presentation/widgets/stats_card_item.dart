import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';

class StatCardItem extends StatelessWidget {
  const StatCardItem(
      {super.key,
      required this.icon,
      required this.value,
      required this.item,
      required this.color});

  final IconData icon;
  final String value;
  final String item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.lightColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Icon(
                icon,
                size: 30,
                color: AppColors.lightColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: FontClass.headerStyleMediumBlack),
                Text(item)
              ],
            )
          ],
        ),
      ),
    );
  }
}
