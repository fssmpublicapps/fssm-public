// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'product.dart';

List<Product> getProducts(Category category) {
  const allProducts = <Product>[
    Product(
      category: Category.premis,
      id: 0,
      isFeatured: true,
      name: 'Vagabond lair',
      caption: 'A shop with a tremendous amount of mounth watering dessert and food.',
    ),
    Product(
      category: Category.premis,
      id: 1,
      isFeatured: true,
      name: 'Stella Bakery',
      caption: 'A unique bakery with hugh variation of bread and cakes you can choose from.',
    ),
    Product(
      category: Category.drink,
      id: 9,
      isFeatured: true,
      name: 'Gilt trio',
      caption: 'A drink sold at Cangkat Bistro. A combination of three fruity flavor of apple, grapes and mango.',
    ),
    Product(
      category: Category.drink,
      id: 10,
      isFeatured: false,
      name: 'Coke',
      caption: 'An all time favourite soft drink with a long history. Everyone know it.',
    ),
    Product(
      category: Category.food,
      id: 19,
      isFeatured: false,
      name: 'Clay chicken',
      caption: 'A roasted chicken wrap around clay for a deep taste. Marinated with various herb and spice.',
    ),
    Product(
      category: Category.food,
      id: 20,
      isFeatured: false,
      name: 'Seafood soup',
      caption: 'Soup comprise of various luxurious seafood you can thing of. Crab, abalone, lobster, squid to name a few.',
    ),
  ];
  if (category == Category.all) {
    return allProducts;
  } else {
    return allProducts.where((Product p) {
      return p.category == category;
    }).toList();
  }
}