import 'package:flutter/material.dart';
import 'package:food_footprint/base/constants.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> settingsList = [
    'Privacy Policy',
    'User Agreement',
    'Rate the App',
  ];
  final InAppReview inAppReview = InAppReview.instance;
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: theme?.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
              settingsList.length,
              (index) => InkWell(
                onTap: () async {
                  switch (index) {
                    case 0:
                      _launchURL(urlLink: privacyPolicyUrl);
                      break;
                    case 1:
                      _launchURL(urlLink: userAgreementUrl);
                      break;
                    case 2:
                      if (await inAppReview.isAvailable()) {
                        inAppReview.requestReview();
                      }
                      break;
                    default:
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        settingsList[index],
                        style: theme?.titleSmall,
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
