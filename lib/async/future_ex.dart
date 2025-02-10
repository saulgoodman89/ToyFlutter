class FutureExample {
  /*
  2025-02-10 23:06:28.073  5426-5474  flutter                 com.keg.lsa.toy_flutter              I  KEG A
  2025-02-10 23:06:28.073  5426-5474  flutter                 com.keg.lsa.toy_flutter              I  KEG C
  2025-02-10 23:06:28.073  5426-5474  flutter                 com.keg.lsa.toy_flutter              I  KEG E
  2025-02-10 23:06:28.129  5426-5474  flutter                 com.keg.lsa.toy_flutter              I  KEG B
  2025-02-10 23:06:28.130  5426-5474  flutter                 com.keg.lsa.toy_flutter              I  KEG D
   */
  void main() {
    print('KEG A');
    futurePrint(Duration(milliseconds: 1),"KEG B")
          .then((status)=>print(status));
    print('KEG C');
    futurePrint(Duration(milliseconds: 2), "KEG D")
          .then((status) => print(status));
    print('KEG E');
  }

  void mainAsync() async {
    print("KEG A");
    await futurePrint(Duration(milliseconds: 1),"KEG B");
    print("KEG C");
    await futurePrint(Duration(milliseconds: 2), "KEG D");
    print("KEG E");
  }

  Future<String> futurePrint(Duration dur , String msg) {
    return Future.delayed(dur)
        .then((onValue) => msg);
  }
}