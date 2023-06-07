import 'package:flutter_blood_pressure/build_constant.dart';
import 'package:flutter_blood_pressure/main.dart';

void main() {
  Environment.chooseEnviroment(Flavor.production);
  delegate();
}
