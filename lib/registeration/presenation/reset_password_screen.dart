// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:youtube_apis/core/constants/strings.dart';
// import 'package:youtube_apis/feautres/registeration/business_logic/auth_cubit/otp_cubit.dart';
// import 'package:youtube_apis/feautres/registeration/presenation/reset_code_screen.dart';
// import 'package:youtube_apis/feautres/registeration/presenation/widget/widget.dart';
//
// import '../../../core/constants/font_manager.dart';
// import '../../../core/constants/styles_manager.dart';
//
// class ResetPasswordScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     var emailController = TextEditingController();
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//                SizedBox(
//                 height: height * 0.1,
//               ),
//               Text(
//                 'Reset Password',
//                 style: getSemiBoldStyle(color: Colors.black, fontSize: FontSizeManager.s22),
//               ),
//                SizedBox(
//                 height: height * 0.03,
//               ),
//               Text(
//                 'Please enter your email to receive a',
//                 style: getMediumStyle(color: Colors.grey[700]!, fontSize: FontSizeManager.s18),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'link to  create a new password via email',
//                 style: getMediumStyle(color: Colors.grey[700]!, fontSize: FontSizeManager.s18),
//               ),
//                SizedBox(
//                 height: height * 0.05,
//               ),
//               BlocConsumer<OtpCubit,OtpState>(
//            listener: (context, state) {
//            // TODO: implement listener
//             },
//            builder: (context, state) {
//                 return defaultFormField(
//             //TODO: implement submit
//                   //    onSubmit: (value) {
//              //     phoneNumber=value;
//               //  },
//                     onChange: (value) {
//                       phoneNumber=value;
//                     },
//                   controller: emailController,
//                   type: TextInputType.emailAddress,
//                   label: 'phone number ',
//                   radius: 30,
//                   validate: (String? val) {
//                   });
//   },
// )
//               ,
//                SizedBox(
//                 height: height * 0.04,
//               ),
//               BlocConsumer<OtpCubit, OtpState>(
//      listener: (context, state) {
//      if(state is OTPSent){
//        navigateTo(context, ResetCodeScreen());
//      }
//     },
//    builder: (context, state) {
//        return ConditionalBuilder(
//          condition: state is phoneNumberSubmittedLoading||state is PhoneNumberSubmittedloaded,
//          builder: (context) =>Center(child: CircularProgressIndicator()),
//          fallback: (context) =>
//            defaultButton(
//                function: () {
//                  OtpCubit.get(context).phoneNumberSubmitted(phoneNumber);
//                },
//                text: 'Send',
//                radius: 30,
//                isUpperCase: false
//            ),
//        );
//   },
// ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
