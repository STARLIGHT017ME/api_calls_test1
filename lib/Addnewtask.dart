import 'package:flutter/material.dart';

class Addnewtask extends StatefulWidget {
  final Function(String, DateTime?, DateTime?, String) onTaskAdded;
  const Addnewtask({
    super.key,
    required this.onTaskAdded,
  });

  @override
  State<Addnewtask> createState() => _AddnewtaskState();
}

class _AddnewtaskState extends State<Addnewtask> {
  final TextEditingController _textcontroller = TextEditingController();
  final TextEditingController _startdatecontroller = TextEditingController();
  final TextEditingController _enddatecontroller = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  String _selectedCategory = "Work";

  List<String> categories = ['Work', 'Personal', 'Shopping'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 250, 255, 2),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                const SizedBox(
                    width: 10), // Adjust the width as needed for spacing

                Expanded(
                  child: TextField(
                    controller: _startdatecontroller,
                    decoration: const InputDecoration(
                      labelText: "Start Date",
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectedDate(_startdatecontroller, true);
                    },
                  ),
                ),
                const SizedBox(
                    width: 10), // Adjust the width as needed for spacing

                Expanded(
                  child: TextField(
                    controller: _enddatecontroller,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectedDate(_enddatecontroller, false);
                    },
                  ),
                ),
                const SizedBox(
                    width: 10), // Adjust the width as needed for spacing

                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    onChanged: (String? newvalue) {
                      setState(() {
                        _selectedCategory = newvalue!;
                      });
                    },
                    items: categories.map((String categories) {
                      return DropdownMenuItem<String>(
                        value: categories,
                        child: Text(categories),
                      );
                    }).toList(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          String newtask = _textcontroller.text.trim();
          if (newtask.isNotEmpty) {
            widget.onTaskAdded(newtask, startDate, endDate, _selectedCategory);
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
                "New Task",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* CODE FOR THE USER TO SELCECT A DATE */
  Future<void> _selectedDate(
      TextEditingController controller, bool isStartDate) async {
    DateTime? _picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (_picked != null) {
      setState(() {
        _startdatecontroller.text = _picked.toString().split(" ")[0];
        if (isStartDate) {
          startDate = _picked;
        } else {
          endDate = _picked;
        }
      });
    }
  }
}
