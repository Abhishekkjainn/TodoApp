import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:to/modal/taskmodel.dart';

class HomeScreen extends StatefulWidget {
  String tname;
  String tdesc;
  bool tpriority;

  HomeScreen(
      {super.key,
      required this.tname,
      required this.tdesc,
      required this.tpriority});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskList> tasks = [];

  Future<void> _getTasks() async {
    tasks = TaskList.getTask();
  }

  List<PriorityList> priorityTasks = [];

  @override
  Future<void> _getPriority() async {
    priorityTasks = PriorityList.getPriorTask();
  }

  Future<void> addtoTask() async {
    if (widget.tpriority != null) {
      if (widget.tpriority) {
        setState(() {
          priorityTasks.add(PriorityList(
              PriorityTaskName: widget.tname,
              PriorityTaskLastDate: '',
              PriorityisDone: false,
              PriorityTaskDesc: widget.tdesc));
        });
      } else {
        setState(() {
          tasks.add(TaskList(
              TaskName: widget.tname,
              TaskLastDate: '',
              isDone: false,
              TaskDesc: widget.tdesc));
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getTasks();
    _getPriority();
    addtoTask();
  }

  @override
  Widget build(BuildContext context) {
    // _getTasks();
    // // _getPriority();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingPriorityTasks(),
          MainListviewbuilder(),
          AllTaskHeading(),
          AllTaskBuilder()
        ],
      ),
    );
  }

  ListView AllTaskBuilder() {
    return ListView.builder(
      itemCount: tasks.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // final item = tasks[index];

        return GestureDetector(
          key: Key(tasks[index].hashCode.toString()),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
                height: 180,
                decoration: BoxDecoration(
                    color: tasks[index].isDone
                        ? Color.fromARGB(255, 18, 18, 18)
                        : const Color.fromARGB(255, 42, 42, 42),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 5,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: tasks[index].isDone
                                    ? ([Colors.grey, Colors.white])
                                    : ([Colors.blue, Colors.pink]))),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Container(
                            width: 300,
                            height: 55,
                            child: Text(
                              tasks[index].TaskName,
                              maxLines: 2,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: tasks[index].isDone
                                      ? Colors.grey
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 2),
                          child: Container(
                            width: 300,
                            height: 70,
                            child: Text(
                              tasks[index].TaskDesc,
                              maxLines: 4,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
          onTap: () {
            setState(() {
              tasks[index].isDone = !tasks[index].isDone;
              var snackBar = SnackBar(
                  elevation: 10,
                  padding:
                      EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
                  // shape: GradientBoxBorder(
                  //     width: 2,
                  //     gradient: LinearGradient(
                  //         colors: [Colors.blue, Colors.pink])),

                  action: SnackBarAction(
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      label: 'Undo',
                      onPressed: () {
                        setState(() {
                          tasks[index].isDone = !tasks[index].isDone;
                        });
                      }),
                  duration: Duration(milliseconds: 1200),
                  content: tasks[index].isDone
                      ? Text('Done with the Task ${tasks[index].TaskName}')
                      : Text('Undone the Task ${tasks[index].TaskName}'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          },
        );
      },
    );
  }

  Padding AllTaskHeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 40, bottom: 30),
      child: Text(
        'All Tasks',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }

  Padding MainListviewbuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        height: 200,
        child: ListView.builder(
          itemCount: priorityTasks.length,
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  priorityTasks[index].PriorityisDone =
                      !priorityTasks[index].PriorityisDone;
                  var snackBar = SnackBar(
                      elevation: 10,
                      padding: EdgeInsets.only(
                          bottom: 20, left: 20, right: 20, top: 20),
                      // shape: GradientBoxBorder(
                      //     width: 2,
                      //     gradient: LinearGradient(
                      //         colors: [Colors.blue, Colors.pink])),

                      action: SnackBarAction(
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              priorityTasks[index].PriorityisDone =
                                  !priorityTasks[index].PriorityisDone;
                            });
                          }),
                      duration: Duration(milliseconds: 1200),
                      content: tasks[index].isDone
                          ? Text(
                              'Done with Priority Task ${priorityTasks[index].PriorityTaskName}')
                          : Text(
                              'Undone the Priority Task ${priorityTasks[index].PriorityTaskName}'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      // color: Colors.amberAccent,

                      // border: Border.all(
                      //     color: priorityTasks[index].isDone
                      //         ? const Color.fromARGB(255, 67, 67, 67)
                      //         : Colors.deepPurple,
                      //     width: 3),
                      border: GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: !priorityTasks[index].PriorityisDone
                                ? ([Colors.blue, Colors.pink])
                                : ([
                                    const Color.fromARGB(255, 62, 62, 62),
                                    Color.fromARGB(255, 54, 54, 54)
                                  ]),
                          ),
                          width: 3),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              '${(index + 1).toString()} .',
                              style: TextStyle(
                                color: priorityTasks[index].PriorityisDone
                                    ? const Color.fromARGB(255, 67, 67, 67)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: priorityTasks[index].PriorityisDone
                                          ? Colors.green
                                          : Colors.red)),
                              child: priorityTasks[index].PriorityisDone
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, left: 8, top: 5, bottom: 5),
                                      child: Text(
                                        'Done',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 12),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, left: 8, top: 5, bottom: 5),
                                      child: Text(
                                        'Pending',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Text(
                          priorityTasks[index].PriorityTaskName,
                          style: TextStyle(
                              color: priorityTasks[index].PriorityisDone
                                  ? const Color.fromARGB(255, 67, 67, 67)
                                  : Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Text(
                          priorityTasks[index].PriorityTaskDesc,
                          maxLines: 3,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 10,
                              color: const Color.fromARGB(255, 71, 71, 71)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding HeadingPriorityTasks() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        'Priority Tasks',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }
}
