import 'package:flutter/material.dart';
import 'package:twn_sqr/assets/images/images_url.dart';
import 'package:twn_sqr/core/constants/app_text_styles.dart';
import 'package:twn_sqr/core/constants/appcolors.dart';
import 'package:twn_sqr/features/twn_sqr/presentation/widgets/main_information_widget.dart';
import 'package:twn_sqr/features/twn_sqr/presentation/widgets/side_menu_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [SideMenuWidget(), MainInformationWidget(), MyCards()],
      ),
    );
  }
}

class MyCards extends StatelessWidget {
  const MyCards({super.key});
  final double cardsWidth = 350;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: cardsWidth,
          child: Card(
            margin: const EdgeInsets.all(0),
            color: const Color(0xFFE8F5FF),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You\'re close to your goal!',
                    style: AppTextStyles.bannerTitle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 167,
                        child: Column(
                          children: [
                            Text(
                              'Join more sport activities to collect more points',
                              maxLines: 2,
                              style: AppTextStyles.bannerDescription,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BannerButton(
                                  onTap: () {},
                                  btnText: "Join now",
                                ),
                                BannerButton(
                                  onTap: () {},
                                  btnText: "My points",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                strokeWidth: 8.0,
                                value: 0.65, // Adjust value as needed
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blue),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text('27',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: cardsWidth,
          child: Card(
            color: const Color(0xFFFBF2C0),
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 64, bottom: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly workshops for kids',
                    style: AppTextStyles.bannerTitle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign up for early access to weekly activities for your kids full of learning and fun!',
                    style: AppTextStyles.bannerDescription,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: AppColors.neutralWhite,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Learn more',
                            style: AppTextStyles.bannerDescription
                                .copyWith(fontSize: 15),
                          ),
                          const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: AppColors.neutralBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Container(
        //   width: 370,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     image:
        //   ),
        // )
        Container(
          width: cardsWidth,
          height: 410,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: const NetworkImage(
                  eventsNearYouURL), // Replace with your image path
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Popular events near you!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Unleash the fun! Explore the world of exciting events happening near you.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(avatar3URL),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(avatar2URL),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(avatar1URL),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('See more'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BannerButton extends StatelessWidget {
  const BannerButton({super.key, required this.onTap, required this.btnText});
  final Function()? onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.neutralBlack,
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          btnText,
          style: AppTextStyles.bannerButton,
        ),
      ),
    );
  }
}
