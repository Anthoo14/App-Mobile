import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/User/UserEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/AppBar/AppBarDoneView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:delivery/src/Utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';
import '../../../../../Utils/Helpers/DefaultImages/DefaultUserPhotoHelper.dart';
import 'Components/AvatarView.dart';
import 'Components/FieldsProfileView.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({ Key? key }) : super(key: key);

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> with FieldsProfileDetailViewDelegate, BaseView {

  String _actionText = "";
  late DefaultUserStateProvider _defaultUserStateProvider;
  UserEntity? newUser;

  @override
  Widget build(BuildContext context) {

    _defaultUserStateProvider = (context).getDefaultUserStateProvider();

    return Scaffold(
      appBar: createAppBarDone(actionText: _actionText, onTap: updateUserData, title: 'Profile'),
      body: (context).isLoading() ? loadingView : CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(margin: EdgeInsets.only(
                    top: getScreenHeight(context: context, multiplier: 0.05),
                    left: 16,
                    right: 16),
                padding: const EdgeInsets.only(bottom: 32),
                decoration: getBoxDecorationWithShadows(),
                width: getScreenWidth(context: context),
                child: Column(
                  children: [
                    Transform.translate(
                        offset: Offset(0, -getScreenHeight(context: context, multiplier: 0.03)),
                        child: AvatarProfileDetailView(backgroundImage: _defaultUserStateProvider.userData?.photo ?? DefaultUserPhotoHelper.defaultUserPhoto)),
                    FieldsProfileDetailView(userData: _defaultUserStateProvider.userData, delegate: this)
                  ],
                )),
            SizedBox(height: getScreenHeight(context: context, multiplier: 0.1))
          ]))
        ],
      ),
    );
  }

  updateUserData() {
    if (newUser == null) { return; }

    setState(() {
      (context).setLoadingState(isLoading: true);
    });

    _defaultUserStateProvider.updateUserData(user: newUser!)
        .then((result) {
      setState(() {
        (context).setLoadingState(isLoading: false);
        _actionText = "";
      });
    }, onError: (e) {
      setState(() {
        (context).setLoadingState(isLoading: false);
        (context).showErrorAlert(context: context, message: AppFailureMessages.unExpectedErrorMessage);
      });
    });
  }

  @override
  userDataChanged({ required UserEntity? newUser }) {
    setState(() {
      if(newUser?.username?.isNotEmpty ?? false) {
        this.newUser = newUser;
        _actionText = "Save";
      } else {
        _actionText = "";
      }
    });
  }
}
