
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Employee"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15,),
          TextField(
            decoration: InputDecoration(
              hintText: "Employee Name",
            ),
          ),
          SizedBox(height: 15,),
          TextField(),
          SizedBox(height: 15,),
          TextField(),
          SizedBox(height: 15,),
          TextField(),
          SizedBox(height: 15,),
        ],
      ),

    );
  }
}
