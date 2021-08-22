import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiInterfaceController extends GetxController {
  final Rx<VoidCallback?> _retry = Rx<VoidCallback?>(null);
  VoidCallback? get retry => this._retry.value;
  set retry(VoidCallback? retry) => this._retry.value = retry;

}
