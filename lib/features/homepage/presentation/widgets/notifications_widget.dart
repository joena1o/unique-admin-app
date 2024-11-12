import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: AppColors.lightColor,
        child: Container(
          height: 555,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notifications",
                style: FontClass.headerStyleBlack,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 80,
                      leading: const CircleAvatar(
                        radius: 40,
                        child: Text(
                          "HJ",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.blueLightColor,
                            ),
                            child: Text(
                              "Sales",
                              style: FontClass.whiteSmallText,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hyefur Jonathan",
                            style: FontClass.buttonStyleBlack,
                          ),
                        ],
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text("Order Request"),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
