import 'package:flutter/foundation.dart';

import '../utils/enums.dart';

class ServiceViewModel extends ChangeNotifier {
  ServiceType? selectedServiceType;
  GopherType? selectedGopherType;

  void setServiceType(ServiceType newServiceType) {
    selectedServiceType = newServiceType;
    notifyListeners();
  }

  void setGopherType(GopherType newGopherType) {
    selectedGopherType = newGopherType;
    notifyListeners();
  }
}
