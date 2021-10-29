import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:owaste_proyek2/auth/Login.dart';
import 'package:owaste_proyek2/auth/SignUp.dart';
import 'package:owaste_proyek2/home.dart';
import 'package:owaste_proyek2/home_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:owaste_proyek2/widget/deliveryScreen.dart';
import 'package:owaste_proyek2/widget/Direction.dart';
import 'package:provider/provider.dart';
import 'package:owaste_proyek2/widget/Direction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp()
    
  //   MaterialApp(
  //   theme: ThemeData(primaryColor: Colors.purple),
  //   debugShowCheckedModeBanner: false,
  //   home: 
  //   DeliveryScreen(),
  //   // LoginPage(),
  //   routes: {
  //     '/home': (context) => const Home_page(),
  //   },
  //   // Home_page(),
  // ),
    );
}

// DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Direction(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.purple),
        home: 
        LoginPage(),
        // DeliveryScreen(),
        routes: {
      '/home': (context) => const HomeScreen(),
    },
      ),
    );
  }
}




class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF8A2387),
                Color(0xFFE94057),
                Color(0xFFF27121),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset('images/organic.png'),
              SizedBox(
                height: 15,
              ),
              Text(
                'Organic Waste',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Login To Your Account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    // Container(
                    //   width: 250,
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //         labelText: 'Email Addres',
                    //         suffixIcon: Icon(
                    //           FontAwesomeIcons.envelope,
                    //           size: 17,
                    //         )),
                    //   ),
                    // ),
                    // Container(
                    //   width: 250,
                    //   child: TextField(
                    //     obscureText: true,
                    //     decoration: InputDecoration(
                    //         labelText: 'Password',
                    //         suffixIcon: Icon(
                    //           FontAwesomeIcons.eyeSlash,
                    //           size: 17,
                    //         )),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Text(
                    //         'Forgot Password',
                    //         style: TextStyle(
                    //           color: Colors.orangeAccent[700],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0xFFE94057),
                                  Color(0xFFF27121),
                                ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => Login());
                                Navigator.push(context, route);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => SignUp());
                                Navigator.push(context, route);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                              ),
                              // ButtonStyle style:Colors.amberAccent,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Or Login Using Social Media',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SignInButton(
                          Buttons.Google, 
                          onPressed: () {}
                          )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
