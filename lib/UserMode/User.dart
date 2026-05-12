import 'package:flutter/material.dart';
import 'package:project1practice/UserMode/DealMode/DealsMode.dart';
import 'package:project1practice/UserMode/menuMode/MenuMode.dart';
import 'package:project1practice/UserMode/OrderConfirm/OrderConfirm.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  int _currentIndex = 0; // ← better naming with _

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Mode'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: const [
          MenuMode(),           // index 0
          DealsMode(),          // index 1
          OrderConfirm(),       // index 2
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;          // ← must be inside setState
          });
        },
        type: BottomNavigationBarType.fixed,           // important for 3+ items
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Menu Mode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_rounded),
            label: 'Deals Mode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded),
            label: 'Order',
          ),
        ],
      ),
    );
  }
}