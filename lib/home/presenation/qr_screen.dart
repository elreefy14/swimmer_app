//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// import '../business_logic/Home/home_cubit.dart';
// import '../business_logic/Home/qr_cubit.dart';
//
// class QrScreen extends StatelessWidget {
//   const QrScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//         builder: (context) {
//           QrCubit.get(context).qrCodeScanned =false;
//           return Scaffold(
//             //make screen to scan qr code using camera and pr
//
//             body: Column(
//               children: [
//                 SizedBox(
//                   height: 160.h,
//                 ),
//                 BlocConsumer<QrCubit, QrState>(
//                   listener: (context, state) {
//
//                   },
//                   builder: (context, state) {
//                     //class QrCodeScannedSuccessfully extends QrState {
//                     // }
//                     // //QrError
//                     // class QrError extends QrState {
//                     //   final String message;
//                     //
//                     //   QrError(this.message);
//                     // }
//                     // //qrCodeScannedSuccessfully
//                     // class QrCodeScannedSuccessfullyWithNoInternet extends QrState {
//                     // }
//                     return state is QrLoading
//                         ?    Text(
//                       ' جار التعرف على رمز QR',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF333333),
//                         fontSize: 20,
//                         fontFamily: 'Montserrat-Arabic',
//                         fontWeight: FontWeight.w300,
//                         //    height: 26,
//                       ),
//                     )
//                         : state is QrCodeScannedSuccessfully ?
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'تم',
//                             style: TextStyle(
//                               color: Color(0xFF00CE39),
//                               fontSize: 20,
//                               fontFamily: 'Montserrat-Arabic',
//                               fontWeight: FontWeight.w300,
//                               //   height:
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' تسجيل حضورك',
//                             style: TextStyle(
//                               color: Color(0xFF333333),
//                               fontSize: 20,
//                               fontFamily: 'Montserrat-Arabic',
//                               fontWeight: FontWeight.w300,
//                               // height: 26,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ) : state is QrError ?
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'فشل',
//                             style: TextStyle(
//                               color: Color(0xFFFF0000),
//                               fontSize: 20,
//                               fontFamily: 'Montserrat-Arabic',
//                               fontWeight: FontWeight.w300,
//                               //   height:
//                             ),
//                           ),
//                           TextSpan(
//                             text: '  التعرف على رمز QR...',
//                             style: TextStyle(
//                               color: Color(0xFF333333),
//                               fontSize: 20,
//                               fontFamily: 'Montserrat-Arabic',
//                               fontWeight: FontWeight.w300,
//                               // height: 26,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ) : state is QrCodeScannedSuccessfullyWithNoInternet ?
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'تم',
//                             style: TextStyle(
//                               color: Color(0xFF00CE39),
//                               fontSize: 20,
//                               fontFamily: 'Montserrat-Arabic',
//                               fontWeight: FontWeight.w300,
//                               height: 26,
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' تسجيل حضورك',
//                             style: TextStyle(
//                               color: Color(0xFF333333),
//                               fontSize: 20,
//                               fontFamily: 'Montserrat-Arabic',
//                               fontWeight: FontWeight.w300,
//                               height: 26,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ): Text(
//                       'جار البحث عن رمز QR...',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF333333),
//                         fontSize: 20,
//                         fontFamily: 'Montserrat-Arabic',
//                         fontWeight: FontWeight.w300,
//                         //    height: 26,
//                       ),
//                     );
//
//                   },
//                 ),
//                 SizedBox(
//                     height: 5.h
//                 ),
//                 Stack(
//                   children: [
//                     Center(
//                       child: Container(
//                         height: 250.h,
//                         width: 250.w,
//                         child: BlocBuilder<QrCubit, QrState>(
//                           builder: (context, state) {
//                             return MobileScanner(onDetect: (BarcodeCapture barcodes) {
//                               if(QrCubit.get(context).qrCodeScanned == true) {
//                                 // showToast(
//                                 //  msg: "A QR code has already been scanned.",
//                                 //  state: ToastStates.ERROR,
//                                 // );
//                                 return;}else{
//                                 String? displayValue = barcodes.barcodes[0].displayValue;
//                                 QrCubit.get(context).onQRCodeScanned(
//                                     hourlyRate: HomeCubit
//                                         .get(context)
//                                         .userCacheModel!
//                                         .hourlyRate ?? 0,
//                                     coachId: HomeCubit
//                                         .get(context)
//                                         .userCacheModel!
//                                         .uId ?? '',
//                                     scheduleId: displayValue.toString()).then((value) =>
//                                     HomeCubit.get(context).getUserData());
//                                 QrCubit.get(context).qrCodeScanned =true;
//                                 //  HomeCubit.get(context).changeBottomNav(0);
//                               }
//                             },
//                               fit: BoxFit.cover,
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Container(
//                         height: 250.h,
//                         width: 250.w,
//                         child: const QrScannerOverlay(
//                           borderColor: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: Text(
//                             "تعليمات",
//                             style: TextStyle(
//                               color: Color(0xFF333333),
//                               fontSize: 14,
//                               fontFamily: 'IBM Plex Sans Arabic',
//                               fontWeight: FontWeight.w400,
//                               // height: 16.80,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "- تأكد ان رمز QR يظهر بوضوح.",
//                           style: TextStyle(
//                             color: Color(0xFFB9B9B9),
//                             fontSize: 12,
//                             fontFamily: 'IBM Plex Sans Arabic',
//                             fontWeight: FontWeight.w400,
//                             // height: 18,
//                           ),
//                         ),
//                         Text(
//                           "- اقترب من رمز  QR",
//                           style: TextStyle(
//                             color: Color(0xFFB9B9B9),
//                             fontSize: 12,
//                             fontFamily: 'IBM Plex Sans Arabic',
//                             fontWeight: FontWeight.w400,
//                             //  height: 18,
//                           ),
//                         ),
//                         Text(
//                           "- تأكد من ان المكان ليس معتم.",
//                           style: TextStyle(
//                             color: Color(0xFFB9B9B9),
//                             fontSize: 12,
//                             fontFamily: 'IBM Plex Sans Arabic',
//                             fontWeight: FontWeight.w400,
//                             //    height: 18,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//         }
//     );
//   }
// }
//
//
// class QrScannerOverlay extends StatelessWidget {
//   final Color borderColor;
//
//   const QrScannerOverlay({Key? key, required this.borderColor})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: _QrScannerOverlayPainter(  Color(0xFF00CE39)),
//     );
//   }
// }
//
// class _QrScannerOverlayPainter extends CustomPainter {
//   final Color borderColor;
//
//   _QrScannerOverlayPainter(this.borderColor);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     final borderPaint = Paint()
//       ..color = borderColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5;
//
//     final scanAreaWidth = size.width * 0.7;
//     final scanAreaHeight = size.height * 0.5;
//     final scanAreaRect = Rect.fromCenter(
//       center: rect.center,
//       width: scanAreaWidth,
//       height: scanAreaHeight,
//     );
//
//     final borderPath = Path()
//       ..addRect(rect);
//     //..addRect(scanAreaRect);
//
//     canvas.drawPath(borderPath, borderPaint);
//   }
//
//   @override
//   bool shouldRepaint(_QrScannerOverlayPainter oldDelegate) {
//     return oldDelegate.borderColor != borderColor;
//   }
// }