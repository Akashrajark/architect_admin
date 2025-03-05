part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}

class GetAllOrdersEvent extends OrderEvent {
  final Map<String, dynamic> params;

  GetAllOrdersEvent({required this.params});
}

class GetOrderDetailsEvent extends OrderEvent {
  final String orderId;

  GetOrderDetailsEvent({required this.orderId});
}
