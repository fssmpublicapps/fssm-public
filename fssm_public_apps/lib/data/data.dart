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
      price: 120,
    ),
    Product(
      category: Category.premis,
      id: 1,
      isFeatured: true,
      name: 'Stella Bakery',
      price: 58,
    ),
    Product(
      category: Category.premis,
      id: 2,
      isFeatured: false,
      name: 'Whitney Restaurant',
      price: 35,
    ),
    Product(
      category: Category.premis,
      id: 3,
      isFeatured: true,
      name: 'Garden View Cafe',
      price: 98,
    ),
    Product(
      category: Category.premis,
      id: 4,
      isFeatured: false,
      name: 'Strut Loft',
      price: 34,
    ),
    Product(
      category: Category.premis,
      id: 5,
      isFeatured: false,
      name: 'Varsity Canteen',
      price: 12,
    ),
    Product(
      category: Category.premis,
      id: 6,
      isFeatured: false,
      name: 'Weave Stall',
      price: 16,
    ),
    Product(
      category: Category.premis,
      id: 7,
      isFeatured: true,
      name: 'Gatsby Hangout Bistro',
      price: 40,
    ),
    Product(
      category: Category.premis,
      id: 8,
      isFeatured: true,
      name: 'Shrug Restaurant',
      price: 198,
    ),
    Product(
      category: Category.drink,
      id: 9,
      isFeatured: true,
      name: 'Gilt trio',
      price: 58,
    ),
    Product(
      category: Category.drink,
      id: 10,
      isFeatured: false,
      name: 'Coke',
      price: 18,
    ),
    Product(
      category: Category.drink,
      id: 11,
      isFeatured: false,
      name: 'Soothe set',
      price: 28,
    ),
    Product(
      category: Category.drink,
      id: 12,
      isFeatured: false,
      name: 'Hurrahs tea',
      price: 34,
    ),
    Product(
      category: Category.drink,
      id: 13,
      isFeatured: true,
      name: 'Blue stone sparkling',
      price: 18,
    ),
    Product(
      category: Category.drink,
      id: 14,
      isFeatured: true,
      name: 'Rainwater juice',
      price: 27,
    ),
    Product(
      category: Category.drink,
      id: 15,
      isFeatured: true,
      name: 'Chambray Sparkling',
      price: 16,
    ),
    Product(
      category: Category.drink,
      id: 16,
      isFeatured: true,
      name: 'Succulent Shake',
      price: 16,
    ),
    Product(
      category: Category.drink,
      id: 17,
      isFeatured: false,
      name: 'Quartet Juice',
      price: 175,
    ),
    Product(
      category: Category.drink,
      id: 18,
      isFeatured: true,
      name: 'Quattro Frizz',
      price: 129,
    ),
    Product(
      category: Category.food,
      id: 19,
      isFeatured: false,
      name: 'Clay chicken',
      price: 48,
    ),
    Product(
      category: Category.food,
      id: 20,
      isFeatured: false,
      name: 'Seafood soup',
      price: 45,
    ),
    Product(
      category: Category.food,
      id: 21,
      isFeatured: false,
      name: 'Dream Platter',
      price: 38,
    ),
    Product(
      category: Category.food,
      id: 22,
      isFeatured: false,
      name: 'White Pumpkin Porridge',
      price: 70,
    ),
    Product(
      category: Category.food,
      id: 23,
      isFeatured: false,
      name: 'Chambray Rice',
      price: 70,
    ),
    Product(
      category: Category.food,
      id: 24,
      isFeatured: true,
      name: 'Seabreeze set',
      price: 60,
    ),
    Product(
      category: Category.food,
      id: 25,
      isFeatured: false,
      name: 'Hamburger',
      price: 178,
    ),
    Product(
      category: Category.food,
      id: 26,
      isFeatured: false,
      name: 'Navy Dream set',
      price: 74,
    ),
    Product(
      category: Category.food,
      id: 27,
      isFeatured: true,
      name: 'Steak',
      price: 38,
    ),
    Product(
      category: Category.food,
      id: 28,
      isFeatured: true,
      name: 'Surf and perf set',
      price: 48,
    ),
    Product(
      category: Category.food,
      id: 29,
      isFeatured: true,
      name: 'Ginger Roasted Beef ',
      price: 98,
    ),
    Product(
      category: Category.food,
      id: 30,
      isFeatured: true,
      name: 'Ramona Fish n Chip',
      price: 68,
    ),
    Product(
      category: Category.food,
      id: 31,
      isFeatured: false,
      name: 'Chambray Salad',
      price: 38,
    ),
    Product(
      category: Category.food,
      id: 32,
      isFeatured: false,
      name: 'Ratatouile',
      price: 58,
    ),
    Product(
      category: Category.food,
      id: 33,
      isFeatured: true,
      name: 'Cerise scallop Steam',
      price: 42,
    ),
    Product(
      category: Category.food,
      id: 34,
      isFeatured: false,
      name: 'Shoulder Lambchop',
      price: 27,
    ),
    Product(
      category: Category.food,
      id: 35,
      isFeatured: false,
      name: 'Chicken Chop',
      price: 24,
    ),
    Product(
      category: Category.food,
      id: 36,
      isFeatured: false,
      name: 'Sundry fruit',
      price: 58,
    ),
    Product(
      category: Category.food,
      id: 37,
      isFeatured: true,
      name: 'Fir Salad',
      price: 58,
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