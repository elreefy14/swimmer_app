import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/Home/home_cubit.dart';
import '../business_logic/Home/home_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        //Future<void> _initSchedules() async {
        //     final cachedSchedules = await getCachedSchedules();
        //     if (cachedSchedules.length < 20) {
        //       final nextSchedules = await fetchUserSchedules(widget.userId);
        //       _schedules = [...cachedSchedules, ...nextSchedules];
        //       cacheSchedules(_schedules);
        //     } else {
        //       _schedules = cachedSchedules;
        //     }
        //   }

        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container();
          },
        );
      }
    );
  }
}
