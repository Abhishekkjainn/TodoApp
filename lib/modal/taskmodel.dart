// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TaskList {
  String TaskName;
  String TaskLastDate;
  bool isDone;
  String TaskDesc;
  TaskList({
    required this.TaskName,
    required this.TaskLastDate,
    required this.isDone,
    required this.TaskDesc,
  });

  static List<TaskList> getTask() {
    List<TaskList> tasks = [];
    tasks.add(TaskList(
        TaskName: 'Collect Parcel From Amazon',
        TaskLastDate: '16/2/24',
        isDone: false,
        TaskDesc:
            'Go To Amazon and show them the OTP and Collect Parcel From Them.'));

    tasks.add(TaskList(
        TaskName: 'Buy Copies From Balaji',
        TaskLastDate: '18/2/24',
        isDone: false,
        TaskDesc:
            'Go To Balaji. Select Copies. Pay them the money and Come Back.'));

    tasks.add(TaskList(
        TaskName: 'Attend Lab Class at Friday (Analog)',
        TaskLastDate: '19/2/24',
        isDone: false,
        TaskDesc:
            'Remaining Lab Class at Friday 5 pm for Analog Modulation Experiment'));

    tasks.add(TaskList(
        TaskName: 'Meet Client at the Restaurant',
        TaskLastDate: '16/2/24',
        isDone: false,
        TaskDesc:
            'Go to Greet and meet and Talk to the owner for completing his website'));

    tasks.add(TaskList(
        TaskName: 'Complete OrganiZ Developement',
        TaskLastDate: '14/2/24',
        isDone: false,
        TaskDesc:
            'Complete this app ASAP Add all the functionality and try to implement Database'));
    return tasks;
  }
}

class PriorityList {
  String PriorityTaskName;
  String PriorityTaskLastDate;
  bool PriorityisDone;
  String PriorityTaskDesc;
  PriorityList({
    required this.PriorityTaskName,
    required this.PriorityTaskLastDate,
    required this.PriorityisDone,
    required this.PriorityTaskDesc,
  });

  static List<PriorityList> getPriorTask() {
    List<PriorityList> priortasks = [];

    priortasks.add(PriorityList(
        PriorityTaskName: 'asdf',
        PriorityTaskLastDate: 'asdfasdfasdfasd',
        PriorityisDone: false,
        PriorityTaskDesc: 'asdfasdfasdfasdfasdfasdfasdf'));

    return priortasks;
  }
}
