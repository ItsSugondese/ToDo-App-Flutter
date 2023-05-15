import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/widgets/inputBox.dart';
import 'package:todoapp/widgets/mainLists.dart';
import 'package:todoapp/widgets/poppingUp.dart';
import 'package:todoapp/widgets/someWidgets.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late MainLists mainLists;
  late PoppingUp poppingUp;
  late SomeWidgets someWidgets;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainLists = new MainLists();
   poppingUp = new PoppingUp();
   someWidgets = new SomeWidgets();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    poppingUp.controller.dispose();
  }

  void onPressed() async{

      final name =  await poppingUp.PopDialog(context);
      if(name== null || name.isEmpty) return;

      setState(() {
        mainLists.activities.add(name);
      });
  }

  FloatingActionButton getFloat(){
   return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add,
        color: Colors.white,

      ),
    );
  }

  void _handleTapDown(TapDownDetails detais){
    poppingUp.PopDeleter(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List App"),
      ),

        floatingActionButton:  getFloat(),


      body: ListView.builder(

        itemCount: mainLists.activities.length,

        itemBuilder: (BuildContext context, int index) {

          return GestureDetector(
            onTapDown: (TapDownDetails details) async{

              await poppingUp.PopDeleter(context);

              if(poppingUp.pressed== true) {
                setState(() {
                  mainLists.activities.remove(mainLists.activities[index]);
                  poppingUp.pressed =false;
                });
              }


            },


             child: someWidgets.getContainer(mainLists.activities[index]),
          );

          },
 )
    );
  }
}
