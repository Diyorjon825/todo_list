import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: const Icon(Ionicons.menu,
                  color: Color.fromRGBO(156, 180, 249, 1), size: 28),
              onPressed: () {}),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Ionicons.search,
                      color: Color.fromRGBO(156, 180, 249, 1), size: 28),
                  onPressed: () {}),
              const SizedBox(width: 15),
              IconButton(
                  icon: const Icon(Ionicons.notifications_outline,
                      color: Color.fromRGBO(156, 180, 249, 1), size: 28),
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = GroupWidgetModelProvider.watch(context)?.model;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "What's up, Diyorjon",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'CATIGORIES',
              style: TextStyle(
                color: Color.fromRGBO(156, 180, 249, 1),
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 0,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SingleGroupWidget(indexGroup: index);
              },
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 20),
          //   child: Text(
          //     "TODAY'S TASKS",
          //     style: TextStyle(
          //       color: Color.fromRGBO(156, 180, 249, 1),
          //       fontSize: 15,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20),
          const Tasks(),
        ],
      ),
    );
  }
}

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
          height: 80,
          width: 220,
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
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        color: Colors.white,
                      )
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

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = GroupWidgetModelProvider.watch(context)?.model;
    Widget singleTask() {
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

    return const SizedBox.shrink();
  }
}
