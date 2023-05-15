
import 'package:flutter/material.dart';
import 'package:todoapp/widgets/mainLists.dart';

import '../Home.dart';
import 'inputBox.dart';

class PoppingUp{

  late InputBox inputBox;
  late MainLists mainLists;
  bool pressed = false;
  late TextEditingController controller;

  PoppingUp(){
    controller = new TextEditingController();
    inputBox = new InputBox( controller: controller);
    mainLists = new MainLists();

  }

  Future<String?> PopDialog(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (context)  => AlertDialog(
          title: Text("Your New work"),
          content: inputBox.getTextField(),
          actions: [
              TextButton(onPressed: () => muji(context),
                  child: Text("Add")),
            TextButton(onPressed: null,
                child: Text("Cancel"))
          ],
        ));
  }
  void muji(BuildContext context){
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }



  Future PopDeleter(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context)  => AlertDialog(

          content: Text("Are you sure you want to delete this Todo task?"),
          actions: [
            TextButton(onPressed: () {
              this.pressed = true;
    Navigator.of(context).pop();



    },
                child: Text("Delete")),
            TextButton(onPressed: null,
                child: Text("Cancel"))
          ],
        ));
  }


}