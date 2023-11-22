import 'package:flutter/material.dart';
import 'package:vehical_rental_system/details1.dart';
import 'package:vehical_rental_system/details2.dart';
import 'package:vehical_rental_system/details3.dart';
import 'details.dart';
import 'history.dart';
//import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as custom_badges;
import 'package:flutter_app_badger/flutter_app_badger.dart';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: const Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Choose',style: TextStyle(
                    fontStyle:FontStyle.italic
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('Your',style: TextStyle(
                      fontStyle:FontStyle.italic
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Vehical',style: TextStyle(
                    //color: Colors.,
                      color:Color(0xFFFFD700), // Hexadecimal color code: FF0080FF (Alpha, R, G, B)
                    fontSize: 25,
                    fontStyle:FontStyle.normal,

                     //fontSize: 20,

                  ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 5,),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('FOR',style: TextStyle(
                    color: Colors.blueAccent,

                    fontStyle:FontStyle.normal,
                    fontSize: 30,


                    //fontSize: 20,

                  ),
                  ),
                ),
                SizedBox(width: 10,),
                Padding(
                  padding:EdgeInsets.all(0.0

                  ),
                  child: Text('RENT',style: TextStyle(
                    fontStyle:FontStyle.normal,
                    color: Colors.blueAccent,
                    fontSize: 30,


                    //fontSize: 20,

                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
        //centerTitle: true,
        toolbarHeight: 150
        ,

        actions: [
          //_buildIconWithBadge(Icons.shopping_basket_outlined,5),

          InkWell(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>History()));
            },
            child: Icon(
              Icons.list_alt_outlined,
              size: 35,
              shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    blurRadius: 9,
                    spreadRadius: 9,
                    offset: Offset(4,4),
                  )
              ],

            ),
          ),
          const SizedBox(width: 30.0),

        ],
      ),

      body: Column(
        children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  const EdgeInsets.all(10.0),
                child: Material(
                    elevation: 50, // Set the elevation value here
                    borderRadius: BorderRadius.circular(20),

                    child: Container(
                        width: screenWidth * 0.4,
                        height:  screenHeight * 0.32,




                    decoration: BoxDecoration(
                      color:Colors.white70,
                      borderRadius: BorderRadius.circular(10),

                        // boxShadow:[
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.9),
                        //       blurRadius: 3,
                        //       spreadRadius: 5,
                        //       offset: const Offset(3,-3)
                        //     )
                        // ]
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                             children : [
                                   Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5CHK6n4xtcpFyZvlZ80v7_AjWWasQiXDpLz5N86cN38RpZNQuGdR1HeGoCKFH4wWMcyY&usqp=CAU' ,height:screenHeight * 0.2,width: screenWidth * 0.8, ),

                               const Text('Electric Bike',style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.blueAccent,
                               ),),

                               const SizedBox(height: 10,),

                               InkWell(

                                 onTap: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => const Details()),
                                   );
                                 },
                                 child: Container(
                                   width: 75,
                                   height:25,

                                   decoration: BoxDecoration(
                                     color: Colors.greenAccent,
                                     borderRadius: BorderRadius.circular(5),
                                   ),


                                   child: const Center(
                                     child: Text(' RENT ', style: TextStyle(
                                       color: Colors.white70,
                                     ),),
                                   ),

                                 ),
                               )

                             ],
                      ),
                    ),





                    ),

                ),
              ),

              Padding(
                padding:  const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 50, // Set the elevation value here
                  borderRadius: BorderRadius.circular(20),
                  child: Container(

                      width: screenWidth * 0.4,
                      height:  screenHeight * 0.32,



                    decoration: BoxDecoration(
                        color:Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow:[
                        //   BoxShadow(
                        //       color: Colors.grey.withOpacity(0.9),
                        //       blurRadius: 3,
                        //       spreadRadius: 5,
                        //       offset: const Offset(3,-3)
                        //   )
                        // ]

                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children : [
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5CHK6n4xtcpFyZvlZ80v7_AjWWasQiXDpLz5N86cN38RpZNQuGdR1HeGoCKFH4wWMcyY&usqp=CAU',height: screenHeight * 0.2,width: screenWidth * 0.8,  ),

                          const Text('Mountain Bike',style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent

                          ),),

                          const SizedBox(height: 10,),

                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Details1()),
                              );
                            },
                            child: Container(
                              width: 75,
                              height:25,

                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                child: Text(' RENT ', style: TextStyle(
                                  color: Colors.white70,
                                ),),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),





                  ),
                ),
              ),
            ],
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 50,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(

                      width: screenWidth * 0.4,
                      height:  screenHeight * 0.32,



                    decoration: BoxDecoration(
                        color:Colors.white70,
                        borderRadius: BorderRadius.circular(10),

                        boxShadow:[
                  //   BoxShadow(
                  //   color: Colors.grey.withOpacity(0.9),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: const Offset(3,-3),
                  // )
        ]
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children : [
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5CHK6n4xtcpFyZvlZ80v7_AjWWasQiXDpLz5N86cN38RpZNQuGdR1HeGoCKFH4wWMcyY&usqp=CAU',height: screenHeight * 0.2,width: screenWidth * 0.8,  ),

                          const Text('Bike',style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent
                          ),),

                          const SizedBox(height: 10,),

                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Details2()),
                              );
                            },
                            child: Container(
                              width: 75,
                              height:25,

                              decoration: BoxDecoration(
                                 color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(6),


                              ),
                              child: const Center(
                                child: Text(' RENT ', style: TextStyle(
                                  color: Colors.white70,
                                ),),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),





                  ),
                ),
              ),

              Padding(
                padding:  const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 50,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(

                       width: screenWidth * 0.4,
                       height:  screenHeight * 0.32,



                    decoration: BoxDecoration(

                        color:Colors.white70,
                        borderRadius: BorderRadius.circular(10),
    // boxShadow:[
    // BoxShadow(
    // color: Colors.grey.withOpacity(0.9),
    // blurRadius: 3,
    // spreadRadius: 5,
    // offset: const Offset(3,-3)
    // )
    // ]
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children : [
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5CHK6n4xtcpFyZvlZ80v7_AjWWasQiXDpLz5N86cN38RpZNQuGdR1HeGoCKFH4wWMcyY&usqp=CAU',height: screenHeight * 0.2,width: screenWidth * 0.8,  ),

                          const Text('Car',style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,

                          ),),

                          const SizedBox(height: 10,),

                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Details3()),
                              );
                            },
                            child: Container(
                              width: 75,
                              height:25,

                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                child: Text(' RENT ', style: TextStyle(
                                  color: Colors.white70,
                                ),),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),





                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

Widget _buildIconWithBadge(IconData icon, int badgeCount) {
  return custom_badges.Badge( // Use the custom prefix for badges package
    position: custom_badges.BadgePosition.topEnd(top: 0, end: 0),

    badgeContent: Text(badgeCount.toString(), style: const TextStyle(color: Colors.white)),


    child: IconButton(
      icon: Icon(icon),
      onPressed: () {
        // Handle button press
      },
    ),
  );
}



