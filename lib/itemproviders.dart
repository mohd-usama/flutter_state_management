
import 'package:flutter/foundation.dart';

class itemproviders extends ChangeNotifier
{
  List _itemData = [];
  List get getItemdata => _itemData;

  void incrementcount(int index)
  {
    _itemData[index]['count']++;
    notifyListeners();
  }

  void addItems(String value)
  {
    _itemData.add({'title':value,'count':0});

    notifyListeners();
  }
}