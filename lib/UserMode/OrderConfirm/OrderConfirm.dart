
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project1practice/UserMode/OrderConfirm/OrderVm.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {

  TextEditingController OrderNameCtrl=TextEditingController();
  TextEditingController OrderNumberCtrl=TextEditingController();
  TextEditingController EmailCtrl=TextEditingController();
  String? selectedCategory;
  TextEditingController descriptionCtrl=TextEditingController();
  final orderVm=Get.put(OrderVm());


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
                    "Add Fresh Order",
                    style: TextStyle(
                      fontSize: 18,
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
                "Order Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: OrderNameCtrl,
                decoration: InputDecoration(
                  hintText: "Order Name",
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
                "Order Number",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: OrderNumberCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Order Number",
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
                "Email Customer",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),


              const SizedBox(height: 8),
              TextField(
                controller: EmailCtrl,
                decoration: InputDecoration(
                  hintText: "Email",
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
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value; // Updates the UI and the variable
                      });
                    },
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
                controller:  descriptionCtrl,
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
                        orderVm.addOrder(
                          name: OrderNameCtrl.text,
                          number: OrderNumberCtrl.text,
                          email: EmailCtrl.text,
                          category: selectedCategory,
                          description: descriptionCtrl.text,
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
                        "Add Order",
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
