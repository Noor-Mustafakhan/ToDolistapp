import 'package:flutter/material.dart';
import 'package:todolist/list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoList extends StatefulWidget {
      ToDoList({super.key});
  @override
  State<ToDoList> createState() => _ToDoListState();
}
class _ToDoListState extends State<ToDoList> {
  final _control=TextEditingController();
  List toDoList =[
    ['Flutter',false],
    ['Coffee',false],
  ];
  void checkchanges(int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
  void saveNewTask()
  {
    setState(() {
      toDoList.add([_control.text,false]);
      _control.clear();
    });
  }
  void delete(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC5B1B7),
        appBar: AppBar(
          centerTitle: true,
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('TO-DO-APP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Image.asset('lib/image/to.png',
                width: 30,
                height: 30,)
            ],
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.pinkAccent,
        ),
        body:ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context,index) {
              return Listt(
                taskName: toDoList[index][0],
                taskComplete: toDoList[index][1],
                onChange: (value)=>checkchanges(index),
                deleteFuction: (context)=> delete(index),
              );
            }),
          floatingActionButton: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    controller: _control,
                    decoration: InputDecoration(
                     hintText: 'Add New ',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                    borderRadius: BorderRadius.circular(40),

                  )
                    ),
                  ),
                ),
              ),
              FloatingActionButton(

                      onPressed: saveNewTask,
                       child:Icon(Icons.add,color: Colors.pink,),

                  ),

            ],
          ),

    );
  }
}


