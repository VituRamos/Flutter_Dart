import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:portfolio_1/components/dialog_box.dart';
import 'package:portfolio_1/components/todo_tile.dart';
import 'package:portfolio_1/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  //Hive
  final _mybox = Hive.openBox('mybox');

  //Text Controller
  final _controller = TextEditingController();

  //Lista de Tasks
  List<Task> toDoList = [
    Task(name: "Comprar pão", isDone: false),
    Task(name: "Estudar Flutter", isDone: true),
  ];

  //Metodo CheckBox
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index].isDone = !toDoList[index].isDone;
    });
  }

  //Save Task
  void saveNewTask(){
    setState(() {
      toDoList.add(Task(name: _controller.text, isDone: false));
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  //Delete Task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  //Metodo New Task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Style
      backgroundColor: Colors.yellow[100],
      
      //Appbar
      appBar: AppBar(
        title: Text('To Do'),
      ),

      //Body
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName: toDoList[index].name, 
            isDone: toDoList[index].isDone, 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }
      ),

      //Button
      floatingActionButton: FloatingActionButton(
        
        //Style
        backgroundColor: Colors.yellow,
        shape: CircleBorder(),
        child: Icon(Icons.add),

        //Onpressed
        onPressed: createNewTask,
      ),

    );
  }
}