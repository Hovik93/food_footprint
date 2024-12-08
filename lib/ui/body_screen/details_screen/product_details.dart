// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  String productName;
  Map<String, dynamic> productDetails;
  ProductDetails({
    super.key,
    required this.productName,
    required this.productDetails,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> allowedKeys = [
    'Environmental Impact',
    'Seasonality',
    'Transportation',
    'Alternative',
  ];

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: body(theme: theme),
    );
  }

  Widget body({TextTheme? theme}) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                widget.productDetails['image'],
                height: 240.w,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 15,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: AppColors.gray3,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.productName,
                          style: theme?.headlineLarge,
                        ),
                        Center(
                          child: Container(
                            width: 160.w,
                            height: 160.w,
                            margin: const EdgeInsets.symmetric(vertical: 25),
                            child: CustomPaint(
                              painter: DottedCirclePainter(),
                              child: Center(
                                child: Text(
                                  widget.productDetails['Carbon Footprint'],
                                  style: theme?.titleMedium,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allowedKeys.map((key) {
                        if (key == 'Alternative') {
                          return buildAlternativesSection(
                            title: key,
                            alternatives:
                                widget.productDetails[key] as List<dynamic>,
                            theme: theme,
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: buildSection(
                              title: key,
                              content:
                                  widget.productDetails[key]?.toString() ?? '',
                              theme: theme,
                            ),
                          );
                        }
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSection({
  required String title,
  required String content,
  TextTheme? theme,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.gray1,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme?.headlineMedium?.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        Text(
          content,
          style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
        ),
      ],
    ),
  );
}

Widget buildAlternativesSection({
  required String title,
  required List<dynamic> alternatives,
  TextTheme? theme,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: AppColors.gray1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme?.headlineMedium?.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: alternatives
              .map((alt) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.gray1,
                    ),
                    child: Text(
                      alt,
                      style: theme?.titleSmall,
                    ),
                  ))
              .toList(),
        ),
      ],
    ),
  );
}

class DottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const double dashWidth = 6;
    const double dashSpace = 4;

    double totalCircumference = 2 * 3.141592653589793 * radius;
    double dashCount = totalCircumference / (dashWidth + dashSpace);
    double dashAngle = 2 * 3.141592653589793 / dashCount;

    for (int i = 0; i < dashCount; i++) {
      double startAngle = i * dashAngle;
      double endAngle = startAngle + (dashWidth / radius);

      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
