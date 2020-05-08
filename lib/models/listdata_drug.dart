import 'package:apptechary/models/data_drug.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DrugData extends ChangeNotifier{
  List<Drug> _drugList;

  void addDrug(Drug drug){
    _drugList.add(drug);
    notifyListeners();
  }

  int get itemCount => _drugList.length;

  void updateDrug(Drug drug){
    notifyListeners();
  }
}