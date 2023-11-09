import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/header_double.dart';

import '../../commons_widgets/BackButtons/back_button.dart';
import '../../commons_widgets/Buttons/roundedButton.dart';
import '../../commons_widgets/Headers/headers.dart';

class PlaceDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: naranja,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          label: header_text(
              texto: 'Anadir a la cesta 95.40 PEN',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17.0)),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: naranja,
          expandedHeight: 400,
          flexibleSpace: FlexibleSpaceBar(
              background: Stack(
            children: [
              Image(
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1484980972926-edee96e0960d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fGZvb2R8ZW58MHx8MHx8fDA%3D')),
              Container(
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 1.4)),
                width: double.infinity,
                height: 350,
              ),
              Wrap(
                children: [
                  _promBtn(),
                  _infoPlaces(),
                  _infoPacesStats(),
                  _ofertBanner()
                ],
              )
            ],
          )),
          leading: Builder(builder: (BuildContext context) {
            return backButtton(context, Colors.white);
          }),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image(
                width: 28,
                height: 28,
                image: AssetImage('assets/share.png'),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _headers(texto: 'Populars'),
          _sliderCards(),
          _headers(texto: 'Full Menu'),
          _menuList(context),
          _headers(texto: 'Reviews'),
          _reviews(),
          _headers(texto: 'Your Rating'),
          _yourRating(),
          const SizedBox(
            height: 100.0,
          )
        ])),
      ]),
    );
  }
}

Widget _promBtn() {
  return Container(
    margin: const EdgeInsets.only(top: 121.0, left: 30.0, right: 15.0),
    width: double.infinity,
    height: 25.0,
    child: Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: naranja,
              elevation: 0.5),
          onPressed: () {},
          child: header_text(
              texto: 'Free Delivery', color: Colors.white, fontSize: 11.0),
        )
      ],
    ),
  );
}

Widget _infoPlaces() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: header_text(
            texto: 'BOON BOON BONBN BONBO BOBNB OBNB',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            Icon(Icons.location_on, color: gris),
            header_text(
                texto: '03 Jameson Manors Apt. 177',
                color: gris,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ],
        ),
      )
    ],
  );
}

Widget _infoPacesStats() {
  return Container(
    margin: const EdgeInsets.only(top: 26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 76.0,
    decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 19.0,
              ),
              header_text(
                  texto: '4.5',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            header_text(
                texto: "351 Rating",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40.0,
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 19.0,
              ),
              header_text(
                  texto: '137K',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            header_text(
                texto: "Favourites",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40.0,
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.photo,
                color: Colors.white,
                size: 19.0,
              ),
              header_text(
                  texto: '345',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            header_text(
                texto: "Photo",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
      ],
    ),
  );
}

Widget _ofertBanner() {
  return Container(
    color: const Color.fromRGBO(255, 237, 214, 1.0),
    padding: const EdgeInsets.all(20),
    height: 90.0,
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header_text(
                texto: 'New! Try Pickup',
                color: naranja,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
            header_text(
                texto:
                    'Pickup on your time. Your order is \n ready when you are.',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 13.0),
          ],
        ),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: naranja,
              elevation: 0.5),
          onPressed: () {},
          child: header_text(
              texto: 'Order Now', color: Colors.white, fontSize: 13.0),
        )
      ],
    ),
  );
}

Widget _headers({texto}) {
  return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: headerDoubleText(textHeader: texto, textAction: ''));
}

Widget _sliderCards() {
  return Container(
    height: 210.0,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cards();
        }),
  );
}

Widget _cards() {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            width: 200.0,
            height: 120.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnJlYWtmYXN0fGVufDB8fDB8fHww'),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: header_text(
                texto: 'Peanut Chaat whit Dahi',
                fontWeight: FontWeight.bold,
                fontSize: 15.0)),
        Container(
            alignment: Alignment.centerLeft,
            child: header_text(
                texto: '9.50 PEN',
                fontWeight: FontWeight.w500,
                color: gris,
                fontSize: 15.0)),
        Row(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: header_text(
                    texto: 'Selecciona',
                    color: naranja,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0)),
            Container(
                margin: const EdgeInsets.only(top: 10.0, left: 100),
                child: const Image(
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/plus_order.png'),
                )),
          ],
        )
      ],
    ),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(children: [
      _menuItem(context, 'salad', '2'),
      _menuItem(context, 'Chicken', '5'),
      _menuItem(context, 'Soups', '6'),
      _menuItem(context, 'Vegetables', '3'),
    ]),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemsCount) {
  return Container(
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: gris))),
    child: Column(
      children: [
        ListTile(
          title: header_text(
              texto: texto, fontWeight: FontWeight.w400, fontSize: 17.0),
          trailing: header_text(
              texto: itemsCount, fontWeight: FontWeight.w400, fontSize: 17.0),
        ),
        _sliderCards()
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 135.0,
    padding: const EdgeInsets.only(left: 10.0),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardReviews();
        }),
  );
}

Widget _cardReviews() {
  var lorem =
      'Lorem ipsum dolor sit amet, non eleifend erat. Morbi rutrum ipsum sit amet tortor condimentum, nec malesuada purus laoreet.';
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(top: 10, right: 10),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                width: 49.0,
                height: 43.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnJlYWtmYXN0fGVufDB8fDB8fHww'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header_text(
                      texto: 'Mike Tompson',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  header_text(
                      texto: '45 Reviews',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: gris)
                ],
              ),
            ),
            Spacer(),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: naranja,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header_text(
                          texto: '4',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: header_text(
              texto: lorem,
              color: gris,
              textAlign: TextAlign.left,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: header_text(
              texto: 'See full reviews',
              color: naranja,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget _yourRating() {
  var lorem =
      'Lorem ipsum dolor sit amet, non eleifend erat. Morbi rutrum ipsum sit amet tortor condimentum, nec malesuada purus laoreet.';
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: naranjawhitOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header_text(
                          texto: '1',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: naranjawhitOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header_text(
                          texto: '2',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: naranjawhitOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header_text(
                          texto: '3',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: naranja,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header_text(
                          texto: '4',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: naranjawhitOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      header_text(
                          texto: '5',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: header_text(
              texto: lorem,
              color: gris,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: header_text(
              texto: '+ Edit your review',
              color: naranja,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
