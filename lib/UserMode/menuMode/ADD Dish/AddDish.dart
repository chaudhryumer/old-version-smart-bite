import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project1practice/UserMode/menuMode/ADD%20Dish/AddDishVm.dart';

import 'AddDishVm.dart';

class AddDish extends StatefulWidget {
   const AddDish({super.key});

  @override
  State<AddDish> createState() => _AddDishState();
}

class _AddDishState extends State<AddDish> {
  TextEditingController DishNameCtrl=TextEditingController();
  TextEditingController PriceCtrl=TextEditingController();
  String? selectedCategory;
  TextEditingController DescriptionCtrl=TextEditingController();
  final AddDishVm addDishVm=Get.put(AddDishVm());




  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: const [
                  Icon(
                    Icons.restaurant_menu_rounded,
                    color: Colors.deepOrange,
                    size: 32,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Add New Dish",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),



              // Image upload area


              const SizedBox(height: 32),

              // Dish Name
              const Text(
                "Dish Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: DishNameCtrl,
                decoration: InputDecoration(
                  hintText: "e.g. Chicken Biryani",
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),

              const SizedBox(height: 20),

              // Price
              const Text(
                "Price (PKR)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: PriceCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "e.g. 890",
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),

              const SizedBox(height: 20),

              // Category
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    hint: const Text("Select category"),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(value: "Starters", child: Text("Starters")),
                      DropdownMenuItem(value: "Main Course", child: Text("Main Course")),
                      DropdownMenuItem(value: "Desserts", child: Text("Desserts")),
                      DropdownMenuItem(value: "Beverages", child: Text("Beverages")),
                      DropdownMenuItem(value: "Specials", child: Text("Specials")),
                    ],
                    onChanged: (value) {
                      selectedCategory=value;
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Description
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: DescriptionCtrl,
                maxLines: 4,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: "Short description, ingredients, etc...",
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),

              const SizedBox(height: 32),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Submit logic would go here (ignored as per request)
                        if(selectedCategory==null){
                          Get.snackbar("Error", "Please select a category");
                          return;
                        }
                         addDishVm.addDish(
                           DishName:DishNameCtrl.text,
                           Price: PriceCtrl.text,
                           Category: selectedCategory!,
                           Description: DescriptionCtrl.text,
                         );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "Add Dish",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}