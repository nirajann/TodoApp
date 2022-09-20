import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "TODO APP",
      home: TODOAPP(),
    ));

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String? value;
  var listTODO = [''];

  addtodo(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: (){
            addtodo(value ?? "");
          },
          ),
      appBar: AppBar(
        title: Text("TODO APP"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listTODO.length,
          itemBuilder: (context,index){
          return index == 0? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (val){
                  value = val;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',)
            ),
          ) : ListTile(
            leading: Icon(Icons.work),
            title: Text("${listTODO[index]}", style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: 30
            ),
            ),

          );
      })
    );
  }
}
