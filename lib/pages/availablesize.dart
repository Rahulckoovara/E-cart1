import 'package:flutter/material.dart';

class Availablesize extends StatefulWidget {
  final String size;
  //final ValueChanged<String> onSizeSelected;
  final VoidCallback onSizeSelected;
   final bool isSelected;
  const Availablesize({super.key, required this.size, required this.onSizeSelected, required this.isSelected});

  @override
  State<Availablesize> createState() => _AvailablesizeState();
}

class _AvailablesizeState extends State<Availablesize> {
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: widget.onSizeSelected,
      // onTap: () {
      //   setState(() {
      //     widget.onSizeSelected(widget.size);
      //     isSelected = !isSelected;
      //   });
      // },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.blue)),
        child: Text(
          widget.size,
        ),
      ),
    );
  }
}
