import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/User/UserEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/TextFormField/CustomTextFormFields.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';
import '../../../../../../Utils/Styles/BoxShadowDecoration.dart';

mixin FieldsProfileDetailViewDelegate {
  userDataChanged({ required UserEntity? newUser });
}

class FieldsProfileDetailView extends StatelessWidget with TextFormFieldDelegate, BaseView {

  final Decoration? _decoration = borderSideNoneDecoration;
  final UserEntity? userData;
  final FieldsProfileDetailViewDelegate? delegate;

  FieldsProfileDetailView({ super.key,
                            required this.userData,
                            required this.delegate });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: CustomTextFormField(
                delegate: this,
                hintext: 'Username',
                textFormFieldType: CustomTextFormFieldType.username,
                decoration: _decoration,
                initialValue: userData?.username,
                icon: const Icon(Icons.person_outline, color: orange),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: CustomTextFormField(
              delegate: this,
              hintext: 'Phone',
              textFormFieldType: CustomTextFormFieldType.phone,
              decoration: _decoration,
              initialValue: userData?.phone,
              icon: const Icon(Icons.phone_iphone_outlined, color: orange),
            ),
          ),
          const Divider(),
          const SizedBox(height: 4),
          userData?.provider == UserAuthProvider.emailAndPassword ? _ChangeEmailView() : Container(),
          userData?.provider == UserAuthProvider.emailAndPassword ? _ChangePasswordView() : Container(),
          ListTile(
            leading: const Icon(Icons.credit_card_outlined, color: orange),
            title: const Text('Change Payment Methods',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400)
            ),
            trailing: const Icon(Icons.chevron_right, color: greyColor),
            onTap: () {
              coordinator.showChangePaymentsMethodsPage(context: context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delivery_dining_outlined, color: orange),
            title: const Text('Change Delivery Address',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400)
            ),
            trailing: const Icon(Icons.chevron_right, color: greyColor),
              onTap: () {
                coordinator.showChangeDeliveryAddress(context: context);
              }
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.file_copy_outlined, color: orange),
            title: Text('Billing information',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400)
            ),
            trailing: Icon(Icons.chevron_right, color: greyColor),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.privacy_tip_outlined, color: orange),
            title: Text('Manage Privacy',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400)
            ),
            trailing: Icon(Icons.chevron_right, color: greyColor),
          )
        ],
      ),
    );
  }

  @override
  onChanged({ required String newValue,
              required CustomTextFormFieldType customTextFormFieldType}) {

    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.username:
        userData?.username = newValue;
        delegate?.userDataChanged(newUser: userData);
        break;
      case CustomTextFormFieldType.phone:
        userData?.phone = newValue;
        delegate?.userDataChanged(newUser: userData);
        break;
      default:
        break;
    }

  }
}

class _ChangeEmailView extends StatelessWidget with BaseView {

  _ChangeEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.email_outlined, color: orange),
          title: const Text('Change Email',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400)
          ),
          trailing: const Icon(Icons.chevron_right, color: greyColor),
          onTap: () {
            coordinator.showEditEmailPage(context: context);
          },
        ),
        const Divider()
      ],
    );
  }
}

class _ChangePasswordView extends StatelessWidget with BaseView {

  _ChangePasswordView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.lock_outline, color: orange),
          title: const Text('Change Password',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400)
          ),
          trailing: const Icon(Icons.chevron_right, color: greyColor),
          onTap: () {
            coordinator.showEditPasswordPage(context: context);
          },
        ),
        const Divider()
      ],
    );
  }
}





