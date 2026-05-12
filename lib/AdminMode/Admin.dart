import 'package:flutter/material.dart';
import 'package:project1practice/AdminMode/Employee/Employee.dart';
import 'package:project1practice/AdminMode/KitchenMode.dart';
import 'package:project1practice/AdminMode/RiderMode.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _currentIndex = 0; // better naming convention

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Mode'),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        elevation: 2, // subtle shadow
      ),

      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            KitchenMode(),    // index 0
            RiderMode(),      // index 1
            Employee(),       // index 2
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen_rounded),
            label: 'Kitchen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bike_scooter_rounded),
            label: 'Rider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Employees',
          ),
        ],
      ),
    );
  }
}