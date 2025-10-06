class Operator {
  void checkFinalVar() {
    var name = "Kang";
    print("var 초기값 : $name");

    name = "Lee";
    print("var 변경후 : $name");

    final nickName = "Gomi";
    print("final 초기값 : $nickName");

    /* final로 선언된 nickName 변경 시 아래와 같이 뜸.
    The final variable 'nickName' can only be set once. (Documentation)
    Try making 'nickName' non-final.
    nickName = "Heuk";
    */
  }

  void nullOp() {
    String? name;
    print("GomiSeuda first name : $name");

    /*
    String nickname;
    nickname = null;
    nickname을 null로 지정 시
    A value of type 'Null' can't be assigned to a variable of type 'String'. (Documentation)
    Try changing the type of the variable, or casting the right-hand type to 'String'
    아래와 같이 nickname = null에 에러메시지 발생.
    */

    String displayName = name ?? "Unknown";
    print("GomiSeuda displayName (name이 null일 때 : $displayName");

    name = "Kang";
    displayName = name ?? "Unknown";
    print("GomiSeuda displayName (name이 null이 아닐 때 : $displayName");

    Person? person;
    print("GomiSeuda person?.name : ${person?.name}");
    person = Person("EG Kang");
    print("GomiSeuda person?.name : ${person?.name}");

    String? nickname;
    nickname ??= "Guest";
    print("GomiSeuda nickname (처음 할당) : $nickname");

    nickname ??= "Kang";
    print("GomiSeuda nickname (두 번째 시도) : $nickname");

    print("GomiSeuda person?.name.length ?? 0: ${person?.name.length ?? 0}");
  }

}

class Person {
  String name;
  Person(this.name);
}