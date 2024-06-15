import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;
  final String name;
  MyButton({super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: Center(
              child: Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
