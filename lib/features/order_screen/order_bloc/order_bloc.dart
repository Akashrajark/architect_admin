import 'package:bloc/bloc.dart';
import 'package:logger/web.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../values/strings.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitialState()) {
    on<OrderEvent>((event, emit) async {
      try {
        emit(OrderLoadingState());
        SupabaseQueryBuilder table =
            Supabase.instance.client.from('customer_home_plan');

        if (event is GetAllOrdersEvent) {
          PostgrestFilterBuilder<List<Map<String, dynamic>>> query =
              table.select('*');

          if (event.params['query'] != null) {
            query = query.ilike('id', '%${event.params['query']}%');
          }

          List<Map<String, dynamic>> orders =
              await query.order('id', ascending: false);

          emit(OrderGetSuccessState(orders: orders));
        } else if (event is GetOrderDetailsEvent) {
          Map<String, dynamic> order =
              await table.select('*').eq('id', event.orderId).single();

          emit(OrderDetailsSuccessState(order: order));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(OrderFailureState());
      }
    });
  }
}
