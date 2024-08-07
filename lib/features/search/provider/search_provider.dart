import 'package:flutter/material.dart';
import 'package:alfa/core/model/cloth_model.dart';

class SearchProvider extends ChangeNotifier {
  
  Set<ClothModel> searchedItems = {};
  bool notFound = false;

  bool filterPrice = false;
  bool filterDeals = false;
  bool filterSortBy = false;
  bool filterGender = false;
  bool filterMyPrice = false;
  

  
  double? minPrice;
  double? maxPrice;

  Set<String> selectedDealFilters = {}; 
 
  Set<String> selectedSortByFilters = {}; 

  
  void toggleDealFilter(String filterValue) {
    if (selectedDealFilters.contains(filterValue)) {
      selectedDealFilters.remove(filterValue); 
    } else {
      selectedDealFilters.add(filterValue); 
    }
    notifyListeners(); 
  }

  void toggleSortByFilter(String filterValue) {
    if (selectedSortByFilters.contains(filterValue)) {
      selectedSortByFilters.remove(filterValue); 
    } else {
      selectedSortByFilters.add(filterValue); 
    }
    notifyListeners(); 
  }

  void changeModeFilter(bool value, String filterType) {
    switch (filterType) {
      case 'Price':
        filterPrice = value;
        break;
      case 'Deals':
        filterDeals = value;
        break;
      case 'Sort By':
        filterSortBy = value;
        break;
      case 'Gender':
        filterGender = value;
        break;
      case 'My Price':
        filterMyPrice = value;
        break;
    }
    notifyListeners();
  }

  void clearFilters() {
    filterPrice = false;
    filterDeals = false;
    filterSortBy = false;
    filterGender = false;
    filterMyPrice = false;
    selectedDealFilters.clear(); 
    selectedSortByFilters.clear(); 
    minPrice = null;
    maxPrice = null;
    notifyListeners();
  }

  void updatePriceFilter(double? newMinPrice, double? newMaxPrice) {
    minPrice = newMinPrice;
    maxPrice = newMaxPrice;
    notifyListeners();
  }

  void searchItem(String input, {required List<ClothModel> data}) {
    searchedItems.clear();
    if (input.length >= 1) {
      for (var i = 0; i < data.length; i++) {
        if (int.tryParse(input) != null) {
          if (data[i].price.toInt() <= int.tryParse(input)!.toInt()) {
            searchedItems.add(data[i]);
          } else {
            notFound = true;
          }
        } else {
          if (data[i].name.toLowerCase().contains(input.toLowerCase())) {
            searchedItems.add(data[i]);
          } else {
            notFound = true;
          }
        }
      }
    } else {
      if (input.isEmpty) {
        notFound = false;
      }
    }

    notifyListeners();
  }
}
