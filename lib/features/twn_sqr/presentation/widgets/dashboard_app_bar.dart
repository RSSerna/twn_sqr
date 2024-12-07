import 'package:flutter/material.dart';
import 'package:twn_sqr/core/constants/app_text_styles.dart';
import 'package:twn_sqr/core/constants/appcolors.dart';
import 'package:twn_sqr/core/util/information.dart';

class DashboardAppBar extends StatefulWidget {
  const DashboardAppBar({super.key});

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  int indexFilter = 0;
  final String location = "Estepona";
  final filterOptions = [
    "All",
    "Sports",
    "Food",
    "Kids",
    "Creative",
    "Popular",
    "Calm"
  ];

  String getDate() =>
      "${daysOfWeek[DateTime.now().weekday - 1]}, ${months[DateTime.now().month - 1]} ${DateTime.now().day}";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getDate(),
            style: AppTextStyles.smallInfo,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "This Week in $location",
            style: AppTextStyles.title,
          ),
          const SizedBox(
            height: 12,
          ),
          const DashboardSearchBar(),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 34,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.secondaryB200),
                  child: const Icon(Icons.filter_alt_outlined),
                ),
              ),
              ...filterOptions.asMap().entries.map((entry) {
                return filterButton(
                  text: entry.value,
                  index: entry.key,
                );
              })
            ],
          )
        ],
      ),
    );
  }

  Widget filterButton({required String text, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          indexFilter = index;
        });
      },
      child: Container(
        height: 34,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: indexFilter == index
                ? AppColors.secondaryB400
                : AppColors.secondaryB200),
        child: Text(
          text,
          style: AppTextStyles.filter,
        ),
      ),
    );
  }
}

class DashboardSearchBar extends StatelessWidget {
  const DashboardSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 595,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(3, 3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What do you feel like doing?',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
