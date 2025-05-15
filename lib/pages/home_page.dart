import 'package:flutter/material.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  //list of todo task
  List todoList = [
    ['Make Tutorial' , false],
    ['Do Exercise' , false],
  ];

  void checkBoxChanged(bool? value, int index){
      setState(() {
        todoList[index][1] = !todoList[index][1];
      });
  }

  void SaveNewTask() {
    setState(() {
   todoList.add([_controller.text , false]) ;
   _controller.clear();
    });
    Navigator.of(context).pop();
  }
  // create a new task
  void createNewTask(){

    showDialog(context: context, builder: (context){
        return DialogBox(

          controller: _controller,
          onSaved: SaveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
    },
    );
  }
  //Save Method

void deleteTask(int index){
setState(() {
  todoList.removeAt(index);
});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context , index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value , index),
            deleteFunction: (context) => deleteTask(index),
          );
        },



        // children: [
        //   TodoTile(
        //     taskName: 'Make Tutorial',
        //     taskCompleted: true,
        //     onChanged: (p0) {
        //
        //     },
        //   ),
        // TodoTile(
        //   taskName: 'Do Exercise',
        //   taskCompleted: false,
        //   onChanged: (p0) {
        //
        //   },
        //   ),

        // ],
      ),

    );
  }
}