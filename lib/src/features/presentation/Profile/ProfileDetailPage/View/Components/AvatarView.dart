import 'package:delivery/src/Utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';

import '../../../../../../Colors/colors.dart';

@immutable
class AvatarProfileDetailView extends StatelessWidget {
  final String backgroundImage;

  const AvatarProfileDetailView({required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          decoration: getBoxDecorationWithShadows(
              borderRadius: BorderRadius.circular(65)),
          child: CircleAvatar(backgroundImage: NetworkImage(backgroundImage)),
        )
      ],
    );
  }
}

// TODO: Para usar luego quizás
/*Transform.translate(
          offset: const Offset(0, -35),
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: pink, borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.camera_alt,
                color: white,
                size: 20,
              )),
        )*/