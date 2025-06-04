import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toy_flutter/async/future_ex.dart';


/*
2025-04-10 17:37:52.669 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda initState
2025-04-10 17:37:52.670 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda didChangeDependencies
2025-04-10 17:38:03.227 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda inactive
2025-04-10 17:38:03.823 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda hidden
2025-04-10 17:38:03.823 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda paused
2025-04-10 17:38:09.609 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda hidden
2025-04-10 17:38:09.610 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda inactive
2025-04-10 17:38:09.748 23685-23685 flutter                 com.keg.lsa.toy_flutter              I  GomiSeuda resumed
 */
class CodeCanvas extends StatefulWidget {
  @override
  _CodeCanvasState createState() => _CodeCanvasState();
}

class _CodeCanvasState extends State<CodeCanvas> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }

  @override
  void didChangeDependencies() {
    print("GomiSeuda didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("GomiSeuda dispose");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void deactivate() {
    print("GomiSeuda deactivate");
    super.deactivate();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    print("GomiSeuda initState");
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      // 앱이 표시되고 사용자 입력에 응답합니다.
      // 주의! 최초 앱 실행때는 해당 이벤트가 발생하지 않습니다.
        print("GomiSeuda resumed");
        break;
      case AppLifecycleState.inactive:
      // 앱이 비활성화 상태이고 사용자의 입력을 받지 않습니다.
      // ios에서는 포 그라운드 비활성 상태에서 실행되는 앱 또는 Flutter 호스트 뷰에 해당합니다.
      // 안드로이드에서는 화면 분할 앱, 전화 통화, PIP 앱, 시스템 대화 상자 또는 다른 창과 같은 다른 활동이 집중되면 앱이이 상태로 전환됩니다.
      // inactive가 발생되고 얼마후 pasued가 발생합니다.
        print("GomiSeuda inactive");
        break;
      case AppLifecycleState.paused:
      // 앱이 현재 사용자에게 보이지 않고, 사용자의 입력을 받지 않으며, 백그라운드에서 동작 중입니다.
      // 안드로이드의 onPause()와 동일합니다.
      // 응용 프로그램이 이 상태에 있으면 엔진은 Window.onBeginFrame 및 Window.onDrawFrame 콜백을 호출하지 않습니다.
        print("GomiSeuda paused");
        break;
      case AppLifecycleState.detached:
      // 응용 프로그램은 여전히 flutter 엔진에서 호스팅되지만 "호스트 View"에서 분리됩니다.
      // 앱이 이 상태에 있으면 엔진이 "View"없이 실행됩니다.
      // 엔진이 처음 초기화 될 때 "View" 연결 진행 중이거나 네비게이터 팝으로 인해 "View"가 파괴 된 후 일 수 있습니다.
        print("GomiSeuda detached");
        break;
      case AppLifecycleState.hidden:
        print("GomiSeuda hidden");
        break;
    }
  }
}