import 'package:flutter/foundation.dart';

import '../utils/enums.dart';

class ServiceViewModel extends ChangeNotifier {
  ServiceType? selectedServiceType;

  void setServiceType(ServiceType newServiceType) {
    selectedServiceType = newServiceType;
    notifyListeners();
  }
}
