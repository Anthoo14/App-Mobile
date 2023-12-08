import 'package:delivery/src/Utils/Validators/FormValidators.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';
import '../../ViewModel/UpdatePasswordViewModel.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {

  // Properties
  final UpdatePasswordViewModel viewModel;
  const TextFormFieldEmailUpdatePassword({ Key? key, required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          onChanged: (newValue) => viewModel.email = newValue,
          validator: (value) => EmailFormValidator.validateEmail(email: value ?? ''),
        ));
  }
}