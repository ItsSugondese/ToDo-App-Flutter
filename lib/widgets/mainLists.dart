import 'package:flutter/material.dart';

class MainLists{
  late List<String> activities;

  MainLists(){
    activities = <String>[];

}
  void setActivities(String okey){
    activities.add(okey);
  }
}