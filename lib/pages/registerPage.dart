import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mystore/main.dart';

class Registeratiom extends StatefulWidget {
  const Registeratiom({Key? key}) : super(key: key);

  @override
  State<Registeratiom> createState() => _RegisteratiomState();
}

class _RegisteratiomState extends State<Registeratiom> {
  @override
  final _registerformKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('images/main.jpeg'),
                SizedBox(height: 20),
                Text(
                  'Register',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _registerformKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: 'email'),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !(value.contains('@'))) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: 'password'),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length <= 5) {
                              return 'Password length must be 6 or more';
                            }
                            return null;
                          },
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.height / 3,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple),
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              if (_registerformKey.currentState!.validate()) {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text.trim(),
                                        password: passwordController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()));
                              }
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
