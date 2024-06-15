import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  void Function()? onTap;
  PostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 66,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        child: Icon(Icons.done),
      ),
    );
  }
}
