import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KitchenMode extends StatefulWidget {
  const KitchenMode({super.key});

  @override
  State<KitchenMode> createState() => _KitchenModeState();
}

class _KitchenModeState extends State<KitchenMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Container(
          height: double.infinity,
          width: 700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    "Incoming Orders",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('orders')
                        .orderBy('CreatedAt', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text("No active orders"));
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final orderDoc = snapshot.data!.docs[index];
                          final orderData = orderDoc.data() as Map<String, dynamic>;
                          String status = orderData['Status'] ?? 'Pending';

                          Color getStatusColor() {
                            if (status == 'Cooking') return Colors.orange;
                            if (status == 'Ready') return Colors.green;
                            return Colors.red;
                          }

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            elevation: 3,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                orderData['orderName'] ?? 'Unnamed Order',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column( // Use Column here to show text + status chip
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Qty: ${orderData['OrderNumber']} | ${orderData['Category']}"),
                                  Text("Note: ${orderData['Description']}"),
                                  const SizedBox(height: 8),
                                  // This is the Status Chip
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: getStatusColor().withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      status,
                                      style: TextStyle(
                                        color: getStatusColor(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'Delete') {
                                    orderDoc.reference.delete();
                                  } else {
                                    orderDoc.reference.update({'Status': value});
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(value: 'Pending', child: Text('Mark Pending')),
                                  const PopupMenuItem(value: 'Cooking', child: Text('Mark Cooking')),
                                  const PopupMenuItem(value: 'Ready', child: Text('Mark Ready')),
                                  const PopupMenuItem(
                                    value: 'Delete',
                                    child: Text('Clear Order', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}