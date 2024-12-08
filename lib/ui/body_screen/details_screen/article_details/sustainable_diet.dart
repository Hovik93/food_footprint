import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';

class SustainableDiet extends StatefulWidget {
  const SustainableDiet({super.key});

  @override
  State<SustainableDiet> createState() => _SustainableDietState();
}

class _SustainableDietState extends State<SustainableDiet> {
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
                  'Sustainable Diet: How to Reduce the Carbon Footprint of Your Food',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "As the world’s consciousness of the climate crisis and its consequences rises, people are reinventing their lifestyles to lower their impact on our fragile planet; and a great way to do it is by adopting a more sustainable diet. However, attempting to shop in the 21st century, with a conscience to make decisions that will reduce the impact of one’s groceries on the environment, has become a minefield. This article aims to provide a clear guide for consumers to understand what factors determine the carbon footprint of specific food and to distinguish greenwashing from authentic and sustainable food products.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/article/article5.png",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '1. Packaging',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Packaging is one of the easiest features to use to compare the sustainability of food products and thus adopt a more sustainable diet. The best food packaging types for the environment would be made from biodegradable materials or, if that is not an option, recyclable materials would also be a great alternative.\n\nExamples of biodegradable materials include cardboard and some bioplastics that are made entirely from biological sources. Reusable or recyclable materials may include metals and some hard plastics, but this will depend on the local policies and initiatives, so it is important for consumers to be aware of their local recycling guidelines. Single-use plastics tend to be the worst packaging type as they are produced from fossil fuels and can take up to 1,000 years to decompose.\n\nIt is also important to consider choosing products that contain reduced amounts of packaging as all packaging types still require the extraction of natural resources, which inevitably puts a strain on the environment.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '2. Transport',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Understanding the transport required to get food products to supermarket shelves can also sometimes be a relatively simple factor to use when comparing products. In many countries, the place of origin of a food item is stated on the packaging, particularly when it comes to fresh fruits and vegetables. Furthermore, some countries such as Australia have even gone a step further to indicate the fraction of the ingredients in a food product that are sourced within the country.\n\nKnowing the place of origin of a product can help determine the food miles associated with it and this can act as a proxy for the carbon emissions associated with the product, given that foods that have travelled further will generally have a higher carbon footprint. However, it is also important to consider the mode of transport used to deliver the product. For example, planes release 50 times more emissions that cargo ships. Unfortunately, this type of information can only occasionally be found on the packaging label.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '3. Land and Water Use',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "The extensive deforestation of land and high water consumption that is used for agriculture are both drivers of the ecological and climate crises and are consequently very important factors that should be taken into account when deciding what foods should be included in a sustainable diet. However, without prior knowledge of the production processes of food products, it can be difficult to know the extent of the negative effects of their land and water use.\n\nMedia coverage has highlighted some of the problems associated with certain food items, such as the close link between palm oil and tropical deforestation, or the ties between the meat and dairy industry with high land and water use. To verify and build on this existing knowledge, consumers can make simple internet searches that can help distinguish the varying environmental impacts food products can have. Infographics showing land use and water use footprints can be useful to allow quick comparisons between products.\n\nWhilst researching plant products, it is also important to consider whether the crops were grown in a rainfed or irrigation system. This can vary exponentially between different food types. For example, in Spain, only 5% of legumes are irrigated compared to 93% of citrus fruit trees. Irrigation farming is often associated with unsustainable water consumption – especially if it uses groundwater reserves – and can exacerbate already scarce water resources.\n\nWhen trying to follow a sustainable diet, it can be useful to look out for certification schemes that promote the sustainable use of land and water that has been used to produce food. Examples of such schemes include Rainforest Alliance and RSPO sustainable palm oil.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '4. Scale of Production',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "There are many environmental problems associated with food products that come as a direct result of the scale and style of the farming system used, another crucial factor to consider when shifting to a more sustainable diet.\n\nWhile factory farming only began in the last century, it is now used to farm almost 99% of the animals in the US and similar figures can be seen in other developed nations. Aside from the animal welfare issues related to factory farming, this system requires large amounts of animal feed, which is often imported and is one of the main drivers of deforestation in the Amazon rainforest. Another problem associated with this type of farming is pollution: some factory farms have an extremely high density of animals that can result in spills of nutrient-rich excrement which leaks into the surroundings causing the dramatic degradation of ecosystems. The spread of disease is also associated with animals kept in high stocking densities. An example is bird flu, a major threat to farmers in many parts of the world. When diseases like this spread to wild animals, they may lead to widespread population collapses.\n\nAnother widely used farming system that is associated with negative environmental consequences is crop monocultures. Monoculture systems typically require large quantities of pesticides to prevent the spread of pests and diseases and often only produce high yields when honeybees are imported to assist with pollination. Native insect pollinators often become malnourished, killed by the chemicals, or outcompeted by honeybees, all of which result in large population losses. Monocultures are also linked to pollution, the erosion of topsoil, and losses in soil quality due to the lack of plant diversity.\n\nWhile it can be difficult to avoid food products produced by factory farms or crop monocultures, sustainable options do exist. These alternatives include consuming regeneratively farmed animal products or purchasing crops grown in permaculture systems that use intercropping to increase species diversity. Foods produced using these systems may be found at farmer’s markets and, although they are sometimes slightly more expensive, they are often more nutritional and have a lower environmental impact.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '5. Pollution',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "Pollution problems in factory farms and monocultures are often linked to the leakage of animal waste products and their high use of pesticides and artificial fertilisers. A popular alternative farming method that minimises these issues is organic farming, which means growing crops and rearing animals without the use of chemicals, and allowing livestock to feed outdoors in pastures.\n\nOrganic products do usually require larger areas of land to be cultivated and this can still contribute to polluting the environment, this, for example, occurs if natural fertilisers applied to crops are leached into waterways or if grazing animals excrete into rivers. Despite this, studies have suggested that organic farming can reduce the leaching of nutrients by around 40% compared to conventional farming.\n\nOrganic products can be identified in almost all supermarkets with a certification label and some supermarkets have designated sections that contain only organic products. Another indicator to look out for is fruit and vegetable stickers. If they contain a five-digit code starting with a nine (e.g. 94053), it means that they were organically farmed.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '6. Greenhouse Gas Emissions',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "It is estimated that agriculture is responsible for 24% of global anthropogenic greenhouse gas emissions. For this reason, it is crucial to study and implement more sustainable alternatives to traditional farming methods. The carbon footprint of an individual food product varies greatly depending on the production systems and supply chains used. Unfortunately, it is often challenging to understand the footprint of different food brands.\n\nCarbon Trust is an organisation that works with food companies to enable them to advertise information about the carbon footprint of their products. However, many brands remain sceptical about disclosing their operations’ real emissions.\n\nFollowing a diet with a lower carbon footprint requires the high consumption of nutritious foods, such as those rich in protein and micronutrients, but that have minimal carbon footprint. This means that eating large quantities of foods with a low nutritional content such as lettuce would result in a higher emission diet compared to eating more nutritionally rich foods such as peas or nuts.\n\nIn general, animal products also tend to generate extremely high quantities of emissions despite them often being high in protein and calories as they have feed-to-food conversion rates of about 15% regarding both calories and protein. This additional stage of production, compared with eating plants directly, means that large areas of land are required to provide the food needed to rear livestock. Furthermore, animal agriculture alone contributes around 65% and 37% of the total global emissions of nitrous oxide and methane respectively, both of which are potent greenhouse gases.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Sustainable Diet: Final Considerations',
                  style: theme?.headlineMedium,
                ),
              ),
              Text(
                "A myriad of considerations can be assessed when wanting to shift to a more sustainable diet, with environmental factors only making up some of these. The social and economic benefits of purchasing Fairtrade products or the controversy of genetically modified foods are just a couple of examples of other aspects of groceries that can make deciding what to buy a dilemma.\n\nTo add to the complexity, more environmentally sustainable products tend to come with higher price tags, making them out of reach for many. One of the most effective ways anyone can reduce the environmental impact of the food they buy is to minimise waste. Currently, the average per capita waste of consumer-level food globally is 121 kg per year.\n\nAnother great option is to buy groceries at local farmers’ markets due to the traceability and transparency of the products sold there. Producing homegrown food in a back garden or allotment is also an amazing way to minimise the environmental impact of food production and thus follow a more sustainable diet. Lastly, researching food products before buying them is also useful.\n\nFood product supply chains must become more transparent in the future and labels require more environmental information to allow consumers to make more informed decisions that limit the deterioration of the environment.",
                style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
