import 'package:api_calls_test1/Addnewtask.dart';
import 'package:api_calls_test1/EditTask.dart';
import 'package:api_calls_test1/neumorphism.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  List<int> selectedTaskIndex = []; /* selct the task indexs like 0,1,2,3 */
  List<String> tasks =
      []; /* selct the task name like [do homework,do assignment] */
  List<String> categories = ["Work", "Personal", "Shopping"];
  String _selectedCategories = "All";
  @override
  void initState() {
    super.initState();
  }

  /* ADD NEW TASK TO THE HOME PAGE */
  void _addNewTask(String task, DateTime? duedate, String category) {
    setState(() {
      tasks.add(task);
    });
  }

/* EDIT PREVIOUS TASK */
  void _editPrevioustask(String edittasks, int index) {
    setState(() {
      tasks[index] = edittasks;
    });
  }

  /* DELETE ADDED TASK IN THE HOME PAGE */
  void _deleteTask(int index) {
    String deletedTask = tasks[index];
    setState(() {
      tasks.removeAt(index);
    });

    /* AFTER TASK IS DELETED 
    THE SNACK BAR SHOWS AND ASKS WHETHER TO UNDO */
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Task deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              tasks.insert(index, deletedTask);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 250, 255, 2),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(248, 250, 255, 2),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_none)
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(13, 31, 83, 0.9),
          child: ListView(
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        "lib/images/jeremy-bishop-OxucP0JIORU-unsplash.jpg"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    "Joy \n Mitchell",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                title: Text(
                  "Template",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.category_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.analytics,
                  color: Colors.white,
                ),
                title: Text(
                  "Analytics",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          /* BODY HEADER */
          const Center(
            child: Text(
              "What's Up , Joy! ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),

          /*  categories of tasks */
          const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10),
            child: Neumorphism(
              width: double.infinity,
              text: '',
              height: 250,
            ),
          ),

          /* TODAY TASKS */
          const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Today Tasks",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(tasks[index]),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    _deleteTask(
                        index); /* WHEN YOU SLIDE TO THE LEFT THE TASK OF INDEX DELETES */
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20.0),
                    /* padding for the placement of delete icon */
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400,
                      ),
                      height: 70,
                      width: double.infinity,
                      child: ListTile(
                        leading: Checkbox(
                          value: selectedTaskIndex.contains(index),
                          onChanged: (bool? value) {
                            setState(
                              () {
                                if (value == true) {
                                  selectedTaskIndex.add(index);
                                } else {
                                  selectedTaskIndex.remove(index);
                                }
                              },
                            );
                          },
                        ),
                        title: Text(
                          tasks[index],
                          style:
                              /* TO CANCEL THE TEXT ON THE TO-DO LIST */
                              TextStyle(
                                  decoration: selectedTaskIndex.contains(index)
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: selectedTaskIndex.contains(index)
                                      ? Colors.grey.shade600
                                      : Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Edittask(
                                        onEditTask: (edittasks) =>
                                            _editPrevioustask(edittasks, index),
                                        intialTask: tasks[index],
                                      )));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 9,
        shape: const CircleBorder(
            side: BorderSide(
          color: Color.fromRGBO(9, 106, 255, 7),
          width: 2.0,
        )),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Addnewtask(onTaskAdded: _addNewTask)));
        },
        backgroundColor: const Color.fromRGBO(9, 106, 255, 7),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
