import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';

class SustainableEating extends StatefulWidget {
  const SustainableEating({super.key});

  @override
  State<SustainableEating> createState() => _SustainableEatingState();
}

class _SustainableEatingState extends State<SustainableEating> {
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
                  'Sustainable Eating: Comprehensive Guide and Global Practices',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Our plates have the power to change the planet. Sustainable eating has become more than a trendy term in a world facing resource scarcity and environmental challenges. It’s a conscious approach to food that nourishes our bodies while protecting our planet. This comprehensive guide dives into sustainable eating, exploring its benefits, practical tips, and the fascinating global practices shaping a more responsible food system. Whether you’re a seasoned chef or a curious beginner, this article will equip you with the knowledge and inspiration to embark on your sustainable food journey.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/article/article4.png",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Table of Contents',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". What Is Sustainable Eating?\n. Benefits of Sustainable Eating\n. Sustainable Food Practices: Cultivating a Healthier Planet\n. Taking Action: Practical Tips for a Sustainable Diet\n. Examples of Sustainable Foods\n. A Sustainable Future on Your Plate",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'What Is Sustainable Eating?',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Sustainable eating has emerged as a powerful concept where food choices can ripple outwards, impacting everything from soil health to global climate. But what exactly does it entail? This section dives into the core principles of sustainable eating, unpacking its environmental considerations and connection to local communities, and focuses on fostering a healthy food system for all.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Definition and Importance',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "Sustainable eating involves making choices that benefit our health and the environment. This considers factors like a food’s impact on soil health, water usage, reliance on pesticides, and land use for production\n\n. Environmental Impact: Food production contributes significantly to environmental challenges. Estimates suggest it’s responsible for 20-30% of global greenhouse gas emissions and up to 66% of water use. Sustainable eating aims to minimise this footprint.\n. Sustainable Farming Practices: Sustainable farming plays a crucial role. These methods prioritise techniques like composting, which promotes biodiversity, conserves water resources, and maintains healthy soil.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Benefits of Sustainable Eating',
                  style: theme?.titleMedium?.copyWith(fontSize: 13),
                ),
              ),
              Text(
                ". Combats climate change: Reducing meat consumption can significantly decrease greenhouse gas emissions. Studies suggest that 2050 emissions could be lowered by 64% through sustainable food choices.\n. Water conservation: Sustainable practices minimise water usage in agriculture.\n. Ethical Considerations: Sustainable eating often aligns with ethical food choices, supporting fair treatment of workers and animals.\n. Healthier You: Sustainable diets often prioritise fresh, local produce, which can contribute to better health outcomes.\n. Biodiversity and Land Use: Sustainable practices help preserve biodiversity and protect forests from clearing for agriculture.\n\nOpting for locally sourced vegetables, organic produce, and reduced meat consumption contributes to a healthier planet and a more sustainable food system.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Core Principles of Sustainable Eating',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Plant-Based Focus: Sustainable diets emphasise plant-based foods like fruits, vegetables, legumes, and whole grains, reducing reliance on resource-intensive animal agriculture.\n. Local and Seasonal Sourcing: Choosing locally sourced and seasonal produce minimises transportation emissions and supports local farmers.\n. Low-Impact Practices: Sustainable eating prioritises food production practices that minimise environmental impact, such as climate-friendly agriculture and reduced use of pesticides.\n. Fair Trade: Opting for fair trade products ensures fair treatment of farmers and workers throughout the supply chain.\n. Renewable Resources: Including renewable resources like seaweed and mushrooms in the diet can further reduce environmental impact compared to traditional food options.\n. Carbon Footprint Reduction: Sustainable diets aim to minimise the carbon footprint associated with food choices. This is achieved through prioritising biodiversity, organic farming methods, and minimising food waste.\n\nThese elements contribute to healthy living and benefit the environment by promoting biodiversity, protecting forests, and conserving water resources. Integrating these principles into daily meals significantly contributes to building a more sustainable food system with reduced greenhouse gas emissions.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Benefits of Sustainable Eating',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Sustainable eating isn’t just about making eco-conscious choices at the grocery store. It’s a powerful approach that ripples outwards, impacting our health, communities, and planet. This section delves into the numerous benefits of embracing a sustainable diet, revealing how it fosters a healthier you, strengthens local economies, and safeguards our environment for future generations. Prepare to discover how small changes on your plate can create a world of positive effects.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'A Multifaceted Approach',
                  style: theme?.headlineMedium?.copyWith(fontSize: 18),
                ),
              ),
              Text(
                "Sustainable eating offers a path to a healthier you. Plant-based diets rich in local and seasonal produce are linked to a lower risk of chronic diseases like heart disease and diabetes.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Improved Health Outcomes',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Reduced Disease Risk: Studies suggest that sustainable diets, often featuring less red meat and more plant-based options, can help lower the risk of chronic diseases.\n. Weight Management: Sustainable practices often promote lower-impact food choices, contributing to weight management and overall well-being.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Environmental Benefits Impact Our Health',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Climate-Friendly Agriculture: Sustainable eating supports practices that minimise environmental impact in agriculture. This creates a healthier environment, which in turn positively impacts our health in the long run.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Ethical Considerations and Biodiversity',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                "While ethically sourced food aligns with sustainable practices, it may not directly impact personal health. However, focusing on biodiversity within a sustainable diet can be beneficial.\n\n. Improved Nutrition: Including various plant and animal species (when consumed) from well-managed sources can contribute to a more balanced and nutritious diet.\n. Reduced Environmental Impact: Choosing diverse, sustainably sourced foods can help lower the overall carbon footprint of your diet.\n\nOverall, sustainable eating offers a holistic approach to wellness, promoting both personal and environmental well-being.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Environmental Impact',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Sustainable eating offers a powerful tool for environmental protection. Here’s how:\n\n. Reduced Greenhouse Gas Emissions: Choosing foods with lower carbon footprints, like local produce and plant-based options, helps decrease greenhouse gas emissions associated with food production.\n. Resource Conservation: Sustainable food production methods, such as climate-friendly agriculture and eco-friendly packaging, conserve natural resources and minimise land use needed for traditional farming.\n. Minimised Food Waste: Sustainable practices at home, like meal planning and choosing low-impact foods with minimal packaging, significantly reduce food waste, which lessens environmental strain.\n\nBy making conscious choices about what we consume and implementing environmentally friendly practices, we can significantly lessen the environmental impact of food production. This allows us to enjoy nutritious meals while contributing to a healthier planet.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Sustainable Food Practices: Cultivating a Healthier Planet',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Food travels a complex journey from the bustling farms to the shelves of our grocery stores. But how can we ensure this journey minimises environmental impact and fosters a healthy planet? This section delves into the world of sustainable food practices. We’ll explore innovative farming methods, responsible consumption strategies, and clever ways to reduce food waste. By understanding these practices, you’ll be empowered to make informed choices that nourish your body and nurture our shared environment.\nSustainable food practices encompass various approaches that minimise environmental impact throughout the food chain. Here’s a closer look:",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Sustainable Farming Techniques',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                ". Biodiversity and Soil Health: Sustainable farming prioritises soil health and biodiversity. This includes using natural methods like crop rotation and cover cropping to maintain fertile soil and reduce reliance on harmful pesticides and fertilisers.\n. Animal Welfare: Many sustainable farms prioritise ethical animal welfare practices in livestock rearing, contributing to higher quality and potentially more environmentally friendly food production.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Environmental Benefits',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                ". Healthy Ecosystems: Sustainable farming promotes practices that protect wildlife habitats and encourage efficient land use, contributing to a healthier ecosystem overall.\n. Reduced Emissions and Resource Conservation: Choosing food from sustainable farms can help reduce greenhouse gas emissions and conserve natural resources like water.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Supporting Local and Sustainable Agriculture',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "By supporting local farmers who use sustainable practices, consumers can directly contribute to building a more resilient food system that benefits everyone. This strengthens local economies and fosters a more sustainable food chain.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Choosing Sustainable Foods',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Knowledge is power, but true change comes through action. This section dives into practical tips you can incorporate into your daily routine. From choosing what goes in your shopping cart to navigating the complexities of seafood, we’ll equip you with the tools to make your diet as sustainable as it is delicious. Let’s turn your newfound knowledge into a delicious, planet-friendly feast!",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Plant-Based Options',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Choosing a plant-based diet is a climate-friendly approach, significantly reducing the environmental impact of food consumption compared to animal agriculture.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Local and Seasonal Produce',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Buying local and seasonal produce supports the local community and minimises environmental impact by reducing transportation emissions associated with long-distance food transport.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Minimising Packaging Waste',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Opting for foods with minimal or biodegradable packaging helps promote sustainability by reducing waste.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Climate-Friendly Farming Practices',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". When choosing sustainable foods, consider the farming practices used. Supporting farms that utilise organic farming, crop rotation, and agroforestry contributes to reduced greenhouse gas emissions and safeguards biodiversity.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Sustainable Seafood',
                  style: theme?.titleMedium?.copyWith(fontSize: 15),
                ),
              ),
              Text(
                ". Choosing low-impact seafood options, like bivalve shellfish, further enhances the sustainability of your diet.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Taking Action: Practical Tips for a Sustainable Diet',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Ready to take action? Let’s dive into practical tips to make your sustainable diet a reality!",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Small Steps, Big Impact',
                  style: theme?.headlineMedium?.copyWith(fontSize: 17),
                ),
              ),
              Text(
                "Transitioning to a sustainable diet doesn’t require drastic changes. Start small by incorporating more plant-based meals, reducing meat and seafood consumption, and exploring alternative protein sources like mushrooms and seaweed. These seemingly minor adjustments can significantly contribute to a more eco-friendly diet.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Rethinking Protein Sources',
                  style: theme?.headlineMedium?.copyWith(fontSize: 17),
                ),
              ),
              Text(
                "Meat and seafood consumption have a significant environmental impact. Consider reducing your intake and explore sustainable options like bivalve shellfish. Additionally, mushrooms offer a nutritious meat substitute with a lower environmental footprint.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Embracing New Ingredients',
                  style: theme?.headlineMedium?.copyWith(fontSize: 17),
                ),
              ),
              Text(
                "Mushrooms and seaweed are versatile and nutritious, offering a unique culinary experience while being environmentally friendly. Explore how to incorporate them into your meals for added flavour, nutrients, and a boost to your sustainable diet.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Planning for Success',
                  style: theme?.headlineMedium?.copyWith(fontSize: 17),
                ),
              ),
              Text(
                "Meal planning is a valuable tool for sustainable eating. Planning meals around seasonal and local produce can minimise food waste and support a plant-based diet. Food preservation techniques like freezing, canning, or pickling can further reduce reliance on packaged foods.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Every Choice Counts',
                  style: theme?.headlineMedium?.copyWith(fontSize: 17),
                ),
              ),
              Text(
                "Remember, sustainable eating is a journey and every choice matters. From selecting low-impact foods to opting for eco-friendly packaging, your decisions contribute to a global shift towards environmentally conscious food consumption.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Examples of Sustainable Foods',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Embracing a sustainable diet doesn’t mean sacrificing flavour or variety. This section dives into some delicious and eco-friendly options you can readily incorporate into your meals:\n\n. Grass-fed Beef and Lamb: Compared to grain-fed options, grass-fed meat boasts a lower environmental footprint due to the animals’ natural diets. Additionally, it may contain higher levels of omega-3 fatty acids and vitamins, making it a potentially healthier choice. Eating grass-fed meat supports sustainable farming practices and contributes to a climate-friendly diet.\n. Bivalve Shellfish: Clams, oysters, and mussels are sustainable seafood champions. Their low energy requirements for farming minimise their environmental impact. They also play a vital role in improving water quality by filtering algae and contaminants. Bonus: these shellfish are nutritional powerhouses, rich in protein and essential minerals like zinc and iron.\n. Local Produce: When it comes to sustainability, think local! Choosing fruits and vegetables grown in your region reduces transportation emissions associated with long-distance travel. This benefits the environment and ensures fresh, seasonal produce at its peak flavour and nutritional value. By supporting local farmers, you’re actively contributing to a more resilient food system.\n. Seaweed: Don’t underestimate the power of this ocean superfood! Seaweed requires minimal resources to grow without land, fertilisers, or pesticides. Packed with essential minerals like iodine and iron, it enhances a plant-based diet. Seaweed farming even benefits the environment by helping reduce ocean acidification and providing habitat for marine life. From using nori sheets for sushi to adding dried kelp to soups and stews, explore the versatility of seaweed and discover how it can elevate the taste and nutritional value of your meals.\n\nThese are just a few examples to get you started. As you delve deeper into sustainable eating, you’ll discover a world of delicious and eco-conscious options waiting to be explored. Remember, every bite counts! By making informed choices about your diet, you can contribute to a healthier planet without sacrificing a delicious morsel.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'A Sustainable Future on Your Plate',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Sustainable eating isn’t just a fad; it’s a powerful movement that can transform our food system and safeguard our planet for future generations. This comprehensive guide has equipped you with the knowledge and practical tools to navigate this exciting journey. Remember, change starts with a single bite.\n\nBy incorporating plant-based options, prioritising local and seasonal produce, minimising food waste, and supporting sustainable farming practices, you’re not just nourishing your body but actively shaping a healthier future for our planet.\n\nEmbrace the adventure of exploring new ingredients, discovering local farms, and experimenting with delicious plant-based recipes. Share your sustainable food journey with friends and family, inspiring them to join the movement. Together, we can cultivate a more sustainable food system, bite by delicious bite.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
