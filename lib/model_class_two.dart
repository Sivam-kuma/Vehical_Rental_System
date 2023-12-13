import 'package:vehical_rental_system/model_class.dart';

class PaymentData{
  final Vehiclename vehicleName;
  final RentalData rentalData;
  final VehicleImage vehicleImage;


  PaymentData({required this.vehicleName, required this.rentalData , required this.vehicleImage});



  // PaymentData(this.vehicalName, this.rentalData, { required Vehicalname datas, required RentalData dataa});
}