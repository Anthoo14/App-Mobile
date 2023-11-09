import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/utils/Styles/boxDecorationShadows.dart';

import '../../../../../Colors/colors.dart';

@immutable
class AvatarView extends StatelessWidget {
  final String backgroundImage;

  const AvatarView({required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          decoration: createBoxDecorationWhitShadows(
              borderRadius: BorderRadius.circular(65)),
          child: CircleAvatar(
            backgroundImage: NetworkImage(backgroundImage),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: rosa, borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.camera_alt,
              color: blanco,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
