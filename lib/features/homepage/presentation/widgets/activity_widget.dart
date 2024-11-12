import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/utils/font_class.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: AppColors.lightColor,
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Activity",
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
                      leading: const CircleAvatar(
                        radius: 35,
                        child: Text(
                          "HJ",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hyefur Jonathan",
                            style: FontClass.buttonStyleBlackBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "3 hours ago",
                            style: FontClass.buttonStyleBlack,
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Paid invoice: #1092401",
                              style: FontClass.infoLabelGray,
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                            ),
                            child: Text(
                              "Sent",
                              style: FontClass.whiteSmallText,
                            ),
                          ),
                        ],
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
