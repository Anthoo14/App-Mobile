import 'package:delivery/src/Colors/Colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import '../../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../Shared/Components/TextFormField/CustomTextFormFields.dart';

mixin EmailTextFieldCardViewDelegate {
  emailChanged({ required String email });
}

class EmailTextFieldCardView extends StatelessWidget with TextFormFieldDelegate {

   Decoration? decoration;
   final EmailTextFieldCardViewDelegate? delegate;

   String title = "";
   String? initialValue;

   EmailTextFieldCardView({ Key? key,
                            required this.delegate,
                            required this.title,
                            this.decoration,
                            this.initialValue }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
           Text(title,
               style: const TextStyle(fontSize: 15, color: accentColor )
           ),
          const SizedBox(height: 8),
          CustomTextFormField(
            delegate: this,
            hintext: 'Email',
            textFormFieldType: CustomTextFormFieldType.email,
            decoration: decoration ?? defaultTextFieldDecoration,
            initialValue: initialValue,
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }

  @override
  onChanged({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        delegate?.emailChanged(email: newValue);
        break;
      default:
        break;
    }
  }
}
