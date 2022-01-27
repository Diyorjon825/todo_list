import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_list/library/widget/provider.dart';
import 'package:todo_list/ui/pages/home/modules/modules.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
        elevation: 0,
        actions: const [_AppBarIcons()],
      ),
      body: const BodyWidget(),
    );
  }
}

class _AppBarIcons extends StatelessWidget {
  const _AppBarIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Ionicons.menu,
                  color: const Color.fromRGBO(156, 180, 249, 1),
                  size: size.height * 0.033),
              onPressed: () {},
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Ionicons.search,
                    color: const Color.fromRGBO(156, 180, 249, 1),
                    size: size.height * 0.033,
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: size.height * 0.002),
                IconButton(
                  icon: const Icon(
                    Ionicons.notifications_outline,
                    color: Color.fromRGBO(156, 180, 249, 1),
                    size: 28,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<HomePageModel>(context);
    final size = MediaQuery.of(context).size;
    final spaceWithElements = size.height * 0.01;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            "What's up Diyorjon",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.033,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: spaceWithElements),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GROUPS",
                style: TextStyle(
                  color: const Color.fromRGBO(156, 180, 249, 1),
                  fontSize: size.height * 0.018,
                ),
              ),
              IconButton(
                  onPressed: () => model?.addNewGroup(context),
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromRGBO(156, 180, 249, 1),
                  ))
            ],
          ),
        ),
        SizedBox(height: spaceWithElements),
        SizedBox(
          height: size.height * 0.12,
          child: ListView.builder(
            itemCount: model?.listGroup.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((BuildContext context, int index) {
              return SingleGroupWidget(indexGroup: index);
            }),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 30, right: 30, bottom: spaceWithElements),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TASKS",
                style: TextStyle(
                  color: const Color.fromRGBO(156, 180, 249, 1),
                  fontSize: size.height * 0.018,
                ),
              ),
              IconButton(
                onPressed: () => model?.addNewTask(context),
                icon: const Icon(
                  Icons.add,
                  color: Color.fromRGBO(156, 180, 249, 1),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: model?.listTask.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((BuildContext context, int index) {
              return SingleTaskWidget(indexTask: index);
            }),
          ),
        )
      ],
    );
  }
}

// Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 20),
//         const Padding(
//           padding: EdgeInsets.only(left: 20),
//           child: Text(
//             "What's up Diyorjon",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Padding(
//           padding: EdgeInsets.only(left: 20),
//           child: Text(
//             "CATEGORIES",
//             style: TextStyle(
//               color: Color.fromRGBO(156, 180, 249, 1),
//               fontSize: 15,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//             itemCount: 5,
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: ((BuildContext context, int index) {
//               return const SingleGroupWidget(indexGroup: 0);
//             }),
//           ),
//         )
//       ],
//     )
