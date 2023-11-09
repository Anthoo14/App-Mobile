import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: header_text(
                texto: 'Collections', color: Colors.black, fontSize: 17.0),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'CollectionsDetail');
    },
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Image(
            image: NetworkImage(
                'https://media.istockphoto.com/id/1485877072/es/foto/conjunto-de-coloridas-recetas-de-gastronom%C3%ADa-peruana-con-pollo-asado-los-domingos-muchas-papas.webp?b=1&s=170667a&w=0&k=20&c=Oc_GsvBmCd567f3a0UWJ5V8gxcsc0Xtqs3Bal49TmIY='),
            width: 165,
            height: 190,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 165,
          height: 190,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1.6),
              borderRadius: BorderRadius.circular(10)),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 35, bottom: 20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            header_text(
                texto: 'Peruvian',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
            header_text(
                texto: '190 places',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300)
          ]),
        )
      ],
    ),
  );
}
