List<Map<String, dynamic>> alternatives = [
  {
    "Meat and Poultry": {
      "Beef Alternatives": {
        "image": "assets/product/beef.png",
        "items": [
          {
            "name": "Lentils",
            "isFavorite": false,
            "description":
                "High in protein, low carbon footprint (0.9 kg CO₂ per kg).",
          },
          {
            "name": "Beans",
            "isFavorite": false,
            "description":
                "Rich in protein and fiber, minimal environmental impact."
          },
          {
            "name": "Mushrooms",
            "isFavorite": false,
            "description":
                "Texture and taste that work well in meat-based recipes."
          },
        ],
      },
      "Pork Alternatives": {
        "image": "assets/product/pork.png",
        "items": [
          {
            "name": "Chickpeas",
            "isFavorite": false,
            "description":
                "Protein-rich, with a carbon footprint of only 0.8 kg CO₂ per kg."
          },
          {
            "name": "Tofu",
            "isFavorite": false,
            "description":
                "Made from soybeans, high in protein and low-impact (2 kg CO₂ per kg)."
          },
          {
            "name": "Jackfruit",
            "isFavorite": false,
            "description":
                "Ideal for pulled-pork style dishes with low environmental impact."
          }
        ]
      },
      "Chicken Alternatives": {
        "image": "assets/product/chicken.png",
        "items": [
          {
            "name": "Tempeh",
            "isFavorite": false,
            "description":
                "Fermented soybean product, high in protein and calcium."
          },
          {
            "name": "Cauliflower",
            "isFavorite": false,
            "description":
                "Versatile, mild flavor, with minimal impact on resources."
          },
          {
            "name": "Seitan",
            "isFavorite": false,
            "description":
                "Wheat-based, high-protein, low-carbon footprint (1.6 kg CO₂ per kg)."
          }
        ]
      }
    },
  },
  {
    "Seafood": {
      "Salmon Alternatives": {
        "image": "assets/product/wild_caught_salmon.png",
        "items": [
          {
            "name": "Herring",
            "isFavorite": false,
            "description":
                "Sustainable, omega-3 rich, and lower in environmental impact."
          },
          {
            "name": "Farmed Mussels",
            "isFavorite": false,
            "description":
                "Filter feeders, helping to clean oceans. Minimal footprint."
          },
          {
            "name": "Trout",
            "isFavorite": false,
            "description": "Similar texture to salmon, usually locally farmed."
          }
        ]
      },
      "Shrimp Alternatives": {
        "image": "assets/product/farmed_shrimp.png",
        "items": [
          {
            "name": "Mussels",
            "isFavorite": false,
            "description":
                "Sustainably farmed, filter water, and lower carbon impact."
          },
          {
            "name": "Oysters",
            "isFavorite": false,
            "description":
                "Minimal carbon footprint and help improve water quality."
          },
          {
            "name": "Squid",
            "isFavorite": false,
            "description": "Fast-growing species with less impact than shrimp."
          }
        ]
      }
    },
  },
  {
    "Dairy Products": {
      "Milk Alternatives": {
        "image": "assets/product/dairy_products.png",
        "items": [
          {
            "name": "Oat Milk",
            "isFavorite": false,
            "description":
                "Low water usage, minimal carbon footprint, good for local production."
          },
          {
            "name": "Almond Milk",
            "isFavorite": false,
            "description":
                "Sustainable if locally sourced, but water-intensive."
          },
          {
            "name": "Soy Milk",
            "isFavorite": false,
            "description": "High-protein, low-impact when sustainably grown."
          }
        ]
      },
      "Cheese Alternatives": {
        "image": "assets/product/hard_cheese.png",
        "items": [
          {
            "name": "Cashew Spread",
            "isFavorite": false,
            "description":
                "Creamy texture, plant-based, lower carbon footprint."
          },
          {
            "name": "Nutritional Yeast",
            "isFavorite": false,
            "description": "Savory flavor, adds depth to dishes without dairy."
          },
          {
            "name": "Tofu-Based Cheese",
            "isFavorite": false,
            "description":
                "Fermented, high-protein alternative with a mild taste."
          }
        ]
      },
      "Butter Alternatives": {
        "image": "assets/product/butter.png",
        "items": [
          {
            "name": "Olive Oil",
            "isFavorite": false,
            "description":
                "Lower carbon footprint, sustainable in Mediterranean regions."
          },
          {
            "name": "Coconut Oil",
            "isFavorite": false,
            "description":
                "Sustainable when sourced responsibly, but high import impact."
          },
          {
            "name": "Avocado Oil",
            "isFavorite": false,
            "description": "Environmentally friendly if locally grown."
          }
        ]
      }
    },
  },
  {
    "Grains and Pulses": {
      "White Rice Alternatives": {
        "image": "assets/product/white_rice.png",
        "items": [
          {
            "name": "Quinoa",
            "isFavorite": false,
            "description":
                "High-protein, adaptable to many recipes, low-impact crop."
          },
          {
            "name": "Buckwheat",
            "isFavorite": false,
            "description":
                "Minimal environmental impact, grows in various climates."
          },
          {
            "name": "Barley",
            "isFavorite": false,
            "description": "Low-water crop with fiber benefits."
          }
        ]
      },
      "Wheat Flour Alternatives": {
        "image": "assets/product/wheat_flour.png",
        "items": [
          {
            "name": "Chickpea Flour",
            "isFavorite": false,
            "description": "Protein-rich, versatile, lower carbon footprint."
          },
          {
            "name": "Oat Flour",
            "isFavorite": false,
            "description":
                "Low-impact when grown locally, nutritious and gluten-free."
          },
          {
            "name": "Millet Flour",
            "isFavorite": false,
            "description":
                "Drought-resistant crop with a low environmental footprint."
          }
        ]
      }
    },
  },
  {
    "Vegetables": {
      "Potato Alternatives": {
        "image": "assets/product/potatoes.png",
        "items": [
          {
            "name": "Sweet Potatoes",
            "isFavorite": false,
            "description":
                "High in vitamins, grows in similar climates with low impact."
          },
          {
            "name": "Carrots",
            "isFavorite": false,
            "description": "Similar texture when cooked, low water needs."
          },
          {
            "name": "Turnips",
            "isFavorite": false,
            "description":
                "Nutritious, versatile, and sustainable root vegetable."
          }
        ]
      },
      "Tomato Alternatives": {
        "image": "assets/product/tomatoes.png",
        "items": [
          {
            "name": "Bell Peppers",
            "isFavorite": false,
            "description":
                "Suitable for raw or cooked dishes, especially in season."
          },
          {
            "name": "Zucchini",
            "isFavorite": false,
            "description":
                "Versatile, lower environmental impact if grown locally."
          },
          {
            "name": "Pumpkin",
            "isFavorite": false,
            "description":
                "Works well in cooked dishes, especially when in season."
          }
        ]
      },
      "Broccoli Alternatives": {
        "image": "assets/product/broccoli.png",
        "items": [
          {
            "name": "Kale",
            "isFavorite": false,
            "description": "Nutritious, cold-hardy, and low-impact crop."
          },
          {
            "name": "Cauliflower",
            "isFavorite": false,
            "description":
                "Similar cooking methods and flavor profile, minimal impact."
          },
          {
            "name": "Swiss Chard",
            "isFavorite": false,
            "description": "Grows in diverse climates, rich in nutrients."
          }
        ]
      }
    },
  },
  {
    "Fruits": {
      "Banana Alternatives": {
        "image": "assets/product/bananas.png",
        "items": [
          {
            "name": "Apples",
            "isFavorite": false,
            "description":
                "Local options available in many regions, lower carbon footprint."
          },
          {
            "name": "Pears",
            "isFavorite": false,
            "description":
                "Locally grown, similar texture, and versatile in dishes."
          },
          {
            "name": "Berries",
            "isFavorite": false,
            "description":
                "Lower carbon footprint if locally sourced, nutrient-dense."
          }
        ]
      },
      "Avocado Alternatives": {
        "image": "assets/product/avocado.png",
        "items": [
          {
            "name": "Hummus",
            "isFavorite": false,
            "description":
                "Creamy, high in healthy fats and protein, low environmental cost."
          },
          {
            "name": "Sunflower Seeds",
            "isFavorite": false,
            "description": "Local options with similar nutrient profiles."
          },
          {
            "name": "Pumpkin Seeds",
            "isFavorite": false,
            "description":
                "Nutrient-rich, sustainable, and great for similar textures."
          }
        ]
      },
      "Pineapple Alternatives": {
        "image": "assets/product/apples.png",
        "items": [
          {
            "name": "Peaches",
            "isFavorite": false,
            "description":
                "Similar flavor profile, especially if sourced locally."
          },
          {
            "name": "Mango",
            "isFavorite": false,
            "description": "Sweet, high in vitamins, choose regional options."
          },
          {
            "name": "Papaya",
            "isFavorite": false,
            "description": "Low-impact fruit in tropical regions."
          }
        ]
      }
    },
  },
  {
    "Nuts and Seeds": {
      "Almond Alternatives": {
        "image": "assets/product/almonds.png",
        "items": [
          {
            "name": "Walnuts",
            "isFavorite": false,
            "description":
                "Locally grown in many areas, similar nutrient profile."
          },
          {
            "name": "Sunflower Seeds",
            "isFavorite": false,
            "description": "Low water requirements, high in protein and fats."
          },
          {
            "name": "Hazelnuts",
            "isFavorite": false,
            "description": "Good alternative with lower water needs."
          }
        ]
      },
      "Cashew Alternatives": {
        "image": "assets/product/cashews.png",
        "items": [
          {
            "name": "Pumpkin Seeds",
            "isFavorite": false,
            "description": "Lower impact and highly nutritious."
          },
          {
            "name": "Peanuts",
            "isFavorite": false,
            "description": "Low water needs, high in protein and healthy fats."
          },
          {
            "name": "Hemp Seeds",
            "isFavorite": false,
            "description": "Eco-friendly with a high protein content."
          }
        ]
      },
      "Pistachio Alternatives": {
        "image": "assets/product/pumpkin_seeds.png",
        "items": [
          {
            "name": "Sunflower Seeds",
            "isFavorite": false,
            "description": "Similar crunch, less water-intensive."
          },
          {
            "name": "Pumpkin Seeds",
            "isFavorite": false,
            "description": "High in iron and magnesium."
          },
          {
            "name": "Chia Seeds",
            "isFavorite": false,
            "description": "Minimal environmental footprint, high in omega-3."
          }
        ]
      }
    },
    "Processed Foods": {
      "White Bread Alternatives": {
        "image": "assets/product/white_bread.png",
        "items": [
          {
            "name": "Whole Grain Bread",
            "isFavorite": false,
            "description": "Nutritionally dense, often lower carbon impact."
          },
          {
            "name": "Sourdough Bread",
            "isFavorite": false,
            "description":
                "Fermented, nutritious, and may use less processed flour."
          },
          {
            "name": "Rye Bread",
            "isFavorite": false,
            "description": "Less water-intensive grain and nutrient-dense."
          }
        ]
      },
      "Potato Chips Alternatives": {
        "image": "assets/product/potato_chips.png",
        "items": [
          {
            "name": "Homemade Vegetable Chips",
            "isFavorite": false,
            "description": "Use locally sourced veggies for reduced impact."
          },
          {
            "name": "Kale Chips",
            "isFavorite": false,
            "description": "Nutrient-rich and lower environmental impact."
          },
          {
            "name": "Baked Sweet Potato Slices",
            "isFavorite": false,
            "description": "Sustainable alternative with fiber benefits."
          }
        ]
      },
      "Instant Ramen Alternatives": {
        "image": "assets/product/instant_ramen.png",
        "items": [
          {
            "name": "Fresh Noodles",
            "isFavorite": false,
            "description": "Made from low-impact grains, without preservatives."
          },
          {
            "name": "Whole Grain Pasta",
            "isFavorite": false,
            "description": "More sustainable option than processed ramen."
          },
          {
            "name": "Vegetable Soup",
            "isFavorite": false,
            "description": "Locally sourced vegetables, low carbon footprint."
          }
        ]
      }
    },
    "Oils and Fats": {
      "Olive Oil Alternatives": {
        "image": "assets/product/olive_oil.png",
        "items": [
          {
            "name": "Rapeseed Oil",
            "isFavorite": false,
            "description":
                "Sustainable option in certain regions, with a low impact."
          },
          {
            "name": "Sunflower Oil",
            "isFavorite": false,
            "description": "Widely available and often less resource-intensive."
          },
          {
            "name": "Peanut Oil",
            "isFavorite": false,
            "description": "Lower impact, especially when grown locally."
          }
        ]
      },
      "Coconut Oil Alternatives": {
        "image": "assets/product/coconut_oil.png",
        "items": [
          {
            "name": "Sunflower Oil",
            "isFavorite": false,
            "description":
                "Widely available, lower environmental impact than coconut."
          },
          {
            "name": "Rapeseed Oil",
            "isFavorite": false,
            "description": "More sustainable option in temperate regions."
          },
          {
            "name": "Avocado Oil",
            "isFavorite": false,
            "description": "Eco-friendly when sourced locally."
          }
        ]
      },
      "Palm Oil Alternatives": {
        "image": "assets/product/palm_oil.png",
        "items": [
          {
            "name": "Shea Butter",
            "isFavorite": false,
            "description":
                "Sustainably sourced, often used in cooking and cosmetics."
          },
          {
            "name": "Cocoa Butter",
            "isFavorite": false,
            "description": "Eco-friendly when ethically sourced."
          },
          {
            "name": "Sunflower Oil",
            "isFavorite": false,
            "description":
                "Simple alternative with a much lower carbon footprint."
          }
        ]
      }
    }
  }
];
