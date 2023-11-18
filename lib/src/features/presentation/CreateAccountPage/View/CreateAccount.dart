import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Base/Views/BaseView.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/CreateAccountPage/ViewModel/SignUpViewModel.dart';
import 'package:flutter_vscode/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatelessWidget with BaseView{

  final SignUpViewModel _viewModel;
  CreateAccount({SignUpViewModel? viewModel}): _viewModel = viewModel ?? DefaultSignUpViewModel();



  @override
  Widget build(BuildContext context) {

      _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));
    return _viewModel.loadingState.isLoading ? loadingView :  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButtton(context, Colors.black);
        }),
      ),
      body: CustomScrollView(
       slivers: [
         SliverList(delegate: SliverChildListDelegate([
           Center(
             child:
             Form(
               key:_viewModel.formKey ,
               autovalidateMode: AutovalidateMode.onUserInteraction,
               child: Container(
               padding: const EdgeInsets.all(30.0),
               child: Column(
                 children: [
                   header_text(
                       texto: "Create an Account",
                       color: primaryColor,
                       fontSize: 40.0),
                  SizedBox(height: 30.0,),
                  // _usernameInput(context),
                   //_emailInput(context),
                   //_phoneInput(context),
                   //_dateOfBirth(context),
                   //_passwordInput(context),
                   CustomTextFormField(textFormFieldType: CustomTextFormFieldType.username, hintext: 'Username', delegate: _viewModel),
                   CustomTextFormField(textFormFieldType: CustomTextFormFieldType.email, hintext: 'Email', delegate: _viewModel),
                   CustomTextFormField(textFormFieldType: CustomTextFormFieldType.phone, hintext: 'Phone', delegate: _viewModel),
                   GestureDetector(onTap:()=> _selectDate(context) ,child: AbsorbPointer(child:CustomTextFormField(textFormFieldType: CustomTextFormFieldType.dateOfBirth, controller: _viewModel.dateController,hintext: 'Date of Birth', delegate: _viewModel), ),),
                   CustomTextFormField(textFormFieldType: CustomTextFormFieldType.password, hintext: 'Password', delegate: _viewModel),
                   createElevatedButton(
                       labelButton: 'Sing Up',
                       color: naranja,
                       shape: const StadiumBorder(),
                       func: () {
                        _ctaTapped(context);
                       }),
                   Container(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 20.0, vertical: 40.0),
                     child: const Text(
                       'By Clicking Sign Up you agree to the following Terms and Conditions whitout ',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w400,
                           fontSize: 13.0),
                     ),
                   )
                 ],
               ),
             ),)
           ),
         ]))
       ],
      ),
    );
  }


}

extension UserAction on CreateAccount {
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _viewModel.selectedDate,
        firstDate: DateTime(1960, 1),
        lastDate: DateTime(2100),
        locale: const Locale('es','')
    );

    if (picked != null && picked != _viewModel.selectedDate) {
      _viewModel.signUpModel?.date = "${ picked.toLocal().day }/${ picked.toLocal().month }/${ picked.toLocal().year }";
      _viewModel.dateController.text = "${ picked.toLocal().day }/${ picked.toLocal().month }/${ picked.toLocal().year }";
    }
  }

  void _ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel.signUp().then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, "Tabs");
          case ResultStatus.error:
            errorStateProvider.setFailure(
                context: context, value: result.error!);
        }
      });
    }
  }


}
