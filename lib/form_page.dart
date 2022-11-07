import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:kura_health/alarm_page.dart';
class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String name;
  late String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Form(
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(tag: 'tag', child: Image.asset('Image/Lotus.png')),
                    const SizedBox(height: 48,),
                    const Text('Your First Name'),
                    Container(
                      height: 50,
                      width: 400.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.0)),
                        color: Colors.white,
                      ),
                      child: TextField(onChanged: (value){
                        name = value;
                      }, decoration: const InputDecoration(
                          hintText: 'eg: Jane Doe',
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    const Text('Your Email'),
                    Container(
                      height: 50,
                      width: 400.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.0)),
                        color: Colors.white,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){
                        email = value;
                      }, decoration: const InputDecoration(
                          hintText: 'Type your search',
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    const Text("Create Password"),

                    Container(
                      height: 50,
                      width: 400.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.0)),
                        color: Colors.white,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true, onChanged: (value){
                        password = value;
                      },
                        decoration: const InputDecoration(
                          hintText: 'Type your search',
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    // ElevatedButton(onPressed: () async {
                    //   try {
                    //     final newUser = _auth.createUserWithEmailAndPassword(
                    //         email: email, password: password);
                    //   }
                    //   catch(e) {
                    //     print(e);
                    //   }
                    //   },
                    //     child:const Text('Register'))
                  ],
              ),
            ),
          ),
        ),
        // body: ListView(

        // ),
      ),
    );
  }
}
