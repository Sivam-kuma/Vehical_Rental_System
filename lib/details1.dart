import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vehical_rental_system/paymentpage.dart';
import 'model_class.dart';
import 'model_class_two.dart';


class Details1 extends StatefulWidget {
  const Details1({Key? key}) : super(key: key);

  @override
  State<Details1> createState() => _DetailsState();
}

class _DetailsState extends State<Details1> {

  bool showDescription=false;
  bool showSpecification=true;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // final rentalData = RentalData(amount: 3.5);
    // final vehicleName=
        Vehicalname vehicalName = Vehicalname(nameof: 'Trek Remedy');
    RentalData rentalData = RentalData(amount: 3.5);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            'Mountain Bike',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontStyle: FontStyle.italic,
              fontSize: 30,
            ),
          ),
        ),
        actions: [],
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 17,),
          Container(
            height: 150,
            width: 250,


            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5CHK6n4xtcpFyZvlZ80v7_AjWWasQiXDpLz5N86cN38RpZNQuGdR1HeGoCKFH4wWMcyY&usqp=CAU',
                height: 50,
                width: 50,
                fit: BoxFit.fill,),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [ BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0,-3),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),]
            ),



          ),
          // Center(
          //   child: SvgPicture.asset(
          //     'assets/shapes/cycle.svg',
          //     height: 50,
          //     width: 100,
          //   ),
          // ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 300,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color:Colors.black.withOpacity(0.5),
                      //     offset: Offset(0,-3),
                      //     spreadRadius: 2,
                      //
                      //   ),
                      // ]
                    ),

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      showSpecification=true;
                                      showDescription=false;

                                    });
                                  },
                                  child:Container(
                                    height: 40,
                                    width: screenWidth * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: showSpecification?Colors.transparent:Colors.blue,
                                      border: Border.all(
                                        color: showSpecification?Colors.white:Colors.transparent, // Color of the outer boundary
                                        width: 2, // Thickness of the outer boundary
                                      ),

                                      boxShadow: [
                                        BoxShadow(
                                          color: showSpecification ? Colors.transparent : Colors.black.withOpacity(0.7), // Outer shadow when not clicked
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(-3, -3),
                                        ),
                                        BoxShadow(
                                          color: showSpecification ? Colors.transparent : Colors.white.withOpacity(0.6), // Outer shadow when not clicked
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(3, 3),
                                        ),

                                      ],
                                    ),
                                    child: Center(child: Text('Specification',style: TextStyle(
                                      color: showSpecification?Colors.white60:Colors.white,
                                      fontSize: showSpecification?17:20,
                                    ),)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showDescription=true;
                                      showSpecification=false;
                                    });
                                  },
                                  child:  Container(
                                    height: 40,
                                    width: screenWidth * 0.4,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:showDescription?Colors.transparent:Colors.blue,
                                      border: Border.all(
                                        color: showDescription?Colors.white:Colors.transparent,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: showDescription ? Colors.transparent : Colors.black.withOpacity(0.7), // Outer shadow when not clicked
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(-3, -3),
                                        ),
                                        BoxShadow(
                                          color: showDescription ? Colors.transparent : Colors.white.withOpacity(0.6), // Outer shadow when not clicked
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(3, 3),
                                        ),

                                      ],

                                    ),
                                    child: Center(child: Text('Description',style: TextStyle(
                                      color: showDescription?Colors.white60:Colors.white,
                                      fontSize: showDescription?17:20,
                                    ),)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: showDescription,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 25,
                              right: 20,
                            ),
                            child: Text('Off-Road Adventure\nDurable Construction\nWide, Knobby Tires\nSuspension System\nMultiple Gears\nDisc Brakes\n',style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),),
                          ),
                        ),

                        Visibility(
                            visible: showSpecification,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                left: 20,
                                right: 10,
                              ),
                              child: Text('Aluminum, carbon fiber, and steel are common frame materials.\nMountain bikes come in various wheel sizes, including 26 inches, 27.5 inches\nSuspension travel ranges from 80mm to 200mm\nMountain bikes often feature flat or riser handlebars.\n',style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                            )
                        ),


                      ],
                    ),

                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                color: Colors.indigo,
                child:  Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ 3.5',style: TextStyle(
                        fontSize: 28,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),),
                      InkWell(
                        onTap: (){
                          PaymentData paymentData = PaymentData(vehicalName:vehicalName, rentalData:rentalData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Payment(paymentData:paymentData,)),
                          );
                        },
                        child: Container(
                          height: 38,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(' RENT ',style: TextStyle(
                              fontSize: 25,
                              fontStyle:FontStyle.italic,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}