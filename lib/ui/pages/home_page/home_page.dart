import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_list/ui/pages/modules/modules.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
        elevation: 0,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Ionicons.menu,
                        color: Color.fromRGBO(156, 180, 249, 1), size: 28),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Ionicons.search,
                          color: Color.fromRGBO(156, 180, 249, 1),
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 15),
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
          )
        ],
      ),
      body: const BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "What's up Diyorjon",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "CATEGORIES",
            style: TextStyle(
              color: Color.fromRGBO(156, 180, 249, 1),
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((BuildContext context, int index) {
              return const SingleGroupWidget(indexGroup: 0);
            }),
          ),
        )
      ],
    );
  }
}
