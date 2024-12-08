import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';

class WhatIsCarbon extends StatefulWidget {
  const WhatIsCarbon({super.key});

  @override
  State<WhatIsCarbon> createState() => _WhatIsCarbonState();
}

class _WhatIsCarbonState extends State<WhatIsCarbon> {
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
                  'What is a Carbon Footprint and How is it Calculated?',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Terms like carbon footprint and ecological footprint gained popularity in the 1990s as people became more conscious of their environmental impact. A carbon footprint measures emissions contributing to climate change, while an ecological footprint measures space use and its impact on the ecosystem. Carbon footprint calculators are an educational tool that can help individuals and companies better understand their impact and how to reduce it. The following article will explore what a carbon footprint is and how a carbon footprint is calculated.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/article/article1.png",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'What is a Carbon Footprint?',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "A carbon footprint is the total amount of greenhouse gases caused by an individual, event, organization, service, place, or product. It is measured by the amount of carbon dioxide (CO2) produced by burning fossil fuels and is expressed as a weight of CO2 emissions produced in tonnes, often referred to as carbon equivalents. Human activities are one of the major causes of greenhouse gas emissions. Greenhouse gases can be emitted through… \n\n. Burning of fossil fuels for electricity, health, and transportation\n. Land use and forestry\n. Production and consumption of food\n. Manufacturing of goods\n. Industry\n. And more",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'What is Ecological Footprint?',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                'The ecological footprint is the impact of human activities measured in terms of the area of biologically productive land and water required to produce the goods consumed and to assimilate the waste generated. Essentially, it is the number of earths needed for humans to survive. It illustrates the human demand and impact on ecosystems.\nThe carbon footprint emerged from William E. Rees and Mathis Wackernagel’s concept, known as the ecological footprint, in the 1990s.\nThe major difference between the two ideas is that ecological footprints are reported regarding what the planet can renew, whereas carbon footprints are written in terms of tons of emissions (CO2—equivalent) per year.',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'How is Carbon Footprint Calculated?',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                'A carbon footprint can be measured by undertaking a GHG emissions assessment, a life cycle assessment, or other calculative activities denoted as carbon accounting. It is the total greenhouse gas (GHG) emissions caused directly and indirectly.\n\nFactors included in the calculation\n. Food and diet\n. Personal transportation\n. Air travel\n. House size and amenities\n. Shopping and recreation activities\n\nA carbon footprint is typically calculated by estimating the CO2 and other greenhouse gas emissions (e.g., methane and nitrous oxide) associated with a given activity.\nFor simplicity, the carbon footprint is calculated by summing and expressing the emissions in a single number, referred to as carbon dioxide equivalent (CO2e). That number represents the amount of CO2 that would create the same amount of warming (climate change impact).\nThere are many websites available to calculate your carbon footprint. Since there is no golden standard, calculating carbon footprints is often uncertain.\nWhile no footprint calculator is precise, it still shows an individual or company’s impact on the environment.',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Top Websites to Calculate Your Carbon Footprint:',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                '1. Nature.org Carbon Footprint Calculator\n2. Berkeley Cool Climate\n3. Environmental Protection Agency\n4. Carbon Footprint Calculator\n5. WWF Carbon Footprint Calculator\n6. UN Carbon Footprint Calculator\n7. Terrapass Carbon Footprint Calculator\n\nOnce the size of a carbon footprint is known, a strategy can be developed to reduce it.',
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Average Carbon Footprints",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "The average carbon footprint ranges depending on where you live. Generally, developed nations have a much higher carbon footprint than developing nations.\n\nThe average person’s annual carbon footprint (emissions per capita)\n. Global – 4 tons\n. United States – 16 tons\n. Australia – 16 tons\n. Canada – 14.2 tons\n. China – 10.1 tons\n. United Kingdom – 5.81\n. Mexico – 3.58 tons\n. India – 2.65 tons\n. Nigeria – 0.64 tons\n. Uganda 0.12 tons\n\nTo have the best chance of mitigating climate changes and avoiding a 2℃ rise in global temperatures, the average global carbon footprint per year must drop by 2 tons by 2050.\nHuman activity is no longer sustainable, and our impacts exceed the earth’s ability to recover.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Why is Calculating Your Carbon Footprint Important?",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Carbon footprint calculators are an educational tool. Calculating individual carbon footprints is necessary to understand one’s contribution to climate change. The first step is to identify your impact, at which point you can identify ways to reduce it. By lowering your carbon footprint, you can help reduce greenhouse gas emissions. Often, small actions to reduce greenhouse gas emissions can save money and help you live healthier.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Top 5 Sources of Carbon Emissions:",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "1. Food",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Food and diet can drastically impact one’s carbon footprint. Food can account for 10% to 30% of a household’s carbon footprint. Production (e.g., agricultural practices) accounts for 68% of food emissions, while transportation accounts for 5%.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "Carbon Footprint Ranking of Food",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Food CO2 Kilos Equivalent\n. Lamb 39.2\n. Beef 27\n. Cheese 13.5\n. Pork 12.1\n. Turkey 10.9\n. Chicken 6.9\n. Tuna 3.1\n. Eggs 4.8\n. Potatoes 2.9\n. Rice 2.7",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "Meat products have larger carbon footprints per calorie than grain or vegetable products. This is because meat releases CH4 from manure and ruminants.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "How to reduce emissions related to food",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Eliminating the transportation of food for one year could save the GHG equivalent of driving 1,000 miles.\n. Shifting to a vegetarian meal one day a week could save the equivalent of driving 1,160 miles.\n. Switching to a vegetarian diet\n. Switching to less carbon-intensive meats (beef GHG emission per kilogram is 7.2 times higher than chicken)\n. Reducing meat in your diet\n. Avoid wasting food",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "2. Household Emissions",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Household emissions include home size, electricity and heat usage, and heavy appliances. Unsurprisingly, smaller houses use less energy and fewer resources. The electricity source can also influence the carbon footprint (e.g., coal vs. solar). It is estimated that, for each kWh generated in the US, an average of 0.889 pounds of CO2e is released at the power plant.\n",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "Comparison of Carbon Released by Energy Source",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Coal releases 2.2 pounds\n. Petroleum releases 1.9 pounds\n. Natural gas emits 0.9 pounds\n. Nuclear, solar, wind, and hydroelectric release no Co2 when they produce electricity, but emissions are released during production activities (e.g., solar cells, atomic fuels)\n\nAppliances, especially older appliances, can also influence one’s carbon footprint. Refrigerators are one of the most significant sources of energy for household appliances. In 2019, an average of 672 lbs of CO2e per household was released because of refrigeration. Laundry is also a major source of household emissions because it requires heat for both washing and drying. Many people don’t realize that even though you are not using an electronic device, it draws electricity as long as it is plugged in. Energy consumed by devices in standby mode accounts for 5-10% of residential energy use, adding up to \$100 per year for the average American household.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "How to reduce emissions related to household",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Switch to renewable energy (e.g., solar, wind)\n. Upgrade older appliances to energy-efficient appliances\n. Switching to cold water washing once per week can reduce household GHG emissions by over 70 lbs annually\n. Unplug electronic devices when not in use\n. Use energy-efficient lighting\n. Practice the 3 R’s – reduce, reuse, and recycle\n. Use less water\n. Turn off lights",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "3. Personal Transportation",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Transportation is now one of the largest sources of carbon emissions in the United States. Personal automobiles are the greatest polluters in most cities because their emissions quickly increase due to their heavy reliance on petroleum. For example, the average passenger car emits 0.78 pounds of CO2 per mile.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "How to reduce emissions related to personal transportation",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Walk or bike\n. Take public transportation or mass transit\n. Carpool\n. Following the speed limit can improve fuel economy by 7-14%\n. Switch to an electric car\n. Ensure car tires are properly inflated\n. Buy an efficient vehicle (e.g., switching from a vehicle that gets 20 mpg to a car that gets 25 mpg reduces your greenhouse gas emissions by 1.7 tons annually)",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "4. Air Travel",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Jet fuel is a high-carbon energy source, and take-off and landing are the most fuel-intensive parts of a flight. Therefore, the more connecting flights you have, your carbon footprint will increase. Commercial aircraft GHG emissions vary according to the aircraft type, passenger and cargo weight, trip length, and occupancy rates. The heavier a plane is, the more fuel it will consume. In 2019, the average domestic commercial flight emitted 0.39 pounds of CO2e per passenger mile.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "How to reduce emissions related to air travel",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Take the train or other forms of transportation when possible\n. Choose a direct flight\n. Pack light",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "5. Shopping Activities",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Believe it or not, your shopping choices can enormously influence your carbon footprint. The main things that affect your carbon footprint when shopping are storage, packaging, and transportation of essential consumer products. Fast fashion is currently trendy because of its price point, but this has substantial environmental implications. For example, a pair of jeans is approximately 15-20 kg CO2e. Buying long-lasting pieces from sustainable brands or secondhand is much better for your carbon footprint than continuously buying cheap clothing that does not last. Electronics also have a high carbon footprint because they need to mine minerals. A new smartphone’s carbon footprint is around 70 kg of CO2e, and a new laptop’s ranges from 200 to 400 kg of CO2e.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Text(
                "How to reduce emissions related to shopping and recreational activities",
                style: theme?.titleMedium?.copyWith(fontSize: 15),
              ),
              Text(
                ". Buy Local\n. Buy products that have less packaging\n. Buy secondhand\n. Use reusable bags\n. Upgrade your electronic devices when necessary (i.e., they stop working)\n. Repair items instead of replacing them\n. Learn more about -> sustainable shopping",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Offsetting Your Carbon Footprint",
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Carbon offsets are credits produced by projects that reduce, remove, or capture CO2 emissions from the atmosphere. Essentially, they are a way for individuals and companies to cancel out the impact of some of their CO2 emissions. Carbon offsets are typically measured in tonnes of CO2e and are bought and sold through international brokers, online retailers, and trading platforms. Some companies allow passengers to offset their trips for an extra cost when taking an airplane. Carbon emissions have a significant impact on your planet. They are the greenhouse gases with the highest atmospheric emissions, leading to climate change. This leads to extreme weather events, wildlife fires, severe droughts, sea-level rise, and much more. The carbon footprint is one way to evaluate your environmental impact, as it measures the greenhouse gases you are responsible for creating.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
