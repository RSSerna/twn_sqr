import 'package:flutter/material.dart';
import 'package:twn_sqr/core/constants/app_text_styles.dart';
import 'package:twn_sqr/core/constants/appcolors.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 50),
      color: AppColors.neutralBlack,
      width: 272,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "TWN", style: AppTextStyles.logo),
            TextSpan(
                text: "SQR",
                style:
                    AppTextStyles.logo.copyWith(color: AppColors.primary600)),
          ])),
          const SizedBox(
            height: 43,
          ),
          sideMenuOptionTile(
            icon: Icons.calendar_month_outlined,
            text: "Activities",
            onTap: () {},
          ),
          const SizedBox(
            height: 33,
          ),
          sideMenuOptionTile(
            icon: Icons.map_outlined,
            text: "Locations",
            onTap: () {},
          ),
          const SizedBox(
            height: 33,
          ),
          sideMenuOptionTile(
            icon: Icons.star_border,
            text: "Services",
            onTap: () {},
          ),
          const SizedBox(
            height: 33,
          ),
          sideMenuOptionTile(
            icon: Icons.people_outline,
            text: "Communities",
            onTap: () {},
          ),
          const SizedBox(
            height: 33,
          ),
          sideMenuOptionTile(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: () {},
          ),
          const SizedBox(
            height: 33,
          ),
          sideMenuOptionTile(
            icon: Icons.calendar_month,
            text: "Activities",
            onTap: () {},
          ),
          const SizedBox(
            height: 33,
          ),
          SizedBox(
            width: 180,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  // Adjust the radius as needed
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.neutralBlack,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Create',
                        style: AppTextStyles.lateralMenuOption
                            .copyWith(color: AppColors.neutralBlack),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                radius: 15,
              ),
              Text(
                "Profile",
                style: AppTextStyles.lateralMenuOption,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: AppColors.neutralWhite,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget sideMenuOptionTile(
      {required IconData icon, required String text, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.neutralWhite,
            size: 22,
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: AppTextStyles.lateralMenuOption,
          )
        ],
      ),
    );
  }
}
