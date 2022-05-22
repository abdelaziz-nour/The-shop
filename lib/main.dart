import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/mainPage.dart';
import 'pages/registerPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _LoginformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      key: _scaffoldKey,
      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Column(
            children: [
              Center(
                child: Image.asset('images/main.jpeg'),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: const Text(
                  'The Shop',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _LoginformKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Email Address'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.height / 3,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          onPressed: () async {
                            if (_LoginformKey.currentState!.validate()) {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  MainPage(emailController.text.trim())),
                                );
                              } catch (e) {
                                _scaffoldKey.currentState!.showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Incorrect email or password',
                                            style: TextStyle(fontSize: 20))));
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registeratiom()),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}