// import 'package:bloc/bloc.dart';
//
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRScannerState {
//   final String? data;
//   final bool isScanning;
//
//   QRScannerState({this.data, this.isScanning = false});
// }
//
// class QRScannerCubit extends Cubit<QRScannerState> {
//   final _qrViewController = QRViewController(
//     qrCodeCallback: (data) => emit(QRScannerState(data: data)),
//   );
//
//   QRScannerCubit() : super(QRScannerState());
//
//   void startScan() async {
//     emit(state.copyWith(isScanning: true));
//     await _qrViewController.startCamera();
//   }
//
//   void stopScan() async {
//     await _qrViewController.stopCamera();
//     emit(state.copyWith(isScanning: false));
//   }
//
//   @override
//   Future<void> close() {
//     _qrViewController.dispose();
//     return super.close();
//   }
// }