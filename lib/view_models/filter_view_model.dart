import 'package:flutter/material.dart';
import 'package:gopher/utils/assets.dart';
import 'package:gopher/widgets/service_item_widget.dart';

class FilterViewModel extends ChangeNotifier {
   final List<Map<String, dynamic>>  flitterServices = [
    {'icon': SvgAssets.all, 'label': 'All'},
    {'icon': SvgAssets.appliance, 'label': 'Appliance'},
    {'icon': SvgAssets.shifting, 'label': 'Shifting'},
    {'icon': SvgAssets.cleaning, 'label': 'Cleaning'},
    {'icon': SvgAssets.massage, 'label': 'Massage'},
    {'icon': SvgAssets.laundry, 'label': 'Laundry'},
    {'icon': SvgAssets.beauty, 'label': 'Beauty'},
  ];
  static final List<ServiceItem> professionalServices = [
    ServiceItem(
      icon: SvgAssets.appliance,
      label: 'Appliance',
      isSelected: true,
    ),
    ServiceItem(
      icon: SvgAssets.repairing,
      label: 'Painting',
      isSelected: false,
    ),
    ServiceItem(icon: SvgAssets.shifting, label: 'Shifting', isSelected: false),
    ServiceItem(icon: SvgAssets.cleaning, label: 'Cleaning', isSelected: false),
    ServiceItem(icon: SvgAssets.ac, label: 'AC Clean', isSelected: false),
    ServiceItem(icon: SvgAssets.massage, label: 'Massage', isSelected: false),
    ServiceItem(icon: SvgAssets.laundry, label: 'Laundry', isSelected: false),
    ServiceItem(icon: SvgAssets.beauty, label: 'Beauty', isSelected: false),
  ];
  static final List<ServiceItem> homeServices = [
    ServiceItem(
      icon: SvgAssets.appliance,
      label: 'Appliance',
      isSelected: true,
    ),
    ServiceItem(
      icon: SvgAssets.repairing,
      label: 'Painting',
      isSelected: false,
    ),
    ServiceItem(icon: SvgAssets.shifting, label: 'Shifting', isSelected: false),
    ServiceItem(icon: SvgAssets.cleaning, label: 'Cleaning', isSelected: false),
    ServiceItem(icon: SvgAssets.ac, label: 'AC Clean', isSelected: false),
    ServiceItem(icon: SvgAssets.massage, label: 'Massage', isSelected: false),
    ServiceItem(icon: SvgAssets.laundry, label: 'Laundry', isSelected: false),
    ServiceItem(icon: SvgAssets.beauty, label: 'Beauty', isSelected: false),
  ];

  final List<ServiceItem> services;
  bool isAllSelected = true; // Default to "All" selected in filter bottom sheet

  FilterViewModel({required this.services});
  List<String> selectedFilters = []; // For filter bottom sheet (flitterServices)
  
  // Separate state for all gopher screen (professionalServices)
  List<String> selectedGopherServices = [];

  void toggleServiceSelection(String serviceLabel) {
    // This is for filter bottom sheet - only affects flitterServices
    // Handle "All" option
    if (serviceLabel == 'All') {
      if (isAllSelected) {
        // Deselect All
        isAllSelected = false;
        selectedFilters.clear();
      } else {
        // Select All - deselect all other services
        isAllSelected = true;
        selectedFilters.clear();
      }
    } else {
      // Handle individual service selection
      if (isAllSelected) {
        // If All was selected, deselect it
        isAllSelected = false;
      }

      // Toggle it in selectedFilters (for filter bottom sheet only)
      if (selectedFilters.contains(serviceLabel)) {
        selectedFilters.remove(serviceLabel);
      } else {
        selectedFilters.add(serviceLabel);
      }
    }
    notifyListeners();
  }

  void selectSingleService(String serviceLabel) {
    // This is for all gopher screen - only affects professionalServices
    // Clear previous gopher screen selections
    selectedGopherServices.clear();
    for (var service in services) {
      service.isSelected = false;
    }

    // Find and select only the tapped service
    final serviceIndex = services.indexWhere((s) => s.label == serviceLabel);
    if (serviceIndex != -1) {
      services[serviceIndex].isSelected = true;
      selectedGopherServices.add(serviceLabel);
    }

    notifyListeners();
  }

  void clearAllSelections() {
    // Clear filter bottom sheet selections
    isAllSelected = false;
    selectedFilters.clear();
    notifyListeners();
  }
  
  void clearGopherSelections() {
    // Clear all gopher screen selections
    selectedGopherServices.clear();
    for (var service in services) {
      service.isSelected = false;
    }
    notifyListeners();
  }
}
