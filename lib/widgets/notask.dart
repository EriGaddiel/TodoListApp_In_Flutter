import 'package:flutter/material.dart';

class noTask extends StatelessWidget {
  final String image_path;
  final String text;
  const noTask({
    super.key,
    required this.image_path,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.sizeOf(context).height;
    double sw = MediaQuery.sizeOf(context).width;
    return Container(
    // margin: EdgeInsets.only(top: sh * 0.1),
    height: sh * 0.6,
    width: sw * 0.1,
    // color: Colors.indigo,
    child: Column(
      children: [
        Image.asset(image_path, width: sw * 0.5, height: sh * 0.5,),     
        Text(
          text, 
          style: TextStyle(
            color: Colors.grey, 
            fontSize: 25,
            fontWeight: FontWeight.w600,),
          ),
      ],
    ),
  );
  }
}