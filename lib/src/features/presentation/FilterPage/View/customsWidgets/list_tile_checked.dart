import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Texts/textView.dart';

class ListTileCheck extends StatefulWidget {
  final String texto;
  final bool isActive;
  final Function()? func;

  const ListTileCheck(
      {Key? key,
      required this.texto,
      required this.isActive,
      required this.func})
      : super(key: key);

  @override
  State<ListTileCheck> createState() => _ListTileCheck();
}

class _ListTileCheck extends State<ListTileCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      listTiles(
          context: context,
          texto: widget.texto,
          isActive: widget.isActive,
          func: widget.func),
    ]);
  }
}

Widget listTiles(
    {required BuildContext context,
    texto = String,
    isActive = bool,
    Function()? func}) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      onTap: func,
      title: TextView(
          texto: texto,
          color: isActive ? naranja : Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 17),
      trailing: isActive
          ? Icon(
              Icons.check,
              color: isActive ? naranja : gris,
            )
          : const Text(''),
    ),
  );
}
