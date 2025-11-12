import 'package:flutter/foundation.dart';

import '../utils/enums.dart';

class ServiceViewModel extends ChangeNotifier {
  ServiceType? selectedServiceType;
  GopherType? selectedGopherType;
  int? selectedDeliveryWeight;
  final List<DeliveryCategory> categories = [];
  final List<String> bookingSharePics = [];

  void setServiceType(ServiceType newServiceType) {
    selectedServiceType = newServiceType;
    notifyListeners();
  }

  void setGopherType(GopherType newGopherType) {
    selectedGopherType = newGopherType;
    notifyListeners();
  }

  void setDeliveryWeight(int newDeliveryWeight) {
    selectedDeliveryWeight = newDeliveryWeight;
    notifyListeners();
  }

  void setCategory(DeliveryCategory newCategory) {
    if (categories.contains(newCategory)) {
      categories.remove(newCategory);
    } else {
      categories.add(newCategory);
    }
    notifyListeners();
  }

  void addImage(String newImagePath) {
    if (!bookingSharePics.contains(newImagePath)) {
      bookingSharePics.add(newImagePath);
    }
    notifyListeners();
  }

  void removeImage(int index) {
    if (index >= 0 && index < bookingSharePics.length) {
      bookingSharePics.removeAt(index);
      notifyListeners();
    }
  }
}
