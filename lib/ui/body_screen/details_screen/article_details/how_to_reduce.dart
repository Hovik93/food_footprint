import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';

class HowToReduce extends StatefulWidget {
  const HowToReduce({super.key});

  @override
  State<HowToReduce> createState() => _HowToReduceState();
}

class _HowToReduceState extends State<HowToReduce> {
  List<Map<String, dynamic>> waysToReduce = [
    {
      "title": "Drive Less",
      "description":
          "Avoiding driving for a year could save about 2.6 tons of carbon dioxide. Driving less can still impact GHG emissions even if going carless for a year is challenging.",
    },
    {
      "title": "Take Public Transit",
      "description":
          "Taking public transportation, such as a train or bus, instead of driving can positively impact GHG emissions, even if done only several times a week.",
    },
    {
      "title": "Carpooling",
      "description":
          "Carpooling with colleagues or friends for events can reduce your carbon footprint.",
    },
    {
      "title": "Bike to Work",
      "description":
          "Taking a bike to work or running errands when the weather permits helps reduce emissions.",
    },
    {
      "title": "Plan Your Route",
      "description":
          "Planning your errands for the most efficient route can save time, money, and emissions.",
    },
    {
      "title": "Maintain Your Car",
      "description":
          "Keep your car running efficiently by servicing it and checking tire pressure. Avoid unnecessary idling and carrying heavy items.",
    },
    {
      "title": "Fly Less",
      "description":
          "Reducing the number of long flights and opting for alternatives like trains or buses can significantly cut GHG emissions.",
    },
    {
      "title": "Choose a Staycation",
      "description":
          "Instead of flying to far-off destinations, opt for staycations to reduce emissions.",
    },
    {
      "title": "Conserve Energy",
      "description":
          "Turn down the heat, layer up, and use less energy to reduce GHG emissions.",
    },
    {
      "title": "Install a Smart Thermostat",
      "description":
          "Programmable thermostats help maintain stable indoor temperatures and conserve energy.",
    },
    {
      "title": "Turn Off Lights and Appliances",
      "description":
          "Turn off lights and appliances when not in use to conserve energy.",
    },
    {
      "title": "Switch to LED Bulbs",
      "description":
          "LED bulbs use 85% less energy and last 25 times longer, making them an easy way to reduce your carbon footprint.",
    },
    {
      "title": "Use Renewable Energy Sources",
      "description":
          "Choose an electric company that runs on renewable energy, if available in your area.",
    },
    {
      "title": "Limit the Use of Appliances",
      "description":
          "Use energy-efficient appliances and limit their use to reduce emissions.",
    },
    {
      "title": "Seal and Insulate",
      "description":
          "Seal windows and doors and insulate your home to stabilize temperatures and reduce energy costs.",
    },
    {
      "title": "Eat Local",
      "description":
          "Opt for locally grown food to reduce emissions from transportation.",
    },
    {
      "title": "Eat Less Meat",
      "description":
          "Reduce red meat consumption since it has a significant environmental impact.",
    },
    {
      "title": "Eat Seasonally",
      "description":
          "Eating fruits and vegetables in season reduces emissions and supports local agriculture.",
    },
    {
      "title": "Waste Less Food",
      "description":
          "Organize your fridge, freeze extra food, and avoid waste to reduce GHG emissions from discarded food.",
    },
    {
      "title": "Recycle",
      "description":
          "Recycle paper, plastic, and electronics responsibly to reduce landfill waste.",
    },
    {
      "title": "Resist Fast Fashion",
      "description":
          "Avoid fast fashion and take care of your wardrobe to reduce textile waste.",
    },
    {
      "title": "Donate Old Items",
      "description":
          "Donate items in good condition to reduce waste and give them a second life.",
    },
    {
      "title": "Choose Sustainable Brands",
      "description":
          "Support companies that use sustainable materials and environmentally friendly practices.",
    },
    {
      "title": "Select Natural Fibers",
      "description":
          "Choose biodegradable materials like cotton, linen, and wool to reduce your environmental impact.",
    },
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'How to Reduce Carbon Footprint: 24 Ways to Take Action',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                'Reducing the greenhouse gases responsible for global warming is of the utmost importance. Individuals, corporations, and governments must assess their impact on this planet. By evaluating the carbon footprint, each individual can take action to reduce their impact on climate change. But what is a carbon footprint, and what actions can we take to reduce our environmental impact? Here, we discuss a carbon footprint and how to reduce it.t',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/article/article2.png",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'What is Carbon Footprint?',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                'Simply put, a carbon footprint conveys a person, product, company, or industry’s environmental impact. It measures the total amount of greenhouse gas (GHG) emissions from a product or service’s production, use, and disposal. These GHGs include carbon dioxide (the most frequently produced by humans), methane, nitrous oxide, and fluorinated gases. Most of these gases are produced from transportation, housing, and food. When these gases are released into the atmosphere, they trap heat, which causes global warming and is believed to be responsible for climate change.',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'What is the Average Carbon Footprint?',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                'According to The Nature Conservancy, the average carbon footprint per resident in the United States is 16 tons per year, the highest rate globally. The global average is nearly 4 tons per person. The Nature Conservancy warns that to avoid a 2⁰ Celsius (35.6⁰ Fahrenheit) rise in global temperatures, the average global carbon footprint per person per year must “drop to under 2 tons by 2050.” Cumulatively, seemingly small, individual changes can make a tremendous global impact. Factors impacting an individual’s carbon footprint include: \n . Travel and daily commute\n. Diet\n. Items you buy, such as clothing\n. What is discarded\n. Energy use at home',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '24 Ways to Reduce Carbon Footprint:',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              ...List.generate(
                  waysToReduce.length,
                  (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 10, top: (index > 0) ? 10 : 0),
                            child: Text(
                              "${index + 1}. ${waysToReduce[index]['title']}",
                              style: theme?.titleSmall,
                            ),
                          ),
                          Text(
                            waysToReduce[index]['description'],
                            style: theme?.titleSmall
                                ?.copyWith(color: AppColors.grayLight),
                          ),
                        ],
                      )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Final Thoughts on How to Reduce Carbon Footprint',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                'No one can tackle climate change alone. As individuals, corporations, and governments assess their carbon footprints, everyone can take actionable steps toward a cumulative effort to halt climate breakdown. It is everybody’s responsibility to protect this planet. By shifting to a low carbon economy and low GHG emissions, we can work toward protecting the only place we call home.',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
