import 'package:flutter/material.dart';

class Availablesize extends StatefulWidget {
  final String size;
  const Availablesize({super.key, required this.size});

  @override
  State<Availablesize> createState() => _AvailablesizeState();
}

class _AvailablesizeState extends State<Availablesize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.blue)),
        child: Text(
          widget.size,
        ),
      ),
    );
  }
}
