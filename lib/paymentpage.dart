import 'package:flutter/material.dart';
import 'package:vehical_rental_system/model_class.dart';

class Payment extends StatefulWidget {

  final RentalData data;
    Payment({Key? key, required this.data}) : super(key: key);



  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

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
    final amount = widget.data.amount;
      final   double subTotal=amount;
      final double charges=0.25;
      final double discount=25;
      final double finalamount=calculateTotal(subTotal, charges, discount);
      String finalamountnew=finalamount.toStringAsFixed(2);

    return  Scaffold(
      appBar: AppBar(
             toolbarHeight: 80,
        title: Center(child: Text('Title & Description')),



      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: screenWidth * 0.65,
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
          SizedBox(height: 20,),
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
                     color: Colors.indigo,
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
                               child: Text(' PAYMENT ',style: TextStyle(
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
               ),],
            ),
          ),


        ],
      ),
    );
  }
}
