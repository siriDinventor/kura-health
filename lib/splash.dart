import 'package:flutter/material.dart';
import 'package:kura_health/main.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const KuraApp()));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(64, 188, 140, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Kura Health", style: TextStyle(fontSize: 40),),
            ],
          ),

      ),

    );
  }
}


