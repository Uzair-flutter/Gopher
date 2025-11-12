import 'package:flutter/material.dart';
import 'package:gopher/main.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utils/assets.dart';

class RideRequestViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> rides = [];
  void setRideList() {
    rides = [
      {
        "id": "ride_1",
        "riderName": "Christopher Smith",
        "riderImage": DummyAssets.person,
        "rating": 4.4,
        "price": 13.99,
        "time": "4",
      },
      {
        "id": "ride_2",
        "riderName": "Emily Johnson",
        "riderImage": DummyAssets.person,
        "rating": 4.7,
        "price": 15.49,
        "time": "6",
      },
      {
        "id": "ride_3",
        "riderName": "Michael Brown",
        "riderImage": DummyAssets.person,
        "rating": 4.5,
        "price": 12.75,
        "time": "5",
      },
    ];
    notifyListeners();
  }

  void declineRide(String rideId) {
    rides.removeWhere((ride) => ride["id"] == rideId);
    notifyListeners();
  }
}
