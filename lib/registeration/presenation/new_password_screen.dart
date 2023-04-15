// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';
//
// import '../../../core/constants/font_manager.dart';
// import '../../../core/constants/routes_manager.dart';
// import '../../../core/constants/strings.dart';
// import '../../../core/constants/styles_manager.dart';
// import '../../../network_exceptions.dart';
// import '../business_logic/auth_cubit/auth_cubit.dart';
// import '../business_logic/auth_cubit/auth_state.dart';
// import '../business_logic/auth_cubit/otp_cubit.dart';
//
// class NewPasswordScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//   double  height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//
//     var currentPassword = TextEditingController();
//     var newPassword = TextEditingController();
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//                SizedBox(
//                 height:height * 0.1,
//               ),
//               Text(
//                 'New Password',
//                 style: getSemiBoldStyle(color: Colors.black, fontSize: FontSizeManager.s22),
//               ),
//                SizedBox(
//                 height: height * 0.03,
//               ),
//               Text(
//                 'Please enter your email to receive a',
//                 style: getMediumStyle(color: Colors.grey[700]!, fontSize: FontSizeManager.s18),
//               ),
//                SizedBox(
//                 height: height * 0.01,
//               ),
//               Text(
//                 'link to  create a new password via email',
//                 style: getMediumStyle(color: Colors.grey[700]!, fontSize: FontSizeManager.s18),
//               ),
//               SizedBox(
//                 height: height * 0.05,
//               ),
//               defaultFormField(
//                   controller: currentPassword,
//                   type: TextInputType.emailAddress,
//                   isPassword: true,
//                   validate: (value) {
//                     if (value!.isEmpty) {
//                       return 'Email must not be empty';
//                     }
//                   },
//                   label: 'current password',
//                   radius: 30),
//               SizedBox(
//                 height: height * 0.03,
//               ),
//               defaultFormField(
//                   controller: newPassword,
//                   isPassword: true,
//                   type: TextInputType.emailAddress,
//                   validate: (value) {
//                     if (value!.isEmpty) {
//                       return 'Email must not be empty';
//                     }
//                   },
//                   label: 'new password',
//                   radius: 30),
//                SizedBox(
//                 height: height * 0.05,
//               ),
//               BlocConsumer<AuthCubit, AuthState>(
//                 listener: (context, state) {
//                 },
//                 builder: (context, state) {
//                   return state.when(
//                     idle: () =>     defaultButton(
//                         function: ()
//                         {
//                                AuthCubit.get(context).changePassword(token,
//                                   currentPassword.text, newPassword.text);
//                           //    AuthCubit.get(context).printMyName();
//                         },
//                         text: 'Next',
//                         radius: 30,
//                         isUpperCase: false),
//                     loading: () => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                     success: () {
//                       Navigator.pop(context);
//                       Navigator.of(context).pushNamed(AppRoutes.login);
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                     error: (NetworkExceptions networkExceptions) {
//                       return Center(
//                         child: Text(NetworkExceptions.getErrorMessage(
//                             networkExceptions)),
//
//                   );
//                     },
//                   );
//                 },
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
