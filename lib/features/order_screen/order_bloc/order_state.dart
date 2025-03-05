part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderInitialState extends OrderState {}

final class OrderLoadingState extends OrderState {}

final class OrderGetSuccessState extends OrderState {
  final List<Map<String, dynamic>> orders;

  OrderGetSuccessState({required this.orders});
}

final class OrderDetailsSuccessState extends OrderState {
  final Map<String, dynamic> order;

  OrderDetailsSuccessState({required this.order});
}

final class OrderFailureState extends OrderState {
  final String message;

  OrderFailureState({this.message = apiErrorMessage});
}
