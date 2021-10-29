import 'package:flutter/material.dart';
import 'package:owaste_proyek2/widget/deliveryScreen.dart';
// import 'package:owaste/screens/maps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Builder(
        //   // builder: (context) => MapsScreen(),
        // ),

        Container(
          width: double.infinity,
          height: 75,
          color: Colors.orangeAccent.shade400,
          child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/order.png',
                      width: 20,
                    ),
                    Text(
                      'order',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SulphurPoints'),
                    ),
                    Image.asset(
                      'images/home.png',
                      width: 20,
                    ),
                    Text('home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SulphurPoints')),
                    Image.asset(
                      'images/history.png',
                      width: 20,
                    ),
                    Text('history',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SulphurPoints')),
                  ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: (60)),
          child: Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0)),
            ),
          ),
        ),
        // Image.asset('assets/image/map2.png'),
        Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'images/search.png',
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('tentukan lokasi anda'),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'images/account.png',
                  height: 30,
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 120, left: 15),
          child: Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10.0),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Container(
                  width: 320,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.orangeAccent.shade400,
                  ),
                ),
                SizedBox(width: 30),
                // Image.asset(
                //   'assets/images/rp.png',
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 550, left: 15),
          child: Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10.0),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => DeliveryScreen());
                                Navigator.push(context, route);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                              ),
                              // ButtonStyle style:Colors.amberAccent,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Maps',
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
      ],
    ));
  }
}
