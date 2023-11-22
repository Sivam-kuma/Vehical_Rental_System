import 'package:vehical_rental_system/model_class.dart';

class PaymentData{
  final Vehicalname vehicalName;
  final RentalData rentalData;
  final Vehicleimage vehicleImage;

  PaymentData({required this.vehicalName, required this.rentalData,required this.vehicleImage});

  // PaymentData(this.vehicalName, this.rentalData, { required Vehicalname datas, required RentalData dataa});
}