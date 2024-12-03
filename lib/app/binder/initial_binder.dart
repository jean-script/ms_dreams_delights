import 'package:get/get.dart';
import 'package:ms_dreams_delights/app/binder/navigation_binder.dart';
import 'package:ms_dreams_delights/app/binder/stock_binder.dart';

class InitialBinder implements Bindings {
  @override
  void dependencies() {
    NavigationBinder().dependencies();
    StockBinder().dependencies();
  }
}
