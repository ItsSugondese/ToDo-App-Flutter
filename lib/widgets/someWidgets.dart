import 'package:flutter/material.dart';

class SomeWidgets{


  Container getContainer(String txt){
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
             margin: EdgeInsets.fromLTRB(10, 0, 0,0),
             padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
              color: Colors.black,
                  ),
            child: Text(
                txt,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          Divider(),
        ],
      ),
    );
  }

}