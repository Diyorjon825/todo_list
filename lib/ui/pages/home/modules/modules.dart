import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/library/widget/provider.dart';
import 'package:todo_list/ui/pages/home/home_page_model.dart';

class SingleGroupWidget extends StatelessWidget {
  final int indexGroup;
  const SingleGroupWidget({Key? key, required this.indexGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = NotifierProvider.read<HomePageModel>(context);
    final textGroup = model?.listGroup[indexGroup].name ?? "error";
    final color = (model?.currentGroup == indexGroup)
        ? Colors.amber.shade900
        : const Color.fromRGBO(7, 26, 82, 1);

    Future<void> _showAndroidDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you want delete this group'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () => model?.deleteGroup(context, indexGroup),
              ),
            ],
          );
        },
      );
    }

    Future<void> _showAioDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Do you want delete this group'),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ColoredBox(
                color: Colors.red,
                child: TextButton(
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => model?.deleteGroup(context, indexGroup),
                ),
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.09,
          child: AspectRatio(
            aspectRatio: 5 / 2.1,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.35),
                        offset: const Offset(3, 4),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  textGroup,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.026,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // IconButton(
                        //   splashRadius: 25,
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //     size: size.height * 0.02,
                        //   ),
                        //   color: Colors.white,
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => model?.changeGroup(indexGroup),
                      onLongPress: (Platform.isAndroid)
                          ? _showAndroidDialog
                          : _showAioDialog,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SingleTaskWidget extends StatelessWidget {
  final int indexTask;
  const SingleTaskWidget({Key? key, required this.indexTask}) : super(key: key);

  void hello(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = NotifierProvider.read<HomePageModel>(context);
    final text = model?.listTask[indexTask].task ?? "error";
    return Column(
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                flex: 2,
                onPressed: (context) => {model?.deleteTask(indexTask)},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(7, 26, 82, 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.35),
                  offset: const Offset(3, 4),
                  blurRadius: 10,
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.011),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          width: 30,
                          margin: EdgeInsets.all(size.height * 0.006),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: const Color.fromRGBO(215, 54, 247, 1),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.018),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}



// SizedBox(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(20),
//                     onTap: () {},
//                   ),
//                 ),
//               ),
//             )