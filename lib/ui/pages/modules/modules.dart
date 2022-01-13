import 'package:flutter/material.dart';
import 'package:todo_list/domain/data/task/task.dart';

class SingleGroupWidget extends StatelessWidget {
  final int indexGroup;
  const SingleGroupWidget({Key? key, required this.indexGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = GroupWidgetModelProvider.watch(context)?.model;
    // final text = model?.listGroup[indexGroup].name ?? '';
    return Column(
      children: [
        SizedBox(
          height: 130,
          width: 250,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            children: const [
                              SizedBox(height: 10),
                              Text(
                                'text',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                      // IconButton(
                      //   splashRadius: 25,
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      //   color: Colors.white,
                      // )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SingleTaskWidget extends StatelessWidget {
  final Task task;
  const SingleTaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Stack(
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(215, 54, 247, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'hello',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
