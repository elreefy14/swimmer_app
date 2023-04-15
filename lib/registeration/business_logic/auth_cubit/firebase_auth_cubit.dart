// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../../data/userModel.dart';
// import '../../presenation/widget/widget.dart';
//
// part 'firebase_auth_state.dart';
//
// class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
//   FirebaseAuthCubit() : super(FirebaseAuthInitial());
//   static FirebaseAuthCubit get(context) => BlocProvider.of(context);
//   //sign up using firebase to create new user using createUser method
//   Future<void> signUp({
//     required String password,
//     required String phone,
//     required String name}) async {
//     emit(
//       FirebaseAuthLoading(),
//     );
//     try {
//       final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: name, password: password);
//       createUser( uId: result.user!.uid,
//         name: name,
//         phone: phone,
//         );
//       emit(FirebaseAuthSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         //showToast
//         showToast(
//           msg:'The password provided is too weak.',
//           state: ToastStates.ERROR,
//         );
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that name');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   void createUser({
//     required String? uId,
//     required String? name,
//     required String? phone,
//   }) {
//     emit(CreateUserLoadingState());
//     UserModel model = UserModel(
//       viewedLessons: [],
//       deviceToken: [],
//       uId: uId,
//       boughtCourses: [],
//       enrolledCourses: [],
//       name: 'Write your name...',
//       phone: phone,
//       email: name,
//         // uID: uId,
//         // name: name,
//         // phone: phone,
//         // coverPic: 'https://media.cdnandroid.com/27/54/bb/52/imagen-cartoon-photo-editor-art-filter-2018-1gal.jpg',
//         // profilePic: 'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
//         // bio: 'Write you own bio...'
//     );
//     FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
//         .then((value) {
//       emit(CreateUserSuccessState(uId!));
//     }).catchError((error) {
//       emit(CreateUserErrorState());
//     });
//   }
//   void signUpFormSubmitted(String name, String phone, String password) {
//     // Validate the form and emit a new state
//     if (name.isEmpty) {
//       emit(SignUpFormStateError("Name is required"));
//     } else if (phone.isEmpty) {
//       emit(SignUpFormStateError("Phone is required"));
//     } else if (password.isEmpty) {
//       emit(SignUpFormStateError("Password is required"));
//     } else {
//       emit(SignUpFormStateSuccess());
//     }
//   }
//
//
// }
