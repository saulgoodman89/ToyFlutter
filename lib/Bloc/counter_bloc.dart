import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toy_flutter/Bloc/counter_event.dart';

import 'counter_state.dart';

/*
  각 상태 클래스를 상속받아 카운터앱의 비즈니스 로직을 정의.
 */
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    /*
      on
        Bloc 클래스 생성자 내에서 호출.
        이벤트와 핸들러 메서드를 연결하는 역활을 한다.
        핸들러 메서드는 이벤트가 발생했을 때 실행.
        이벤트와 현재 상태에 따라 특정 작업을 수행하고 새로운 상태를 업데이트 하는 역활.

      emit
        Status를 변경하지 않고 새로운 상태를 반환.
        새로운 Status는 Bloc Stats Stream에 추가되고 이 Stream을 구독하는 위젯이나 컴포넌트가 새로운 상태를 수신해 UI를 업데이트.
     */
    on<IncrementEvent>(_handleIncrementEvent);  // 이벤트가 발생하면 _handleIncrementEvent 를 호출하도록 등록
    on<DecrementEvent>(_handleDecrementEvent);
  }


    void _handleIncrementEvent(
      IncrementEvent event ,
      Emitter<CounterState> emit,
      ) {
          print('IncrementEvent 발생');
          emit(state.copyWith(count: state.count+1)); // 현재 상태를 변경하지 않고 현 상태의 카운터 값을 1 증가시킨 새로운 상태를 반환, 새로운 Status는 UI로 전달해 카운터 값이 업데이트 된다.
    }

  void _handleDecrementEvent(
      DecrementEvent event,
      Emitter<CounterState> emit,
      ) {
    print('DecrementEvent 발생');
    emit(state.copyWith(count: state.count - 1));
  }

}