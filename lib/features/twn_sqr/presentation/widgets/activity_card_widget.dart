import 'package:flutter/material.dart';
import 'package:twn_sqr/core/constants/app_text_styles.dart';
import 'package:twn_sqr/core/constants/appcolors.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/card_info.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/card_tag.dart';

class ActivityCard extends StatelessWidget {
  final CardInfo cardInfo;
  ActivityCard({super.key, required this.cardInfo});
  final Map<CardTagEnum, List<Color>> colorMap = {
    CardTagEnum.light: [const Color(0xff65B5DB), const Color(0xffD5F1FF)],
    CardTagEnum.medium: [const Color(0xffC9A4F2), const Color(0xffF3E8FF)],
    CardTagEnum.high: [const Color(0xffDC974F), const Color(0xffFFEAD1)],
    CardTagEnum.childcare: [const Color(0xff8AB58A), const Color(0xffD8F7DF)],
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 555,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.neutralBlack,
            offset: Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: cardInfo.time,
                    style: AppTextStyles.smallInfo
                        .copyWith(color: AppColors.neutralBlack)),
                TextSpan(
                    text: " (${cardInfo.minutes} minutes)",
                    style: AppTextStyles.smallInfo
                        .copyWith(color: AppColors.grey)),
              ])),
              const SizedBox(height: 8),
              Text(cardInfo.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    cardInfo.location,
                    style: AppTextStyles.cardLocation,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 4),
                        Text(
                          '${cardInfo.spotsLeft} spots left',
                          style: AppTextStyles.cardTag.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ...cardInfo.tags.map((element) {
                    List<Color> colors = colorMap[element.tag]!;
                    return Container(
                      margin: const EdgeInsets.only(left: 4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: colors[1]),
                      child: Text(
                        element.tag.name,
                        style: AppTextStyles.cardTag.copyWith(color: colors[0]),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${cardInfo.price}€', style: AppTextStyles.cardValue),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neutralBlack,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    // Adjust the radius as needed
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                ),
                child: Text(
                  'Join',
                  style: AppTextStyles.cardJoin,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
