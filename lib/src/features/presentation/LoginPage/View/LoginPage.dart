import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/widgets/back_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Image(
                    width: double.infinity,
                    height: 320.0,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1529892485617-25f63cd7b1e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80')),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: backButtton(context, Colors.white),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0.0, -20.0),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        const Text(
                          "Login to you account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        _emailInput(),
                        _passwordInput(),
                        _loginButton(context),
                        Container(
                          margin: const EdgeInsets.only(top: 23.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'ForgotPass');
                            },
                            child: const Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: gris,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'CreateAccount');
                                },
                                child: Container(
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: amarillo,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 16.0),
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _loginButton(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Tabs');
        },
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            elevation: 0.5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log in',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        )),
  );
}
