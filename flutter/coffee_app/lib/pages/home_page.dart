import 'package:coffee_app/widgets/coffee_tile.dart';
import 'package:coffee_app/widgets/coffee_type.dart';
import 'package:coffee_app/widgets/presentation.dart';
import 'package:coffee_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list coffee types
  final List coffeeType = [
    ['All', true],
    ['Cappuccino', false],
    ['Latte', false],
    ['Black', false],
    ['Iced', false],
  ];

  // user tapped on coffee types
  void coffeeTypeSelect(int index) {
    setState(() {
      // this for loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }

      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          const Presentation(),

          const SizedBox(height: 25),

          // Search Bar
          const SearchBar(),

          const SizedBox(height: 25),

          // Horizontal list view of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelect(index);
                  },
                );
              },
            ),
          ),

          // Horizontal list view of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeeImagePath: 'lib/assets/images/black-coffee.jpg',
                  coffeeName: 'Black Coffee',
                  coffeePrice: '4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/assets/images/capuccino.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '8.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/assets/images/ice-coffee.jpg',
                  coffeeName: 'Iced Coffee',
                  coffeePrice: '8.00',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
    );
  }
}
