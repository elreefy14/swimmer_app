import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:swimmer_app/home/business_logic/Home/qr_cubit.dart';
import 'package:swimmer_app/home/presenation/widget/widget.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/cashe_helper.dart';
import '../../main.dart';
import '../../registeration/data/user_cache_model.dart';
import '../../registeration/presenation/widget/component.dart';
import '../../registeration/presenation/widget/widget.dart';
import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';
//call
class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: checkForAppUpdate(
        context,
      ),
      builder: (context, snapshot) {

        return Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return HomeCubit.get(context).currentScreen;
            },
          ),
          bottomNavigationBar: //BottomNavBar(),
          BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
        return
          //  Container(
        //padding:const EdgeInsets.only(bottom: 30, right: 32, left: 32),
        // child: BottomBarFloating(
        //   items: HomeCubit.get(context).items,
        //
        //     color: Colors.blue,
        //     backgroundColor: Colors.white,
        //     colorSelected: Colors.blue,
        //   //  backgroundSelected: Colors.blue,
        //   indexSelected: HomeCubit.get(context).currentIndex,
        // paddingVertical: 24,
        //   onTap: (index) {
        //         HomeCubit.get(context).changeBottomNav(index);
        //       },
        // ),
        // );
          BottomNavBar();
  },
),

        );
      }
    );
  }
}





class EditProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        HomeCubit.get(context).initControllers();
        return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
        // TODO: implement listener
  },
  builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Column(
            children: [
              SizedBox(height:30.0.h),
              Center(
                child: CircleAvatar(
                  radius: 50, // adjust the size as needed
                  backgroundImage: //networkImage
                  NetworkImage(
                    HomeCubit.get(context).userCacheModel!.image!,
                  )
                ),
              ),
              SizedBox(height: 10.0.h),
              Text(
                '${HomeCubit.get(context).userCacheModel!.fname!} ${HomeCubit.get(context).userCacheModel!.lname!}',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 19 / 16,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 8.0.h),

              Text(
                '34ج.م / ساعة',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                  height: 19 / 14,
                  color: Color(0xFF2196F3),
                ),
              ),
            //15.h
              SizedBox(height: 15.0.h),
            InkWell(
              onTap: () {
                 HomeCubit.get(context).getProfileImage();
              },
              child: Container(
                decoration: BoxDecoration(
                        color: Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(15.0.r),
                        border: Border.all(
                          color: Color(0xFF2196F3),
                          width: 1.0.w,
                        ),
                      ),

                      width: 180.0.w,
                      height: 50.0.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                          vertical: 9.0.h,
                        ),
                        child:
                        Center(
                          child: Text(
                            'تعديل الصورة',
                            style: TextStyle(
                              fontFamily: 'Montserrat-Arabic',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 18.sp,
                              height: 21 / 18,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
              //35
              SizedBox(height: 35.0.h),

              Form(
                key: HomeCubit.get(context).formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                      child: BuildTextFormField('الاسم الاول',
          HomeCubit.get(context).firstNameController
          ,TextInputType.name, 'ادخل الاسم الاول', (value) {
                        if (value!.isEmpty) {
                          return ' الرجاء ادخال الاسم الاول';
                        }
                        return null;
                      },'assets/images/Vector.png' ,null),
                    ),
                    SizedBox(height: 15.0.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                      child: BuildTextFormField('الاسم الاخير', HomeCubit.get(context).lastNameController
                          , TextInputType.name,'ادخل الاسم الاخير', (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخال الاسم الاخير';
                        }
                        return null;
                      },'assets/images/Vector.png',null),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                      child: BuildTextFormField('رقم الهاتف',HomeCubit.get(context).phoneController,
                          TextInputType.phone,'ادخل رقم الهاتف', (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخال رقم الهاتف';
                        }
                        return null;
                      },'assets/images/Vector.png',null),
                    ),
                    SizedBox(height: 15.0.h),

                    // BlocConsumer<OtpCubit,OtpState >(
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 31.w,
                              right: 31.w,
                              top: 20.h
                          ),
                          child: ConditionalBuilder(
                              builder: (context) =>  ElevatedButton(
                                onPressed: () {
                                  if (HomeCubit.get(context).formKey.currentState!.validate()) {
                                    HomeCubit.get(context).editUserData(
                                      firstName: HomeCubit.get(context).firstNameController.text,
                                      lastName: HomeCubit.get(context).lastNameController.text,
                                      phone: HomeCubit.get(context).phoneController.text,
                                    );
                                  }
                                },
                                child: Text(
                                  'حفظ التعديلات',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Arabic',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    height: 26 / 18,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF2196F3), // Background color
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 18, // Adjust the font size if needed
                                  ),
                                ),
                              ),
                              fallback: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            condition: state is! EditUserDataLoadingState,
                          ),

                        );

                      },
                      fallback: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
  },
);
      }
    );
  }
}


class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey qrKey = GlobalKey();
    QRViewController qrController;
    return Builder(
      builder: (context) {
        QrCubit.get(context).qrCodeScanned =false;
        //
        return Scaffold(
          //make screen to scan qr code using camera and pr

          body: Column(
            children: [
              SizedBox(
                height: 160.h,
              ),
            BlocConsumer<QrCubit, QrState>(
  listener: (context, state) {

  },
  builder: (context, state) {
        //class QrCodeScannedSuccessfully extends QrState {
        // }
        // //QrError
        // class QrError extends QrState {
        //   final String message;
        //
        //   QrError(this.message);
        // }
        // //qrCodeScannedSuccessfully
        // class QrCodeScannedSuccessfullyWithNoInternet extends QrState {
        // }
        return state is QrLoading
            ?    Text(
          ' جار التعرف على رمز QR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontFamily: 'Montserrat-Arabic',
            fontWeight: FontWeight.w300,
            //    height: 26,
          ),
        )
            : state is QrCodeScannedSuccessfully ?
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'تم',
                style: TextStyle(
                  color: Color(0xFF00CE39),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
               //   height:
                ),
              ),
              TextSpan(
                text: ' تسجيل حضورك',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                 // height: 26,
                ),
              ),
            ],
          ),
        ) : state is QrError ?
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'فشل',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                  //   height:
                ),
              ),
              TextSpan(
                text: '  التعرف على رمز QR...',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
                  // height: 26,
                ),
              ),
            ],
          ),
        ) : state is QrCodeScannedSuccessfullyWithNoInternet ?
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'تم',
                style: TextStyle(
                  color: Color(0xFF00CE39),
                  fontSize: 20,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
               //   height: 26,
                ),
              ),
              TextSpan(
                text: ' تسجيل حضورك',

                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize:20 ,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
               //   height: 26,
                ),
              ),
              TextSpan(
                text:' \n (سيتم تسجيله عندما يتم توصيل الانترنت)',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize:12 ,
                  fontFamily: 'Montserrat-Arabic',
                  fontWeight: FontWeight.w300,
               //   height: 26,
                ),
              ),
            ],
          ),
        ): Text(
          'جار البحث عن رمز QR...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontFamily: 'Montserrat-Arabic',
            fontWeight: FontWeight.w300,
            //    height: 26,
          ),
        );

  },
),
              SizedBox(
                height: 5.h
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 250.h,
                      width: 250.w,
                      child: BlocBuilder<QrCubit, QrState>(
  builder: (context, state) {
        return MobileScanner(
          startDelay: true,

          onDetect: (BarcodeCapture barcodes) {
          if(QrCubit.get(context).qrCodeScanned == true) {
            return;}else{
            String? displayValue = barcodes.barcodes[0].displayValue;
            QrCubit.get(context).onQRCodeScanned(
                hourlyRate: HomeCubit
                    .get(context)
                    .userCacheModel!
                    .hourlyRate ?? 0,
                coachId: HomeCubit
                    .get(context)
                    .userCacheModel!
                    .uId ?? '',
                scheduleId: displayValue.toString()).then((value) =>
                HomeCubit.get(context).getUserData());
                 QrCubit.get(context).qrCodeScanned =true;
          //  HomeCubit.get(context).changeBottomNav(0);
          }
        },
                      fit: BoxFit.cover,
                      );
  },
),
                    ),
                  ),
                Center(
                  child: Container(
                    height: 250.h,
                    width: 250.w,
                    child: const QrScannerOverlay(
                        borderColor: Colors.blue,
                      ),
                  ),
                ),
                ],
                ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            "تعليمات",
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 14,
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w400,
                           // height: 16.80,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                          "- تأكد ان رمز QR يظهر بوضوح.",
                        style: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 12,
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w400,
                         // height: 18,
                        ),
                      ),
                      Text(
                          "- اقترب من رمز  QR",
                        style: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 12,
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w400,
                        //  height: 18,
                        ),
                      ),
                      Text(
                          "- تأكد من ان المكان ليس معتم.",
                        style: TextStyle(
                          color: Color(0xFFB9B9B9),
                          fontSize: 12,
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w400,
                      //    height: 18,
                        ),
                      )
                    ],
                  )
                ],
              )
                ],
          ),
        );
      }
    );
  }
}


class QrScannerOverlay extends StatelessWidget {
  final Color borderColor;

  const QrScannerOverlay({Key? key, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _QrScannerOverlayPainter(borderColor),
    );
  }
}

class _QrScannerOverlayPainter extends CustomPainter {
  final Color borderColor;

  _QrScannerOverlayPainter(this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final scanAreaWidth = size.width * 0.7;
    final scanAreaHeight = size.height * 0.5;
    final scanAreaRect = Rect.fromCenter(
      center: rect.center,
      width: scanAreaWidth,
      height: scanAreaHeight,
    );

    final borderPath = Path()
      ..addRect(rect);
    //..addRect(scanAreaRect);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(_QrScannerOverlayPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor;
  }
}
Future checkForAppUpdate(context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  print('packageInfo \n\n\n\n\n\n\n ${packageInfo.version}');
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 60  ),
      minimumFetchInterval: Duration(seconds: 1)
  ));
  await remoteConfig.fetchAndActivate();

  bool forceUpdate = //if packageInfo.version is less than the version in firebase
  //
  remoteConfig.getString('app_version').compareTo(packageInfo.version) > 0;
  String appVersion = remoteConfig.getString('app_version');
  print('force_update \n\n\n\n\n\n\n $forceUpdate');
  print('app_version \n\n\n\n\n\n\n $appVersion');
  if (forceUpdate) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text("Update Available"),
              content: Text("A new version of the app is available."),
              actions: [
                TextButton(
                    child: Text("Update"),
                    onPressed: () {
                      //url_launcher to https://play.google.com/store/apps/details?id=kaleo.chat.app

                      final Uri _url = Uri.parse('https://play.google.com/store/apps/details?id=kaleo.chat.app');
                      launchUrl(_url);
                    }
                ),
                // TextButton(
                //     child: Text("Cancel"),
                //     onPressed: () { Navigator.pop(context); }
                // )
              ]
          );
        }
    );
  }
}


class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    _controller.scannedDataStream.listen((scannedData) {
      if (scannedData.code != null) {
        // Do something with the scanned data, e.g. display it on the screen
        print(scannedData.code);
      }
    });
  }
}