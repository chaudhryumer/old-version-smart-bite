
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDshRepo{
  Future<void> addDish(Map<String, dynamic> dishData) async {
    await FirebaseFirestore.instance.collection('AddMenu').add(dishData);

  }
}