import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:to/modal/taskmodel.dart';
import 'package:to/screens/AddTask.dart';
import 'package:to/screens/HomeScreen.dart';

class Home extends StatelessWidget {
  final String tname;
  final String tdesc;
  final bool tpriority;

  Home({
    super.key,
    required this.tname,
    required this.tdesc,
    required this.tpriority,
  });
  // String tname;
  // String tdesc;
  // bool

  bool isPriority = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          title: AppbarTitle(),
          actions: [Actionaddbutton(context)],
        ),
        body: HomeScreen(
          tdesc: tdesc,
          tname: tname,
          tpriority: tpriority,
        ));
  }

  Padding Actionaddbutton(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 0),
      child: DottedBorder(
        color: Colors.white,
        strokeWidth: 1,
        dashPattern: [8, 6],
        radius: Radius.circular(25),
        borderType: BorderType.Circle,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return AddTask();
              },
            ));
            // Navigator.push.(context, MaterialPageRoute(
            //   builder: (context) {
            //     return AddTask();
            //   },
            // ));
            // showModalBottomSheet(
            //   isScrollControlled: true,
            //   backgroundColor: Color.fromARGB(255, 16, 16, 16),
            //   context: context,
            //   builder: (context) {
            //     return Container(
            //       height: 550,
            //       width: double.infinity,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           AddTaskHeadingShowModal(),
            //         ],
            //       ),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.horizontal(
            //               left: Radius.circular(30),
            //               right: Radius.circular(30)),
            //           color: const Color.fromARGB(255, 26, 26, 26)),
            //     );
            //   },
            // );
          },
          child: Container(
            height: 50,
            width: 50,
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
              size: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }

  // Column AddTaskHeadingShowModal() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
  //         child: Container(
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(40),
  //               border: GradientBoxBorder(
  //                   gradient:
  //                       LinearGradient(colors: [Colors.blue, Colors.pink]),
  //                   width: 2)),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             child: Text(
  //               'Add Task',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 30, bottom: 10),
  //         child: Text(
  //           'Enter Task Name :',
  //           style: TextStyle(
  //               color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
  //         child: TextField(
  //           maxLines: null,
  //           decoration: InputDecoration(
  //               alignLabelWithHint: true,
  //               // enabled: true,
  //               hintText: 'Complete College Assignment',
  //               focusColor: Colors.pink,
  //               prefixIcon: Icon(CupertinoIcons.add_circled_solid),
  //               contentPadding:
  //                   EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //               focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.pinkAccent, width: 2)),
  //               border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.white, width: 2)),
  //               hintStyle: TextStyle(color: Color.fromARGB(255, 69, 69, 69)),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(
  //                       color: const Color.fromARGB(255, 107, 107, 107),
  //                       width: 2))),
  //           style: TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 30, bottom: 10),
  //         child: Text(
  //           'Enter Task Desc :',
  //           style: TextStyle(
  //               color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 20, right: 20),
  //         child: TextField(
  //           decoration: InputDecoration(
  //               alignLabelWithHint: true,
  //               // enabled: true,
  //               hintText: 'The Assignement given in DSA Class',
  //               focusColor: Colors.pink,
  //               prefixIcon: Icon(CupertinoIcons.info_circle_fill),
  //               contentPadding:
  //                   EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //               focusedBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.pinkAccent, width: 2)),
  //               border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(color: Colors.white, width: 2)),
  //               hintStyle: TextStyle(color: Color.fromARGB(255, 69, 69, 69)),
  //               enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(20),
  //                   borderSide: BorderSide(
  //                       color: const Color.fromARGB(255, 107, 107, 107),
  //                       width: 2))),
  //           style: TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 30, left: 20),
  //         child: GestureDetector(
  //           onTap: () {
  //             isPriority = !isPriority;
  //           },
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 border: !isPriority
  //                     ? Border.all(color: Colors.white, width: 2)
  //                     : GradientBoxBorder(
  //                         gradient: LinearGradient(
  //                             colors: [Colors.blue, Colors.pink]),
  //                         width: 2),
  //                 borderRadius: BorderRadius.circular(40)),
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  //               child: Text(
  //                 'Add To Priority',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding:
  //             const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 10),
  //         child: GestureDetector(
  //           onTap: () {
  //             print('Submit Button');
  //           },
  //           child: Container(
  //             alignment: Alignment.center,
  //             child: Text(
  //               'Add Task',
  //               style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
  //             ),
  //             height: 60,
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //                 color: Colors.white, borderRadius: BorderRadius.circular(40)),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Padding AppbarTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
          decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(colors: [Colors.blue, Colors.pink]),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
            child: Text(
              'OrganiZ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
