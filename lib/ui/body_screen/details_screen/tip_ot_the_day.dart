import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';
import 'package:food_footprint/data/tip_of_the_day_data.dart';

class TipOfTheDay extends StatefulWidget {
  const TipOfTheDay({super.key});

  @override
  State<TipOfTheDay> createState() => _TipOfTheDayState();
}

class _TipOfTheDayState extends State<TipOfTheDay> {
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: body(theme: theme),
    );
  }

  Widget body({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.tipOfTheDay),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60.w,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gray3,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Tip of the day',
                style: theme?.titleMedium,
              )
            ],
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: const Color(0xff5C5B61),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleTipDay,
                  style: theme?.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  descriptionTipDay,
                  style: theme?.titleSmall,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
