//
//  Recipe.swift
//  Cookcademy
//
//  Created by Alina Vasina on 7/26/25.
//
import Foundation

struct Recipe{
    var mainInformation: MainInformation
    var ingredients: [Ingredients]
    var directions: [Direction]
}

struct MainInformation{
    var name: String
    var description: String
    var author: String
    var category: Category
    
    enum Category: String, CaseIterable{
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
}


struct Ingredients{
    var name: String
    var quantity: Double
    var unit: Unit
    
    var description: String {
        let formattedQuantity = String(format: "%g", quantity)
        switch unit {
          case .none:
            let formattedName = quantity == 1 ? name : "\(name)s"
            return "\(formattedQuantity) \(formattedName)"
          default:
            if quantity == 1 {
              return "1 \(unit.singularName) \(name)"
            } else {
              return "\(formattedQuantity) \(unit.rawValue) \(name)"
            }
        }
      }
    
    enum Unit: String, CaseIterable {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tbs = "Tablespoons"
        case tsp = "Teaspoons"
        case none = "No units"
        
        var singularName: String { String(rawValue.dropLast()) }
  }
}

struct Direction{
    var description: String
    var isOptional: Bool
}

// Struct for possibilities to change recipies
//                   COPIED
//-------------------------------------------
/*struct Recipe {
  var mainInformation: MainInformation
  var ingredients: [Ingredients]
  var directions: [Direction]
  
  init(mainInformation: MainInformation, ingredients:[Ingredients], directions:[Direction]) {
    self.mainInformation = mainInformation
    self.ingredients = ingredients
    self.directions = directions
  }
  
  init() {
    self.init(mainInformation: MainInformation(name: "", description: "", author: "", category: .breakfast),
              ingredients: [],
              directions: [])
  }
}*/



// Extension with existed recipies from lesson
//                   COPIED
//-------------------------------------------

/*extension Recipe {
  static let testRecipes: [Recipe] = [
    Recipe(mainInformation: MainInformation(name: "Dad's Mashed Potatoes",
                                            description: "Buttery salty mashed potatoes!",
                                            author: "Josh",
                                            category: .dinner),
           ingredients: [
            Ingredients(name: "Potatoes", quantity: 454, unit: .g),
            Ingredients(name: "Butter", quantity: 1, unit: .tbs),
            Ingredients(name: "Milk", quantity: 0.5, unit: .cups),
            Ingredients(name: "Salt", quantity: 2, unit: .tsp)
           ],
           directions:  [
            Direction(description: "Put peeled potatoes in water and bring to boil ~15 min (once you can cut them easily", isOptional: false),
            Direction(description: "In the meantime, Soften the butter by heading in a microwave for 30 seconds", isOptional: false),
            Direction(description: "Drain the now soft potatoes", isOptional: false),
            Direction(description: "Mix vigorously with milk, salt, and butter", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Beet and Apple Salad",
                                            description: "Light and refreshing summer salad made of beets, apples and fresh mint",
                                            author: "Deb Szajngarten",
                                            category: .lunch),
           ingredients: [
            Ingredients(name: "Large beets chopped into a large dice", quantity: 3, unit: .none),
            Ingredients(name: "Large apples chopped into a large dice", quantity: 2, unit: .none),
            Ingredients(name: "Lemon zest", quantity: 0.5, unit: .tbs),
            Ingredients(name: "Lemon juice", quantity: 1.5, unit: .tbs),
            Ingredients(name: "Olive Oil", quantity: 1, unit: .tsp),
            Ingredients(name: "Salt and Pepper to taste", quantity: 1, unit: .none)
           ],
           directions:  [
            Direction(description: "Cook the beets", isOptional: false),
            Direction(description: "Sous vide the beets - To accomplish this, add beets to food safe plastic storage bags with apples, tsp of course stal and teaspoon of ground black pepper", isOptional: true),
            Direction(description: "Then vacuum seal the bag of beets and submerge into 185F water until tender; if no vacuum seal, weigh them down so they submerge", isOptional: true),
            Direction(description: "Alternately, you can steam the beets until tender or roast them in a 400F oven until tender", isOptional: false),
            Direction(description: "Once cooked, the skins will come off quite easily (gloves are preferred)", isOptional: false),
            Direction(description: "Wait until cooled completely, then cut beets into a medium dice", isOptional: false),
            Direction(description: "Peel and medium dice the apples", isOptional: false),
            Direction(description: "Chiffonade the mint", isOptional: false),
            Direction(description: "Combine all ingredients with lemon juice and olive oil and serve", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Braised Beef Brisket",
                                            description: "Slow cooked brisket in a savory braise that makes an amazing gravy.",
                                            author: "Deb Szajngarten",
                                            category: .dinner),
           ingredients: [
            Ingredients(name: "Brisket", quantity: 1815, unit: .g),
            Ingredients(name: "Large red onion", quantity: 1, unit: .none),
            Ingredients(name: "Garlic, minced", quantity: 6, unit: .none),
            Ingredients(name: "Large Carrot", quantity: 1, unit: .none),
            Ingredients(name: "Parsnip", quantity: 1, unit: .none),
            Ingredients(name: "Stalks Celery", quantity: 3, unit: .none),
            Ingredients(name: "Caul, Duck, or Chicken Fat", quantity: 3, unit: .tbs),
            Ingredients(name: "Bay Leaves", quantity: 2, unit: .none),
            Ingredients(name: "Apple Cider Vinegar", quantity: 0.33, unit: .cups),
            Ingredients(name: "Red Wine", quantity: 1, unit: .cups),
            Ingredients(name: "Jar/Can of Tomato Paste", quantity: 1, unit: .none),
            Ingredients(name: "Spoonful of Honey", quantity: 1, unit: .none),
            Ingredients(name: "Chicken Stock", quantity: 30, unit: .oz),
           ],
           directions:  [
            Direction(description: "In a small bowl, combine the honey, tomato paste and wine, and mix into paste", isOptional: false),
            Direction(description: "In an oval dutch oven, melt the fat over a medium to high heat.", isOptional: false),
            Direction(description: "Sear the brisket on both side then remove the heat", isOptional: false),
            Direction(description: "Add a bit more fat or vegetable oil and sear the vegetables until the onions become translucent", isOptional: false),
            Direction(description: "Add the wine mixture, return the beef to the pot, add the chicken stock until it come 1/2 way up the beef", isOptional: false),
            Direction(description: "Close the lid and bake at 250 until fork tender (4-6 hrs)", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Best Brownies Ever",
                                            description: "Five simple ingredients make these brownies easy to make and delicious to consume!",
                                            author: "Pam Broda",
                                            category: .dessert),
           ingredients: [
            Ingredients(name: "Condensed Milk", quantity: 14, unit: .oz),
            Ingredients(name: "Crushed Graham Crackers", quantity: 2.5, unit: .cups),
            Ingredients(name: "Bag of Chocolate Chips (Semi-Sweet)", quantity: 12, unit: .oz),
            Ingredients(name: "Vanilla Extract", quantity: 1, unit: .tsp),
            Ingredients(name: "Milk", quantity: 2, unit: .tbs)
           ],
           directions:  [
            Direction(description: "Preheat oven to 350 degrees F", isOptional: false),
            Direction(description: "Crush graham cracker in large mixing bowl with clean hands, not in food processor! (Make sure pieces are chunky)", isOptional: false),
            Direction(description: "Smei-melt the chocolate chips, keep some in tact", isOptional: false),
            Direction(description: "Stir in rest of ingredients (vanilla, milk)", isOptional: false),
            Direction(description: "Grease an 8x8 in. pan with butter and pour in brownie mix", isOptional: false),
            Direction(description: "Bake for 23-25min - DO NOT OVERBAKE", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Omelet and Greens",
                                            description: "Quick, crafty omelet with greens!",
                                            author: "Taylor Murray",
                                            category: .breakfast),
           ingredients: [
            Ingredients(name: "Olive Oil", quantity: 3, unit: .tbs),
            Ingredients(name: "Onion, finely chopped", quantity: 1, unit: .none),
            Ingredients(name: "Large Eggs", quantity: 8, unit: .none),
            Ingredients(name: "Kosher Salt", quantity: 1, unit: .none),
            Ingredients(name: "Unsalted Butter", quantity: 2, unit: .tbs),
            Ingredients(name: "Parmesan, finely grated", quantity: 1, unit: .oz),
            Ingredients(name: "Fresh Lemon Juice", quantity: 2, unit: .tbs),
            Ingredients(name: "Baby Spinach", quantity: 3, unit: .oz)
           ],
           directions:  [
            Direction(description: "Heat 1 tbsp olive oil in large non stick skillet on medium heat", isOptional: false),
            Direction(description: "Add onions until tender, about 6 minutes then transfer to a small bowl", isOptional: false),
            Direction(description: "In a different bowl, whisk eggs, 1 tbs water, and 0.5 tsp salt", isOptional: false),
            Direction(description: "Return skillet to medium heat and butter", isOptional: false),
            Direction(description: "Add eggs, constantly stirring until eggs partially set", isOptional: false),
            Direction(description: "Turn heat to low and cover", isOptional: false),
            Direction(description: "Continue cooking till eggs are just set, 4-5min", isOptional: false),
            Direction(description: "Top with parmesan and onions, fold in half", isOptional: true),
            Direction(description: "In a medium bowl, whisk lemon juice, 2 tbs olive oil, toss with spinach and serve with omelet", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Vegetarian Chili",
                                            description: "Warm, comforting, and filling vegetarian chili",
                                            author: "Makeinze Gore",
                                            category: .lunch),
           ingredients: [
            Ingredients(name: "Onions, Chopped", quantity: 1, unit: .none),
            Ingredients(name: "Red Bell Pepper, Chopped", quantity: 1, unit: .none),
            Ingredients(name: "Carrots, peeled and finely chopped", quantity: 1, unit: .none),
            Ingredients(name: "Cloves Garlic, Minced", quantity: 3, unit: .none),
            Ingredients(name: "Jalapeno, finely chopped", quantity: 1, unit: .none),
            Ingredients(name: "Tomato Paste", quantity: 2, unit: .tbs),
            Ingredients(name: "Can of Pinto Beans, Drained and Rinsed", quantity: 1, unit: .none),
            Ingredients(name: "Can of Black Beans, Drained and Rinsed", quantity: 1, unit: .none),
            Ingredients(name: "Can of Kidney Beans, Drained and Rinsed", quantity: 1, unit: .none),
            Ingredients(name: "Can of Fire Roasted Tomatoes", quantity: 1, unit: .none),
            Ingredients(name: "Vegetable Broth", quantity: 3, unit: .cups),
            Ingredients(name: "Chili Powder", quantity: 2, unit: .tbs),
            Ingredients(name: "Cumin", quantity: 1, unit: .tbs),
            Ingredients(name: "Oregano", quantity: 2, unit: .tsp),
            Ingredients(name: "Kosher Salt", quantity: 1, unit: .none),
            Ingredients(name: "Ground Black Pepper", quantity: 1, unit: .none),
            Ingredients(name: "Shredded Cheddar", quantity: 1, unit: .none),
            Ingredients(name: "Sour Cream", quantity: 1, unit: .none),
            Ingredients(name: "Cilantro", quantity: 1, unit: .none)
           ],
           directions:  [
            Direction(description: "In a large pot over medium heat, heat olive oil then add onions, bell peppers and carrots", isOptional: false),
            Direction(description: "Saute until soft - about 5 min", isOptional: false),
            Direction(description: "Add garlic and jalapeno and cool until fragrant - about 1 min", isOptional: false),
            Direction(description: "Add tomato paste and stir to coat vegetables", isOptional: false),
            Direction(description: "Add tomatoes, beans, broth, and seasonings", isOptional: false),
            Direction(description: "Season with salt and pepper to desire", isOptional: false),
            Direction(description: "Bring to a boil then reduce heat and let simmer for 30min", isOptional: false),
            Direction(description: "Serve with cheese, sour cream, and cilantro", isOptional: true)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Classic Shrimp Scampi",
                                            description: "Simple, delicate shrimp bedded in a delicious set of pasta that will melt your tastebuds!",
                                            author: "Sarah Taller",
                                            category: .dinner),
           ingredients: [
            Ingredients(name: "Kosher Salt", quantity: 1, unit: .none),
            Ingredients(name: "Linguine", quantity: 12, unit: .oz),
            Ingredients(name: "Large shrimp, peeled", quantity: 20, unit: .oz),
            Ingredients(name: "Extra-virgin olive oil", quantity: 0.33, unit: .cups),
            Ingredients(name: "Cloves garlic, minced", quantity: 5, unit: .none),
            Ingredients(name: "Red pepper flakes", quantity: 0.5, unit: .tsp),
            Ingredients(name: "White Wine", quantity: 0.33, unit: .cups),
            Ingredients(name: "Lemons Squeezed + Wedges", quantity: 0.5, unit: .none),
            Ingredients(name: "Unsalted butter, cut into pieces", quantity: 4, unit: .tbs),
            Ingredients(name: "Finely Chopped Fresh Parsley", quantity: 0.25, unit: .cups)
           ],
           directions:  [
            Direction(description: "Bring large pot of salt water to a boil", isOptional: false),
            Direction(description: "Add the linguini and cook as label directs", isOptional: false),
            Direction(description: "Reserve 1 cup cooking water, then drain", isOptional: false),
            Direction(description: "Season shrimp with salt", isOptional: false),
            Direction(description: "Heat olive oil in large skillet over medium-heat", isOptional: false),
            Direction(description: "Add garlic and red pepper flakes and cook until garlic is golden, 30sec-1min", isOptional: false),
            Direction(description: "Add shrimp and cook, stirring occasionally, until pink and just cooked through: 1-2min per side", isOptional: false),
            Direction(description: "Remove shrimp from plate", isOptional: false),
            Direction(description: "Add the wine and lemon juice to skillet and simmer slightly reduced, 2 min", isOptional: false),
            Direction(description: "Return shrimp and any juices from place to skillet alongside linguine, butter, and a 0.5 cup of cooking water", isOptional: false),
            Direction(description: "Continue to cook, tossing, until the butter is melted and the shrimp is hot, about 2 min", isOptional: false),
            Direction(description: "Add water as needed", isOptional: false),
            Direction(description: "Season with salt, stir in parsley", isOptional: false),
            Direction(description: "Serve with lemon wedges!", isOptional: true)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Chocolate Billionaires",
                                            description: "Chocolate and caramel candies that are to die for!",
                                            author: "Jack B",
                                            category: .dessert),
           ingredients: [
            Ingredients(name: "1 package of caramels", quantity: 14, unit: .oz),
            Ingredients(name: "Water", quantity: 3, unit: .tbs),
            Ingredients(name: "Chopped Pecans", quantity: 1.25, unit: .cups),
            Ingredients(name: "Rice Krispies", quantity: 1, unit: .cups),
            Ingredients(name: "Milk Chocolate Chips", quantity: 3, unit: .cups),
            Ingredients(name: "Shortening", quantity: 1.25, unit: .tsp)
           ],
           directions:  [
            Direction(description: "Line 2 baking sheets with waxed paper", isOptional: false),
            Direction(description: "Grease paper and set aside", isOptional: false),
            Direction(description: "In a large heavy saucepan, combine caramel and water", isOptional: false),
            Direction(description: "Cook and stir over low heat until smooth", isOptional: false),
            Direction(description: "Stir in pecans and cereal until coated", isOptional: false),
            Direction(description: "Drops teaspoons onto prepared pans", isOptional: false),
            Direction(description: "Refrigerate for 10 mins or until firm", isOptional: false),
            Direction(description: "Melt chocolate chips and shortening", isOptional: false),
            Direction(description: "Stir until smooth", isOptional: false),
            Direction(description: "Dip candy into chocolate, coating all sides", isOptional: false),
            Direction(description: "Allow excess to drip off", isOptional: false),
            Direction(description: "Place on prepared pans and refrigerate until set", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Mac & Cheese",
                                            description: "Macaroni & Cheese",
                                            author: "Travis B",
                                            category: .dinner),
           ingredients: [
            Ingredients(name: "Elbow Macaroni", quantity: 12, unit: .oz),
            Ingredients(name: "Butter, divided", quantity: 2, unit: .tbs),
            Ingredients(name: "Small onion, chopped", quantity: 1, unit: .none),
            Ingredients(name: "Milk, divided", quantity: 4, unit: .cups),
            Ingredients(name: "Flour", quantity: 0.33, unit: .cups),
            Ingredients(name: "Bay Leaves", quantity: 2, unit: .none),
            Ingredients(name: "Thyme", quantity: 0.5, unit: .tsp),
            Ingredients(name: "Pepper", quantity: 1, unit: .tsp),
            Ingredients(name: "Salt", quantity: 1, unit: .tsp),
            Ingredients(name: "Shredded Sharp Cheddar", quantity: 1, unit: .cups)
           ],
           directions:  [
            Direction(description: "Heat oven to 375. Lightly coat 13 x 9 baking dish with vegetable cooking spray", isOptional: false),
            Direction(description: "Start to cook pasta", isOptional: false),
            Direction(description: "Meanwhile, melt 1 tablespoon butter in a saucepan over medium heat. Add onion, and cook until softened, about 3 min.", isOptional: false),
            Direction(description: "Whisk together 1/2 cup milk and flour until smooth", isOptional: false),
            Direction(description: "Add milk texture to onion, then whisk in remaining 3.5 cups milk, bay leaves, thyme, salt, and pepper.", isOptional: false),
            Direction(description: "Cook over medium-low heat 10-12min, stirring occasionally, until slight thickened", isOptional: false),
            Direction(description: "With slotted spoon, remove bay leaves. Stir in cheese until melted", isOptional: false),
            Direction(description: "Drain pasta and stir into cheese mixture", isOptional: false),
            Direction(description: "Drain pasta and stir into cheese mixture. Pour into prepared dish and bake for 35 minutes, or until cheese is bubbly", isOptional: false),
            Direction(description: "Eat!", isOptional: true)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Veggie Soup",
                                            description: "Vegetable Soup",
                                            author: "Travis B",
                                            category: .dinner),
           ingredients: [
            Ingredients(name: "Yellow Onion, diced", quantity: 1, unit: .none),
            Ingredients(name: "Cloves Garlic, minced", quantity: 4, unit: .none),
            Ingredients(name: "Stock Celery, diced", quantity: 1, unit: .none),
            Ingredients(name: "Carrots, shredded", quantity: 1, unit: .cups),
            Ingredients(name: "Broccoli florets", quantity: 1, unit: .cups),
            Ingredients(name: "Zucchini, cubed", quantity: 1, unit: .none),
            Ingredients(name: "Spinach", quantity: 3, unit: .cups),
            Ingredients(name: "Potato skinned and cubed", quantity: 1, unit: .none),
            Ingredients(name: "Can of Kidney Beans", quantity: 1, unit: .none),
            Ingredients(name: "Box Vegetable Stock", quantity: 1, unit: .none),
            Ingredients(name: "Can Diced Tomatoes", quantity: 1, unit: .none)
           ],
           directions:  [
            Direction(description: "Cook onion and garlic on high heat until onion is translucent, about 5 min", isOptional: false),
            Direction(description: "Add celery, carrots, parsley, and cook for 5-7min", isOptional: false),
            Direction(description: "Add can diced tomatoes, vegetable stock, and potato. Bring to boil and let simmer for 45min", isOptional: false),
            Direction(description: "Add broccoli, zucchini, and kidney beans. Bring back to boil and then let simmer for 15 more min", isOptional: false),
            Direction(description: "Serve with spinach and parmesan cheese", isOptional: true)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "White Clam Sauce",
                                            description: "A simple recipe for quick comfort food",
                                            author: "Henry Minden",
                                            category: .dinner),
           ingredients: [
            Ingredients(name: "Cans of Clams", quantity: 4, unit: .none),
            Ingredients(name: "Cloves of Garlic", quantity: 8, unit: .none),
            Ingredients(name: "Onion", quantity: 1, unit: .none),
            Ingredients(name: "Salt and Pepper", quantity: 1, unit: .none),
            Ingredients(name: "White Wine", quantity: 2, unit: .tbs),
            Ingredients(name: "Butter", quantity: 4, unit: .tbs)
           ],
           directions:  [
            Direction(description: "Chop garlic and onions", isOptional: false),
            Direction(description: "Saute garlic and onions in olive oil", isOptional: false),
            Direction(description: "Add clams and 1/2 juice in cans", isOptional: false),
            Direction(description: "Add butter, wine, and salt pepper to taste", isOptional: false),
            Direction(description: "Simmer for 15min until sauce deduces 1/2", isOptional: false),
            Direction(description: "Serve over favorite pasta", isOptional: false)
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Granola Bowl",
                                            description: "A dense and delicious breakfast",
                                            author: "Ben",
                                            category: .breakfast),
           ingredients: [
            Ingredients(name: "Granola", quantity: 0.5, unit: .cups),
            Ingredients(name: "Banana", quantity: 1, unit: .none),
            Ingredients(name: "Peanut Butter", quantity: 2, unit: .tbs),
           ],
           directions:  [
            Direction(description: "Slice the banana", isOptional: false),
            Direction(description: "Combine all ingredients in a bowl", isOptional: false),
            Direction(description: "Add chocolate chips", isOptional: true),
           ]
    ),
    Recipe(mainInformation: MainInformation(name: "Banana Bread",
                                            description: "Easy to put together, and a family favorite!",
                                            author: "Lisbeth",
                                            category: .dessert),
           ingredients: [
            Ingredients(name: "Ripe bananas", quantity: 3, unit: .none),
            Ingredients(name: "Sugar", quantity: 1, unit: .cups),
            Ingredients(name: "Egg", quantity: 1, unit: .none),
            Ingredients(name: "Flour", quantity: 1.5, unit: .cups),
            Ingredients(name: "Melted Butter", quantity: 0.25, unit: .cups),
            Ingredients(name: "Baking Soda", quantity: 1, unit: .tsp),
            Ingredients(name: "Salt", quantity: 1, unit: .tsp),
            Ingredients(name: "Chocolate Chips", quantity: 1, unit: .cups)
           ],
           directions:  [
            Direction(description: "Preheat oven to 325", isOptional: false),
            Direction(description: "Mash banana with fork", isOptional: false),
            Direction(description: "Stir in sugar, egg, flour, melted butter, soda, and salt", isOptional: false),
            Direction(description: "Stir in chocolate chips", isOptional: false),
            Direction(description: "Pour in buttered loaf and bake 1 hour or until knife inserted comes out clean", isOptional: false)
           ]
    )
  ]
}*/
