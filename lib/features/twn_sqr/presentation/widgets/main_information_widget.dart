import 'package:flutter/material.dart';
import 'package:twn_sqr/core/constants/app_text_styles.dart';
import 'package:twn_sqr/core/constants/appcolors.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/card_info.dart';
import 'package:twn_sqr/features/twn_sqr/domain/entities/card_tag.dart';
import 'package:twn_sqr/features/twn_sqr/presentation/widgets/dashboard_app_bar.dart';

class MainInformationWidget extends StatefulWidget {
  const MainInformationWidget({
    super.key,
  });

  @override
  State<MainInformationWidget> createState() => _MainInformationWidgetState();
}

class _MainInformationWidgetState extends State<MainInformationWidget> {
  final cardList = [
    const CardInfo(
      title: "Beach Yoga",
      time: "08:00",
      location: "La playa de la Rada",
      minutes: 60,
      spotsLeft: 8,
      price: 9,
      tags: [CardTag(tag: CardTagEnum.light)],
    ),
    const CardInfo(
      title: "Reformer Pilates",
      time: "09:00",
      location: "Wellness Studios",
      minutes: 60,
      spotsLeft: 4,
      price: 15,
      tags: [
        CardTag(tag: CardTagEnum.medium),
        CardTag(tag: CardTagEnum.childcare),
      ],
    ),
    const CardInfo(
      title: "5-a-side Footbla",
      time: "12:30",
      location: "Municipal Sports Center",
      minutes: 45,
      spotsLeft: 0,
      price: 19,
      tags: [
        CardTag(tag: CardTagEnum.high),
        CardTag(tag: CardTagEnum.childcare),
      ],
    ),
    const CardInfo(
      title: "Standing Tapas Lunch",
      time: "13:15",
      location: "Casa Marina",
      minutes: 60,
      spotsLeft: 8,
      price: 15,
      tags: [
        CardTag(tag: CardTagEnum.light),
        CardTag(tag: CardTagEnum.childcare),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardAppBar(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 0,
                  child: const CustomPaint(
                    painter: DashedLinePainter(
                      color: AppColors.neutralBlack,
                      strokeWidth: 1,
                      dashWidth: 10,
                      dashSpace: 5,
                    ),
                    size: Size.infinite,
                  ),
                ),
                SizedBox(
                  width: 590,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      const Text("TODAY/TUESDAY"),
                      Expanded(
                        child: ListView.builder(
                            itemCount: cardList.length,
                            itemBuilder: (ctx, index) {
                              return ActivityCard(cardInfo: cardList[index]);
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  const DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    double startY = 0;

    while (startY < size.height) {
      path.moveTo(0, startY);
      path.lineTo(0, startY + dashWidth);
      startY += dashWidth + dashSpace;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

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
