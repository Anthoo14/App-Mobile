import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/Profile_Detail_Page/View/Componets/avatar_view.dart';
import 'package:flutter_vscode/src/features/presentation/Profile_Detail_Page/View/Componets/textFields_view.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/utils/Extensions/screenSize.dart';
import 'package:flutter_vscode/src/utils/Styles/boxDecorationShadows.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        centerTitle: true,
        title: header_text(
            texto: 'Edit Profile', fontSize: 17, fontWeight: FontWeight.w500),
        backgroundColor: blanco,
        elevation: 0.5,
        leading: Builder(builder: (BuildContext context) {
          return backButtton(context, Colors.black);
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20, right: 15.0),
              child: header_text(
                  texto: 'Done',
                  color: naranja,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight.getsScreenHeight(
                      context: context, mutiplier: 0.1),
                  left: 15,
                  right: 15),
              decoration: createBoxDecorationWhitShadows(),
              width: screenWidth.getsScreenWidth(context: context),
              height: screenHeight.getsScreenHeight(
                  context: context, mutiplier: 0.65),
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, -60),
                    child: AvatarView(
                        backgroundImage:
                            'https://user-images.githubusercontent.com/138251036/277202730-b0b9a57d-4a99-4505-8fa7-fc352eca6cd2.jpg'),
                  ),
                  TextFieldsProfileDetailsView()
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
