import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1517433367423-c7e5b0f35086?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2002&q=80'))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: const Text(
                  'DELIVERED FAST FOOD TO YOUR DOOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                child: const Text(
                  'Set exact location to find the right restaurants near you.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0),
                ),
              ),
              Container(
                width: 350.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Login');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
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
              ),
              Container(
                width: 350.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color.fromRGBO(0, 122, 255, 1.0),
                        elevation: 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/facebook.png'),
                          width: 20.0,
                          height: 20.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: const Text(
                            'Connect whit Facebook',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
