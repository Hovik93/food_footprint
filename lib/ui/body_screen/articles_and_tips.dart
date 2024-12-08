import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/data/articles_data.dart';
import 'package:food_footprint/data/articles_tips_data.dart';
import 'package:food_footprint/ui/body_screen/details_screen/article_details/carbon_foot_print.dart';
import 'package:food_footprint/ui/body_screen/details_screen/article_details/how_to_reduce.dart';
import 'package:food_footprint/ui/body_screen/details_screen/article_details/sustainable_diet.dart';
import 'package:food_footprint/ui/body_screen/details_screen/article_details/sustainable_eating.dart';
import 'package:food_footprint/ui/body_screen/details_screen/article_details/whatIsCarbon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesAndTipsScreen extends StatefulWidget {
  const ArticlesAndTipsScreen({super.key});

  @override
  State<ArticlesAndTipsScreen> createState() => _ArticlesAndTipsScreenState();
}

class _ArticlesAndTipsScreenState extends State<ArticlesAndTipsScreen> {
  final PageController _pageController = PageController();

  _launchURL({required String urlLink}) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: body(theme: theme),
    );
  }

  Widget body({TextTheme? theme}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 600.w,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: articlesTips.length,
                  itemBuilder: (context, index) {
                    final tip = articlesTips[index];
                    return Stack(
                      children: [
                        Image.asset(
                          tip['image'],
                          height: 600.w,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 600.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20.w,
                          left: 16.w,
                          right: 16.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tip['title'],
                                style: theme?.headlineMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                tip['description'],
                                style: theme?.titleSmall,
                              ),
                              SizedBox(
                                height: 30.w,
                              ),
                              Center(
                                child: SmoothPageIndicator(
                                  controller: _pageController,
                                  count: 10,
                                  effect: const ScrollingDotsEffect(
                                    activeDotScale: 1.5,
                                    maxVisibleDots: 5,
                                    dotWidth: 12,
                                    dotHeight: 8,
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.white,
                                    spacing: 6,
                                    fixedCenter: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                top: 50.w,
                left: 16.w,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Articles and tips',
                    style: theme?.titleMedium,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10, top: 25),
            child: Text(
              'Articles',
              style: theme?.headlineLarge,
            ),
          ),
          ...List.generate(
            articles.length,
            (index) => GestureDetector(
              onTap: () {
                _launchURL(urlLink: articles[index]['url']);
              },
              child: GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return WhatIsCarbon();
                        }),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return HowToReduce();
                        }),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return CarbonFootPrint();
                        }),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return SustainableEating();
                        }),
                      );
                      break;
                    case 4:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return SustainableDiet();
                        }),
                      );
                      break;
                    default:
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        articles[index]['image'],
                        height: 200.w,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          articles[index]['title'],
                          style: theme?.headlineMedium?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
