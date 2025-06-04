
class NullOperator {

  /*
    ? 연산자
    기존 코드
  void getuserAge(String username) async {
    final request = UserRequest(username);
    final response = await request.get();
    user user = new user.fromResponse(response);
    if(user!=null) {
      this.userAge = user.age;
    }
  }*/

  /*
   void getuserAge(String username) async {
    final request = UserRequest(username);
    final response = await request.get();
    user user = new user.fromResponse(response);
    this.userAge = user?.age; // 객체가 null이 아니면 userAge를 user.age에 할당 , null 이면 null 할당.
   */

  /*
      ?? 연산자
      해당 변수 값이 null 이라면 , 지정된 default 값을 할당


    void getUserAge(String username) async {
      final request = new UserRequest(username);
      final response = request.get();
      Useruser = new User.fromResponse(response);
      this.userAge = user.age??18;  // user.age가 null 이라면 , 18을 할당 하도록.
    }

 */

  /*
        ??= 연산자
        객체가 null 이면 백업값을 할당하고 아니면 객체를 그대로 반환
        int x = 5
        x ??= 3; x는 5의 값을 가지므로 3이 할당
   */



}