import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'itemproviders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State management",
      home: ChangeNotifierProvider.value(value: itemproviders(),child: Homepage(),),
    );
  }
}

class Homepage extends StatelessWidget
{
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("Build method call ");
    final itemprovidersdata = Provider.of<itemproviders>(context);
   return Scaffold(
     appBar: AppBar(
       title: Text(
         "State management",
       ),
     ),
     body: Container(
       child: Column(
         children: <Widget>[
           TextField(
             controller: _textEditingController,
           ),
           RaisedButton(
             child: Text(
               "Add Items"
             ),
             onPressed: () {
               if(_textEditingController.text.isNotEmpty)
                 {
                   itemprovidersdata.addItems(_textEditingController.text);
                 }
             },
           ),

          Expanded(
            child: ListView.builder(
              itemCount: itemprovidersdata.getItemdata.length,
              itemBuilder: (_,index)=>ListTile(
                onTap: (){
                  itemprovidersdata.incrementcount(index);
                },
                title: Text(
                    '${itemprovidersdata.getItemdata[index]['title']}'
                ),
                trailing: CircleAvatar(
                  child: Text(
                      '${itemprovidersdata.getItemdata[index]['count']}'
                  ),
                ),
              ),
            ),
          )
         ],
       ),
     ),
   );
  }
  
}

