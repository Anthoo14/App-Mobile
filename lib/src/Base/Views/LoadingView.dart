
import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
// Ajusta la altura según sea necesario
              width: 200,  // Ajusta el ancho según sea necesario
              height: 200,
              child: Image.asset('assets/loading.gif'),
            ),
            CircularProgressIndicator(
              backgroundColor: orange,
            ),
            SizedBox(height: 10),
            Text('Loading...')
          ],
        ),
      ),
    );
  }
}
