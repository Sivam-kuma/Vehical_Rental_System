import 'package:flutter/material.dart';
import 'package:vehical_rental_system/history.dart';
import 'package:vehical_rental_system/model_class.dart';
import 'package:vehical_rental_system/my_home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehical_rental_system/utils/database_helperclass.dart';
import 'package:vehical_rental_system/modelclass/classfile.dart';

import 'model_class_two.dart';

class Payment extends StatefulWidget {

  final PaymentData paymentData;
    Payment({Key? key, required this.paymentData}) : super(key: key);



  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
   DatabaseHelper? _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    // _initDatabaseHelper().then((_) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => History()),
    //   );
    // });
  }

  // Future<Null> _initDatabaseHelper() async {
  //   _databaseHelper = DatabaseHelper();
  //   await _databaseHelper?.initializeDatabase();
  //   // You can add more initialization steps here if needed
  // }

  void onPaymentSucess () async{
    final amount = widget.paymentData.rentalData.amount;
    final nameVehicle=widget.paymentData.vehicalName.nameof;
    final vehicalImage=widget.paymentData.vehicleImage.imageof;
    final   double subTotal=amount as double;
    final double charges=0.25;
    final double discount=25;
    final double finalamount=calculateTotal(subTotal, charges, discount);


    Node paymentNode = Node (
      null,
      nameVehicle,
      "booked",
      finalamount.toInt(),
      DateTime.now().millisecondsSinceEpoch,

    );
    await _databaseHelper?.insertNote(paymentNode);

    print("Payment successful!");

    Fluttertoast.showToast(
      msg: "Your Vehicle has been booked .",
      fontSize: 20,
      textColor: Colors.indigo,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.white,
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false,
    );
  }

  // double calculateTotalAmount(double subtotal, double charges, double discount) {
  //   double totalAmount = subtotal + charges;
  //   double discountAmount = (discount / 100) * totalAmount;
  //   totalAmount -= discountAmount;
  //   return totalAmount;
  // }

   double calculateTotal(double subTotal, double charges,double discount){
     double totalCharges=subTotal+charges;
     double discounted=(discount/100)*totalCharges;
     totalCharges=totalCharges-discounted;
     return totalCharges;
   }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // print('Amount: $amount');

    final amount = widget.paymentData.rentalData.amount;
    final nameVehicle=widget.paymentData.vehicalName.nameof;
    final vehicleImage=widget.paymentData.vehicleImage.imageof;
    final   double subTotal=amount as double;
      final double charges=0.25;
      final double discount=25;
      final double finalamount=calculateTotal(subTotal, charges, discount);
      String finalamountnew=finalamount.toStringAsFixed(2);

    return  Scaffold(
      appBar: AppBar(
             toolbarHeight: 80,
        title: Center(child: Text('$nameVehicle')),



      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 250,

              child:ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network('$vehicleImage',fit:BoxFit.cover,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),

            ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: screenWidth * 0.65,
               child: Center(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                      onChanged : (text){
                    print("Input Text: $text");
                    },
                     decoration: InputDecoration(
                       border: InputBorder.none,
                     ),
                        ),
                 ),
               ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:Colors.indigo,
                    width:2,
                  )

                ),
              ),
              SizedBox(width: 5,),
              Container(
                height: 40,
                width: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(' APPLY ',style: TextStyle(
                  fontSize: 20,
                  color: Colors.greenAccent,
                ),)),

              )
            ],
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Quantity :',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
                Text('1',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Subtotal :',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
                Text('\$ $amount ',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Charges :',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
                Text(' \$0.25',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Discount :',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
                Text('25\% ',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total :',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
                Text('\$ $finalamountnew ',style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children:<Widget> [

               Positioned(
                   bottom:0,
                   left: 0,
                 right: 0,
                 child: Container(
                   alignment: Alignment.bottomCenter,
                   height: 55,
                   decoration: BoxDecoration(
                     color: Colors.indigo.withOpacity(0.5),
                     borderRadius: BorderRadius.only(
                       topLeft:Radius.circular(10),
                       topRight: Radius.circular(10),
                     )
                   ),

                   child: Padding(
                     padding: const EdgeInsets.only(left:10.0,right: 10.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('\$ $finalamountnew',style: TextStyle(
                           fontSize: 28,
                           fontStyle: FontStyle.italic,
                           color: Colors.white,
                         ),),
                         Center(
                           child: Container(
                             height: 38,
                             width: 150,
                             decoration: BoxDecoration(
                               color: Colors.blue,
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: Center(
                               child: InkWell(
                                 onTap:(){
                                  onPaymentSucess();

                                 },
                                 child: Text(' PAYMENT ',style: TextStyle(
                                   fontSize: 25,
                                   fontStyle:FontStyle.italic,
                                   color: Colors.white,
                                 ),),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),

                 ),
               ),],
            ),
          ),


        ],
      ),
    );
  }
}
