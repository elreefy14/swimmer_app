import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';
class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return context.watch<HomeCubit>().currentScreen;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen One',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Screen Two',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen Three',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Screen Four',
          ),
        ],
        currentIndex: context.watch<HomeCubit>().currentIndex,
        onTap: (index) {
          context.read<HomeCubit>().changeBottomNav(index);
        },
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //container with height 100
        Container(
          height: 270.h,
          width: double.infinity,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/Dashboard Card.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            children: [
              SizedBox(height: 17.0.h),
              CircleAvatar(
                radius: 50, // adjust the size as needed
                backgroundImage: AssetImage('assets/images/Ellipse 1.jpg'), // replace with your image path
              ),
              SizedBox(height: 2.0.h),
              Text(
                'سعيد محمد',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 19 / 16,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 16.0.h),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'اقرب موعد',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 5.0.w),
                    Text(
                      '4/ 24 - 11 AM',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.0.h),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //Text(
                      //   text = "السعر / الساعة",
                      //   fontSize = 12.sp,
                      //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                      //   color = Color(0xFFFFFFFF),
                      //   textAlign = TextAlign.Right)
                      'السعر / الساعة ',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 5.0.w),
                    Text(
                      '4/ 24 - 11 AM',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.0.h),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الفروع',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 5.0.w),
                    Text(
                      '4/ 24 - 11 AM',
                      style: TextStyle(
                        fontFamily: 'Montserrat-Arabic',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0.h),



            ],
          ),
        ),
        SizedBox(height: 15.0.h),
        Text(
          'هذا الشهر',
          style: TextStyle(
            fontFamily: 'Montserrat-Arabic',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 18,
            height: 21 / 18,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 10.0.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.0.w,
              height: 40.0.h,
              decoration: BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(12.0.r),
              ),
              child: Center(
                child:
                //Text(
                //   text = "680 ج.م",
                //   fontSize = 14.sp,
                //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                //   color = Color(0xFFFFFFFF),
                //   textAlign = TextAlign.Center)
                Text(
                  '680 ج.م',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    height: 16 / 14,
                    color: Color(0xFFFFFFFF),
                  ),
                ),

              ),
            ),
            //w 10
            SizedBox(width: 10.0.w),
            Container(
              width: 100.0.w,
              height: 40.0.h,
              decoration: BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(12.0.r),
              ),
              child: Center(
                child:
                //Text(
                //   text = "680 ج.م",
                //   fontSize = 14.sp,
                //   fontFamily = FontFamily(Font(R.font.montserrat-arabic),
                //   color = Color(0xFFFFFFFF),
                //   textAlign = TextAlign.Center)
                Text(
                  '680 ج.م',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Arabic',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    height: 16 / 14,
                    color: Color(0xFFFFFFFF),
                  ),
                ),

              ),
            ),
          ],
        ),
        //10 h
        SizedBox(height: 10.0.h),
        //Modifier
        //   .offset(x = 8.dp, y = 11.dp)
        //   .width(63.dp)
        //   .height(59.dp)
        Container(
          width: 80.0.w,
          height: 80.0.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF2196F3),
              width: 2.0.w,
            ),
            borderRadius: BorderRadius.circular(12.0.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //The element type 'AssetImage' can't be assigned to the list type 'Widget'.
              Image( image:   AssetImage('assets/images/scan-qrcode_svgrepo.com.jpg'),),
              Text(
                'امسح QR',
                style: TextStyle(
                  fontFamily: 'Montserrat-Arabic',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  height: 16 / 14,
                  color: Color(0xFF333333),
                ),
              ),

            ],
          ),
        ),
        //15 h
        SizedBox(height: 15.0.h),
        Padding(
          padding:  EdgeInsets.symmetric(
horizontal: 20.0.w,
          ),

          child: Row(
            children: [

              Text(
                'ساعات العمل',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 19 / 16,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
     // SizedBox(height: 5.0.h),
        //Modifier
        //   .offset(x = 5.dp, y = 5.dp)
        //   .border(width = 1.dp, color = Color(0xFF2196F3), shape = RoundedCornerShape(size = 4.dp)))
        //   .padding(1.dp)
        //   .width(310.dp)
        //   .height(20.dp)
        //   .background(color = Color(0xFFFFFFFF), shape = RoundedCornerShape(size = 4.dp))
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.0.h),
           //   physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context, index) => Container(
                width: 310.0.w,
                height: 20.0.h,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(4.0.r),
                  border: Border.all(
                    color: Color(0xFF2196F3),
                    width: 1.0.w,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'الأحد',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFF333333),
                      ),
                    ),
                    //Text(
                    //   text = "2023/04/23",
                    //   fontSize = 12.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   color = Color(0xFF333333),
                    //   textAlign = TextAlign.Right)
                    Text(
                      '2023/04/23',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFF333333),
                      ),
                    ),
                    //Text(
                    //   text = "10 AM",
                    //   fontSize = 12.sp,
                    //   fontFamily = FontFamily(Font(R.font.ibm plex sans arabic),
                    //   color = Color(0xFF333333),
                    //   textAlign = TextAlign.Center)
                    Text(
                      '10 AM',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 14 / 12,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: 10,

            ),
          ),
        ),


      ],
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen Two'),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen Three'),
    );
  }
}

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen Four'),
    );
  }
}