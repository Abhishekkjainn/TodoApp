import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:to/Home.dart';
import 'package:to/modal/taskmodel.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController Taskname = TextEditingController();
  TextEditingController TaskDesc = TextEditingController();

  @override
  void dispose() {
    Taskname.dispose();
    TaskDesc.dispose();

    super.dispose();
  }

  bool isPriority = false;

  List<TaskList> tasks = [];

  void _getTasks() {
    tasks = TaskList.getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 13, 13, 13),
      body: AddTaskHeadingShowModal(),
    );
  }

  Column AddTaskHeadingShowModal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 100, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: GradientBoxBorder(
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.pink]),
                    width: 2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10, top: 50),
          child: Text(
            'Enter Task Name :',
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: TextField(
            controller: Taskname,
            maxLines: null,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                // enabled: true,
                hintText: 'Complete College Assignment',
                focusColor: const Color.fromRGBO(233, 30, 99, 1),
                prefixIcon: Icon(CupertinoIcons.add_circled_solid),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 69, 69, 69)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 107, 107, 107),
                        width: 2))),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: Text(
            'Enter Task Desc :',
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: TaskDesc,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                // enabled: true,
                hintText: 'The Assignement given in DSA Class',
                focusColor: Colors.pink,
                prefixIcon: Icon(CupertinoIcons.info_circle_fill),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 69, 69, 69)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 107, 107, 107),
                        width: 2))),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isPriority = !isPriority;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: isPriority ? Colors.transparent : Colors.transparent,
                  border: !isPriority
                      ? Border.all(color: Colors.white, width: 2)
                      : GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.pink]),
                          width: 2),
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: !isPriority
                    ? Text(
                        'Add To Priority',
                        style: TextStyle(
                            color: !isPriority ? Colors.white : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    // Icon(CupertinoIcons.check_mark_circled_solid)
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Added',
                            style: TextStyle(
                                color:
                                    !isPriority ? Colors.white : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.checklist,
                            color: Colors.blue,
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 200, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Home(
                    tname: Taskname.text,
                    tdesc: TaskDesc.text,
                    tpriority: isPriority,
                  );
                },
              ));
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Add Task',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
            ),
          ),
        )
      ],
    );
  }
}
