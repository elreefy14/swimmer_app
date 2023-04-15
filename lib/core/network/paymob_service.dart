//
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
//
// import '../../feautres/payment/data/auth/auth_request.dart';
// import '../../feautres/payment/data/auth/auth_response.dart';
// import '../../feautres/payment/data/order/order_request.dart';
// import '../../feautres/payment/data/order/order_response.dart';
// import '../../feautres/payment/data/payment/payment_key_request.dart';
// import '../../feautres/payment/data/payment/payment_key_response.dart';
// import '../../feautres/payment/data/payment_response.dart';
//
// part 'paymob_service.g.dart';
//
// @RestApi(
//   //https://accept.paymob.com/api/acceptance/payments/pay
//   baseUrl: 'https://accept.paymob.com/api',
// )
// abstract class ApiClient {
//   factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
//
//   @POST('/api/acceptance/payments/pay')
//   Future<PaymentResponse> makePayment(@Body() Map<String, dynamic> data);
// //
//   @POST('/auth/tokens')
//   Future<AuthResponse> authenticate(@Body() Map<String, dynamic> authRequest);
//
//   @POST("/ecommerce/orders")
//   Future<OrderResponse> createOrder(@Body() Map<String, dynamic> request);
//
//   @POST("/acceptance/payment_keys")
//   Future<PaymentKeyResponse> createPaymentKey(@Body() PaymentKeyRequest request);
// }
//
// //
// //
// // import 'package:retrofit/retrofit.dart';
// // import 'package:dio/dio.dart';
// //
// // import '../../feautres/payment/data/auth/auth_request.dart';
// // import '../../feautres/payment/data/auth/auth_response.dart';
// // import '../../feautres/payment/data/order/order_request.dart';
// // import '../../feautres/payment/data/order/order_response.dart';
// // import '../../feautres/payment/data/payment/payment_key_request.dart';
// // import '../../feautres/payment/data/payment/payment_key_response.dart';
// // import '../../feautres/payment/data/payment_response.dart';
// //
// // part 'paymob_service.g.dart';
// //
// // @RestApi(
// //   //https://accept.paymob.com/api/acceptance/payments/pay
// //   baseUrl: 'https://accept.paymob.com',
// // )
// // abstract class ApiClient {
// //   factory ApiClient(Dio dio, {String baseUrl}) = _PaymobService;
// //
// //   @POST('/api/acceptance/payments/pay')
// //   Future<PaymentResponse> makePayment(@Body() Map<String, dynamic> data);
// //
// //
// //   @POST('auth/tokens')
// //   Future<AuthResponse> authenticate(@Body() AuthRequest authRequest);
// //
// //   @POST("/ecommerce/orders")
// //   Future<OrderResponse> createOrder(@Body() OrderRequest request);
// //
// //   @POST("/acceptance/payment_keys")
// //   Future<PaymentKeyResponse> createPaymentKey(@Body() PaymentKeyRequest request);
// // }