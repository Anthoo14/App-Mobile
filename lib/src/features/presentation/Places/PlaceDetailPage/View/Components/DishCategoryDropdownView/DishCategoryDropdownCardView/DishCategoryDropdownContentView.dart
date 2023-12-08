import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/DishCategoryDropdownView/DishCategoryDropdownCardView/SelectRowView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../Colors/colors.dart';

class DishCategoryDropdownContentView extends StatelessWidget {

  final defaultCarrouselHeight = 200.0;
  final fakeDishes = [1,1,1,1];

  DishCategoryDropdownContentView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getColumnChildrens(fakeDishes),
    );
  }

  bool isItemInOrderList() {
    return true;
  }

  List<Widget> getColumnChildrens(List<dynamic> fakeDishes) {
    return fakeDishes.map((e) => DishCategoryCarrouselCardView(isSelected: isItemInOrderList() )).toList();
  }
}

class DishCategoryCarrouselCardView extends StatelessWidget {
  bool isSelected = false;

  DishCategoryCarrouselCardView({ Key? key, required this.isSelected }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(context: context),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
              width: getScreenWidth(context: context),
              height: 50.0,
              fit: BoxFit.cover,
              image: const NetworkImage('https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
        ),
        Container(
          width: getScreenWidth(context: context),
          margin: const EdgeInsets.only(top: 10),
          child: const Text(
            "Pizza Margarita la mejor del mundo",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Row(
          children: [
            const TextView(
                texto: "9.50 €",
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: greyColor),
            const Spacer(),
            IconButton(
                padding: const EdgeInsets.only(left:24, right: 0),
                icon: const Icon(
                  Icons.add_circle,
                  color:  orange,
                  size: 24,
                ),
                onPressed: () {})
          ],
        ),
        Transform.translate(
            offset: Offset(0, -5),
            child: Column(
              children: [
               // SelectRowView(isSelected: isSelected),
              //  SelectRowView(isSelected: isSelected)
              ],
            ))
      ]),
    );
  }
}


