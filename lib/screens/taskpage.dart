import 'package:check_it/database_helper.dart';
import 'package:check_it/models/task.dart';
import 'package:check_it/models/todo.dart';
import 'package:check_it/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  final Task task;

  Taskpage({@required this.task});

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  int _taskId = 0;
  String _taskTitle = "";

  @override
  void initState() {
    if (widget.task != null) {
      _taskTitle = widget.task.title;
      _taskId = widget.task.id;
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage('assets/images/back.png'),
                              height: 25.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 12.0,
                            ),
                            child: TextField(
                              onSubmitted: (value) async {
                                //to check if the field is not empty
                                if (value != "") {
                                  //check if the task is null
                                  if (widget.task == null) {
                                    Task _newTask = Task(title: value); //Task

                                    await _dbHelper.insertTask(_newTask);
                                  } else {
                                    print("Update the existing task");
                                  }
                                }
                              },
                              controller: TextEditingController()
                                ..text = _taskTitle,
                              decoration: InputDecoration(
                                  hintText: "Enter your task here!",
                                  border: InputBorder.none),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF900C3F),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter the description for the task",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )),
                  ),
                  FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getTodo(_taskId),
                    builder: (context, snapshot) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                //switch the todo completion state
                              },
                              child: TodoWidget(
                                text: snapshot.data[index].title,
                                isDone: snapshot.data[index].isDone == 0
                                    ? false
                                    : true,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.only(
                            right: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Image(
                            height: 20.0,
                            image: AssetImage('assets/images/tick.png'),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                          onSubmitted: (value) async {
                            //to check if the field is not empty
                            if (value != "") {
                              //check if the todo is null
                              if (widget.task != null) {
                                DatabaseHelper _dbHelper = DatabaseHelper();
                                Todo _newTodo = Todo(
                                  title: value,
                                  isDone: 0,
                                  taskId: widget.task.id,
                                );

                                await _dbHelper.insertTodo(_newTodo);
                                setState(() {});
                              }
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Enter todo item..",
                            border: InputBorder.none,
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Taskpage(),
                      ),
                    );
                  },
                  child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      child: Image(
                        image: AssetImage("assets/images/delete.png"),
                        height: 5.0,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
