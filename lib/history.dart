import 'package:flutter/material.dart';
import 'package:vehical_rental_system/modelclass/classfile.dart';
import 'package:vehical_rental_system/paymentpage.dart';
import 'package:vehical_rental_system/utils/database_helperclass.dart';


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
           title: Text('Payment History'),
        ),

      body: FutureBuilder(
        // Fetch payment history from the database
        future: _databaseHelper.getNotMapList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Display payment history in a ListView
            List<Map<String, dynamic>> historyList = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name: ${historyList[index]['name']}'),
                  subtitle: Text('Status: ${historyList[index]['status']}'),
                  trailing: Text('Amount: \$${historyList[index]['amountnew']}'),
                  onTap: () {
                    // Handle onTap if needed
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
