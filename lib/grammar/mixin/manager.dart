import 'package:toy_flutter/grammar/mixin/HumanResourceManagement.dart';
import 'package:toy_flutter/grammar/mixin/accounting_management.dart';
import 'package:toy_flutter/grammar/mixin/employee.dart';

class Manager extends Employee with HumanResourceManagement , AccountingManagement {
  void manage() {
    hireEmployeeManagement();
    provideSalaryManagement();
    checkAccountingManagement();
  }

  void displayCurrentPosition() {
    currentPosition(true);
  }
}