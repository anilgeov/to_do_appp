import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';
import 'package:to_do_app/todo_items.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [

              Expanded(
                child: ListView(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text('All To Do',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                  ),

                  for (ToDo todoo in todoList.reversed)
                  todo_item(todo: todoo ,
                    onToDoChanged:_handleToDoChange,
                  onDeleteItem:_deleteToDoItem,
                  ),
                ]),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20) ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black87,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _todoController,
                      minLines: 1,maxLines: 5,
                      decoration: InputDecoration(
                          hintText: " titile \n discription" , hintStyle: TextStyle(fontSize: 13), border: InputBorder.none),
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.only(bottom: 20,right: 20
                ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    child: Text('+',style: TextStyle(fontSize: 40,),),style: ElevatedButton.styleFrom(
                    onSurface: Colors.blue,elevation: 10,shadowColor: Colors.black,minimumSize: Size(50,50)
                  ),
                  ),
                ),
              ]),
          )
        ],
      ),
    );
  }


  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
    void _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
    }

    void _addToDoItem(String toDo){
      setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
    }



  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add_alert_outlined,
            color: Colors.grey,
            size: 20,
          ),
          Container(
            child: Text('TO DO',style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold)),
          ),
          // Container(
          //   width: 20,
          //   height: 20,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(25),
          //     child: Image.asset("asset/image/hero-img_copy.png"),
          //   ),
          // ),
        ],
      ),
    );
  }
}
