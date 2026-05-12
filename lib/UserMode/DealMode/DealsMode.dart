import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1practice/UserMode/DealMode/AddDeal.dart';

class DealsMode extends StatefulWidget {
  const DealsMode({super.key});

  @override
  State<DealsMode> createState() => _DealsModeState();
}

class _DealsModeState extends State<DealsMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deal Mode',
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
            // Header section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded( // Use Expanded to prevent text overflow
                  child: Text(
                    'Your Deals are here! Grab it',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => Get.dialog(const AddDeal()),
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Add New Deals'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Real-time Deal List
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                // Matches the collection name in your DealRepo
                stream: FirebaseFirestore.instance.collection("AddDeal").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Center(child: Text("Error loading deals"));
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // If No Deals Exist
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.restaurant_menu_outlined, size: 80, color: Colors.grey.shade400),
                          const SizedBox(height: 16),
                          Text('No Deal added yet', style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                          Text('Click "Add New Deals" to start', style: TextStyle(color: Colors.grey.shade500)),
                        ],
                      ),
                    );
                  }

                  // The actual List
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var deal = snapshot.data!.docs[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange.shade100,
                            child: const Icon(Icons.local_offer, color: Colors.deepOrange),
                          ),
                          title: Text(
                            deal['DealName'] ?? 'No Name',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Items: ${deal['DealItems']}'),
                              Text(
                                'PKR ${deal['Price']} • ${deal['Category']}',
                                style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () => deal.reference.delete(),
                          ),
                        ),
                      );
                    },
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