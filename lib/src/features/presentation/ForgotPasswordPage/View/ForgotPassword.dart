import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/widgets/back_button.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButtton(context, Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: const Text(
                  "Please enter your email address. You will recive a link to create a new password via email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
              ),
              _emailInput(),
              _sendButton(context)
            ],
          ),
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
          hintText: 'Your email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sendButton(BuildContext context) {
  return Container(
    width: 370.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 40.0),
    child: ElevatedButton(
        onPressed: () {
          _showAlerta(context);
        },
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            elevation: 0.5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Send',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        )),
  );
}

void _showAlerta(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Container(
            height: 350,
            child: Column(
              children: [
                const Image(
                    image: AssetImage('assets/lock.png'),
                    width: 130,
                    height: 130),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: Text('Your password has been reset',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0))),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: Text(
                        "You'll  shortly receive an email whith a code to setup a new password.",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0))),
                _doneButton(context)
              ],
            ),
          ),
        );
      });
}

Widget _doneButton(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Login');
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
