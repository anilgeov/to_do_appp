import 'package:flutter/material.dart';
import 'package:to_do_app/todo.dart';

class todo_item extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const todo_item(
      {Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Dismissible(
        key: ValueKey(todo.todoText!),
        //direction: DismissDirection.endToStart,
        onDismissed: (direction) => onDeleteItem,
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: Icon(
              todo.isDone
                  ? Icons.check_circle_outline
                  : Icons.radio_button_unchecked_outlined,
              color: Colors.blue),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            padding: EdgeInsets.zero,
            //margin: EdgeInsets.symmetric(vertical: 0),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.grey,
              iconSize: 15,
              icon: Icon(Icons.edit, size: 25),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    children: [
                      TextField(
                        onChanged: (value) {},
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
