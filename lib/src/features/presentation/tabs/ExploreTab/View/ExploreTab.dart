import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ExploreTabs extends StatelessWidget {
  const ExploreTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              _topBar(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Discover new places",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              _sliderCards()
            ]),
          )
        ]))
      ],
    ));
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 305.0,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(234, 236, 239, 1.0)),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 20.0,
              color: gris,
            ),
            Container(
              margin: EdgeInsets.only(left: 7.0),
              child: Text(
                'Search',
                style: TextStyle(color: gris, fontSize: 17.0),
              ),
            )
          ],
        ),
      ),
      Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(209, 209, 214, 1.0),
            borderRadius: BorderRadius.circular(30.0)),
        child: IconButton(
          icon: Icon(Icons.filter_list, size: 25.0, color: Colors.white),
          onPressed: () {},
        ),
      )
    ],
  );
}

Widget _sliderCards() {
  return Container(
    height: 350.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _card(context);
          },
        );
      },
    ),
  );
}

Widget _card(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(7.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
              width: 210,
              height: 250.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1980&q=80')),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: const Text(
                "Andy & Cindy's diner",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "87 Botsford Circle Apt",
                style: TextStyle(
                    color: gris, fontWeight: FontWeight.w500, fontSize: 13.0),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: amarillo,
                  size: 16.0,
                ),
                const Text("4.8",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
                Text("(233 ratings)",
                    style: TextStyle(
                        color: gris,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: 80.0,
                  height: 18.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        elevation: 0.5),
                    onPressed: () {},
                    child: const Text(
                      'Delivery',
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}
