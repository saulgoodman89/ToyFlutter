class Employee {
  void currentPosition(bool isManager) {
    if(isManager) {
      print("관리자 입니다");
    }else {
      print("일반 직원입니다.");
    }
  }
}