// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../business_logic/Home/home_cubit.dart';
// import '../../business_logic/Home/home_state.dart';
//
//
// //use this cubit to change the bottom nav bar index
// //  static HomeCubit get(context) => BlocProvider.of(context);
// // List<String> listOfImages = [
// //   'assets/images/dashboard-2_svgrepo.com.png',
// //   'assets/images/scan-qrcode_svgrepo.com.png',
// //   'assets/images/🦆 icon _person_.png',
// //   'assets/images/Vector.png',
// // ];
// //   final List<Widget> _screens = [
// //    ScreenOne(),
// //    ScreenTwo(),
// //    ScreenThree(),
// //    ScreenFour(),
// //   ];
// // //function to select screen
// //   int _currentIndex = 0;
// //   int get currentIndex => _currentIndex;
// //   Widget get currentScreen => _screens[_currentIndex];
// //   void changeBottomNav(int index) {
// //     _currentIndex = index;
// //     emit(ChangeBottomNavState());
// //   }
// //edit this BottomNavBar
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         return Container(
//           //padding: EdgeInsets.symmetric(horizontal: screenWidth * .048),
//           //margin: EdgeInsets.all(20),
//           height: screenWidth * .155,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(.15),
//                 blurRadius: 30,
//                 offset: Offset(0, 10),
//               ),
//             ],
//             //  borderRadius: BorderRadius.circular(50),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               for (int index = 0;
//               index < HomeCubit.get(context).listOfImages.length;
//               index++)
//                 InkWell(
//                   onTap: () {
//                     HomeCubit.get(context).changeBottomNav(index);
//                     HapticFeedback.lightImpact();
//                   },
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   child: Stack(
//                     children: [
//                       AnimatedContainer(
//                         duration: Duration(seconds: 1),
//                         curve: Curves.fastLinearToSlowEaseIn,
//                         width: screenWidth * .2125,
//                         height: screenWidth * .12,
//                         decoration: BoxDecoration(
//                           color: index == HomeCubit.get(context).currentIndex
//                               ? //#2196F3
//                           Color(0xff2196F3)
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: screenWidth * .024),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 HomeCubit.get(context).listOfImages[index],
//                                 color: index ==
//                                     HomeCubit.get(context).currentIndex
//                                     ? //#F4F4F4
//                                 Color(0xffF4F4F4)
//                                     : //#B9B9B9
//                                 Color(0xffB9B9B9),
//                               ),
//                               SizedBox(height: 2),
//                               Text(
//                                 HomeCubit.get(context).listOfTitles[index],
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   fontFamily: 'IBM Plex Sans Arabic',
//                                   color: index ==
//                                       HomeCubit.get(context).currentIndex
//                                       ? Color(0xFF2196F3)
//                                       : Color(0xFFB9B9B9),
//                                   letterSpacing: 0.03.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }