import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:vehical_rental_system/paymentpage.dart';
import 'model_class.dart';
import 'model_class_two.dart';


class Details3 extends StatefulWidget {
  const Details3({Key? key}) : super(key: key);

  @override
  State<Details3> createState() => _DetailsState();
}

class _DetailsState extends State<Details3> {

  bool showDescription=false;
  bool showSpecification=true;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    Vehicalname vehicalName = Vehicalname(nameof: 'Aventador');
    RentalData rentalData = RentalData(amount: 5.5);
    Vehicleimage vehicleImage =Vehicleimage(imageof: 'https://i.pinimg.com/736x/90/85/44/908544ab4e4f9369ac4b3f578543172e.jpg');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            'Car',
            style: TextStyle(
              color: Colors.yellow,
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
              child: Image.network('https://i.pinimg.com/736x/90/85/44/908544ab4e4f9369ac4b3f578543172e.jpg',
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
                      color: Colors.blueAccent.withOpacity(0.4),
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
                                      color: showSpecification?Colors.transparent:Colors.red,
                                      border: Border.all(
                                        color: showSpecification?Colors.red:Colors.transparent, // Color of the outer boundary
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
                                      color: showSpecification?Colors.black:Colors.white,
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
                                    width: 150,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:showDescription?Colors.transparent:Colors.blue,
                                      border: Border.all(
                                        color: showDescription?Colors.blue:Colors.transparent,
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
                                      color: showDescription?Colors.black:Colors.white,
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
                          child: Text('this is the description of project '),
                        ),

                        Visibility(
                            visible: showSpecification,
                            child: Text('this is the specification of project')
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
                color: Colors.indigo.withOpacity(0.5),
                child:  Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ 5.5',style: TextStyle(
                        fontSize: 28,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),),
                      InkWell(
                        onTap: (){
                          PaymentData paymentData = PaymentData(vehicalName:vehicalName, rentalData:rentalData,vehicleImage:vehicleImage);
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