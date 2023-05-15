import 'package:flutter/material.dart';

class InputBox{
  late TextEditingController controller;

  InputBox({required this.controller});

  Widget getTextField(){
    return TextField(
      controller: controller,
      autofocus: true,
    decoration: InputDecoration(
      hintText: "Your To Do Thing",
    ),
    );
  }


}