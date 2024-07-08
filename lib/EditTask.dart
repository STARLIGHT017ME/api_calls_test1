import 'package:flutter/material.dart';

class Edittask extends StatelessWidget {
  final Function(String) onEditTask;
  final String intialTask;
  final TextEditingController _textcontroller =
      TextEditingController(); /* COLLECT INFO ON WHAT THE USER */
  Edittask({super.key, required this.onEditTask, required this.intialTask}) {
    _textcontroller.text = intialTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 250, 255, 2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 35,
                    color: Colors.grey.shade800,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: TextField(
              controller:
                  _textcontroller, // To collect the text from the text field
              cursorHeight: 35,
              cursorColor: Colors.blue.shade500,
              style: const TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  hintText: "Enter New Task",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 30),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.red),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 50.0),
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.folder_open,
                color: Colors.grey.shade800,
              ),
              Icon(
                Icons.flag_outlined,
                color: Colors.grey.shade800,
              ),
              Icon(
                Icons.nightlight_outlined,
                color: Colors.grey.shade800,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          String edittask = _textcontroller.text.trim();
          if (edittask.isNotEmpty) {
            onEditTask(edittask);
            Navigator.pop(context);
          }
        },
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Save changes",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.update_sharp,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
