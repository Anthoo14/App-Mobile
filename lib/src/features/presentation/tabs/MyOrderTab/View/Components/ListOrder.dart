import 'package:flutter/material.dart';
import '../../../../../../Colors/Colors.dart';
import '../../../../Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import '../../../../Shared/Components/Texts/TextView/View/TextView.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title: TextView(
            texto: 'Orders',
            color: const ColorScheme.dark().onSecondary,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              const ListOrderCard(),
              const ListOrderCard(),
              const ListOrderCard()
            ]
          ))
        ],
      ),
    );
  }
}

class ListOrderCard extends StatelessWidget {
  const ListOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(248, 248, 248, 1.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(210, 211, 215, 1.0),
                spreadRadius: 1.0,
                blurRadius: 4.0)
          ]),
      child: Column(
        children: [
          const ListCardOrderHeader(),
          const ListCardOrderItems(),
          const SizedBox(height: 10),
          TextView(
            texto: 'See Order',
            fontSize: 17,
            color: pink,
            fontWeight: FontWeight.w400
          ),
          createElevatedButton(
            labelColor: white,
            labelButton: 'Order Again',
            color: orange,
            func: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ListCardOrderHeader extends StatelessWidget {
  const ListCardOrderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        margin: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                        child: TextView(
                            texto: "Resturante Pizzeria Da Michele en gracia",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on, color: greyColor, size: 16.0),
                              TextView(
                                  texto: "87 Botsford Circle Apt",
                                  color: greyColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0)
                            ],
                          )
                      ),
                    ],
                  ),
                  createElevatedButton(
                      width: 160,
                      height: 28,
                      labelColor: Colors.white,
                      labelButton: "Entregado - 21/07/21",
                      labelFontSize: 12,
                      color: Colors.green,
                      shape: const StadiumBorder(),
                      func: () {}
                  )
                ],
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const Image(
                    width: 54,
                    height: 54,
                    image: NetworkImage('https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ListCardOrderItems extends StatelessWidget {
  const ListCardOrderItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
                texto: '2 products',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.0)
          ],
        ),
        trailing: TextView(
            texto: '17.20 €',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      ),
    );
  }
}
