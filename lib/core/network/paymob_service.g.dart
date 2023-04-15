// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'paymob_service.dart';
//
// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************
//
// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers
//
// class _ApiClient implements ApiClient {
//   _ApiClient(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'https://accept.paymob.com/api';
//   }
//
//   final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<PaymentResponse> makePayment(data) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(data);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<PaymentResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/api/acceptance/payments/pay',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = PaymentResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AuthResponse> authenticate(authRequest) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(authRequest);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<AuthResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/auth/tokens',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = AuthResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<OrderResponse> createOrder(request) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(request);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<OrderResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/ecommerce/orders',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = OrderResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<PaymentKeyResponse> createPaymentKey(request) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(request.toJson());
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<PaymentKeyResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/acceptance/payment_keys',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = PaymentKeyResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
