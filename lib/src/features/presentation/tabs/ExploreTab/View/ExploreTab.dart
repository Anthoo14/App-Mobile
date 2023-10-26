import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              _topBar(context),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  alignment: Alignment.centerLeft,
                  child: header_text(
                      texto: "Discover new places",
                      color: Colors.black,
                      fontSize: 30.0)),
              _sliderCards(),
              _headers(context, 'Popular this week', 'Show all'),
              _populares(context,
                  "https://images.unsplash.com/photo-1484723091739-30a097e8f929?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YnJlYWtmYXN0fGVufDB8fDB8fHww"),
              _populares(context,
                  "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJyZWFrZmFzdHxlbnwwfHwwfHx8MA%3D%3D"),
              _populares(context,
                  "https://images.unsplash.com/photo-1533089860892-a7c6f0a88666?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJyZWFrZmFzdHxlbnwwfHwwfHx8MA%3D%3D"),
              const SizedBox(height: 13.0),
              _headers(context, "Collections", "Show all"),
              _sliderCollections()
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
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'Search'),
        child: Container(
          width: 305.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 20.0,
                color: gris,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7.0),
                child: Text(
                  'Search',
                  style: TextStyle(color: gris, fontSize: 17.0),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        width: 40.0,
        height: 40.0,
        margin: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 209, 214, 1.0),
            borderRadius: BorderRadius.circular(30.0)),
        child: IconButton(
          icon: const Icon(Icons.filter_list, size: 25.0, color: Colors.white),
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
    margin: const EdgeInsets.all(7.0),
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
              margin: const EdgeInsets.only(top: 10.0),
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
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 80.0,
                  height: 18.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: naranja,
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

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: header_text(texto: textHeader, fontSize: 20.0),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
            const Icon(Icons.play_arrow)
          ],
        ),
      ),
    ],
  );
}

Widget _populares(BuildContext context, String foto) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  image: NetworkImage(foto)),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: header_text(
                          texto: "Prueba 1",
                          color: Colors.black,
                          fontSize: 17.0)),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "87 Botsford Circle Apt",
                      style: TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: amarillo, size: 16.0),
                      const Text("4.5",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text("(230 ratings)",
                            style: TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 45.0),
                        width: 110.0,
                        height: 18.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: naranja,
                              elevation: 0.5),
                          onPressed: () {},
                          child: header_text(
                              texto: "Free Delivery",
                              color: Colors.white,
                              fontSize: 11.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget _sliderCollections() {
  return Container(
    height: 180.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _tarjetaCollection(context);
            });
      },
    ),
  );
}

Widget _tarjetaCollection(BuildContext context) {
  return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: const Image(
                width: 300,
                height: 150,
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnJ1bmNofGVufDB8fDB8fHww")),
          ),
        ],
      ));
}
