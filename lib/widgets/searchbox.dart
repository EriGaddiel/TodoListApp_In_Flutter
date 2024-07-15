import 'package:flutter/material.dart';

class searchBox extends StatelessWidget {
  searchBox({super.key, required this.onChanged});

  final void Function(String)?onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            hintText: "Search for a task here ...  ",
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search, color: Colors.black38, size: 20,),
            suffixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25, ),
          ),
        ),
      );
  }
}