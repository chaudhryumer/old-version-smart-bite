import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1practice/UserMode/menuMode/ADD%20Dish/AddDish.dart';

class MenuMode extends StatelessWidget {
  const MenuMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Mode',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header section (Kept exactly as you requested)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Menu',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Using Get.dialog because your AddDish returns a Dialog widget
                    Get.dialog(const AddDish());
                  },
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Add Dish'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 2. The Real-time List section
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                // Ensure this collection name matches your AddDishRepo
                stream: FirebaseFirestore.instance.collection('AddMenu').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading menu"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // If database is empty
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.restaurant_menu_outlined, size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text('No dishes added yet', style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                          Text('Click "Add Dish" to start building your menu', style: TextStyle(color: Colors.grey.shade500)),
                        ],
                      ),
                    );
                  }

                  // 3. Real-time ListView
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var dish = snapshot.data!.docs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors.orange.shade100,
                                child: const Icon(Icons.fastfood, color: Colors.deepOrange),
                              ),
                            ),
                            title: Text(
                              dish['DishName'] ?? 'No Name',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'PKR ${dish['Price']} • ${dish['Category']}',
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                              onPressed: () {
                                // Deletes the dish from Firestore real-time
                                dish.reference.delete();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}