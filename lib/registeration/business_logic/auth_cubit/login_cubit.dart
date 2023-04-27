// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/cashe_helper.dart';
import '../../data/userModel.dart';
import '../../data/user_cache_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(

      ) : super(LoginInitial());


static LoginCubit get(context) => BlocProvider.of(context);

  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  void signIn({
    required String phone,
    required String password,
  }) {
    emit(LoginLoadingState());
    print('email\n\n\n');
    print(phone+'@placeholder.com');
    print(password);
    //
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$phone@placeholder.com',
        password: password
    ).then((userCredential) async {
      var user = userCredential.user!;

      FirebaseMessaging.instance.getToken().then((token) {
        FirebaseFirestore.instance.collection('users')
            .doc(user.uid)
            .update({
          'deviceToken': FieldValue.arrayUnion([token]),
           // Save deviceId to user collection
        }).then((_) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get()
              .then((doc) {
            if (doc.exists) {
              var data = doc.data();
              if (data!['deviceToken'].length < 3) {
                // Save user token, uid, email, name, phone in cache for future use
                var userCacheModel = UserCacheModel(
                    token: token ?? '',
                    uid: user.uid ?? '',
                    email: user.email ?? '${data['email']}',
                    name: user.displayName ?? '${data['name']}',
                    phone: user.phoneNumber ?? '${data['phone']}'
                );
                CacheHelper.saveUser(userCacheModel);

                emit(LoginSuccessState(user.uid));
              } else {
                emit(LoginErrorState('User is already logged in on 3 devices.'));
              }
            } else {
              emit(LoginErrorState('User data not found.'));
            }
          });
        });
      });
    }).catchError((error) {
      String? errorMessage;
      switch (error.code) {
        case "invalid-email":
          if (kDebugMode) {
            errorMessage = 'The email address is badly formatted.';
          }
          break;
        case "user-not-found":
          if (kDebugMode) {
            errorMessage = 'No user found for that email.';
          }
          break;
        case "wrong-password":
          if (kDebugMode) {
            errorMessage = 'Wrong password provided for that user.';
          }
          break;
        default:
          if (kDebugMode) {
            errorMessage = 'The error is $error';
          }
      }
      print('error firebase:\n\n\n\n\n\n\n');
      print(error.code);
      print('error message:\n\n\n\n\n\n\n');
      print(errorMessage);
      emit(LoginErrorState(errorMessage ?? ""));
    });
  }


  void signOut() {
      FirebaseAuth.instance.signOut();
    }



    void getGoogleUserCredentials() async {
      emit(LoginGoogleUserLoadingState());
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!
          .authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        isUserExist(
            uId: value.user!.uid,
            name: value.user!.displayName,
            phone: value.user!.phoneNumber,
            email: value.user!.email,
            profilePic: value.user!.photoURL
        );
      });
    }


    void createGoogleUser({
      required String? uId,
      required String? name,
      required String? phone,
      required String? email,
      required String? profilePic
    }) {
      UserModel model = UserModel(
        // viewedLessons: [],
        // deviceToken: [],
        // uId: uId,
        // boughtCourses: [],
        // enrolledCourses: [],
        // name: 'Write your name...',
        // phone: phone,
        // email: email,

        // uID: uId,
        // name: name,
        // phone: phone ?? '0000-000-0000',
        // email: email,
        // dateTime: FieldValue.serverTimestamp(),
        // coverPic: 'https://media.cdnandroid.com/27/54/bb/52/imagen-cartoon-photo-editor-art-filter-2018-1gal.jpg',
        // profilePic: profilePic ??
        //     'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,width-1200,height-900/76729536.jpg',
        // bio: 'Write you own bio...',
      );
      FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap())
          .then((value) {
        emit(CreateGoogleUserSuccessState(uId!));
      }).catchError((error) {
        emit(CreateGoogleUserErrorState());
      });
    }

    bool showPassword = false;
    IconData suffixIcon = Icons.visibility_off_outlined;

    void changeSuffixIcon(context) {
      showPassword = !showPassword;
      if (showPassword)
        suffixIcon = Icons.visibility_outlined;
      else
        suffixIcon = Icons.visibility_off_outlined;
      emit(ChangeSuffixIconState());
    }
  }

  bool userExist = false;
  Future <void> isUserExist({
    required String? uId,
    required String? name,
    required String? phone,
    required String? email,
    required String? profilePic

  }) async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.id == uId)
          userExist = true;
      });
      if (userExist == false) {

    //    createGoogleUser(
    //        uId: uId,
     //       name: name,
    //        phone: phone,
    //        email: email,
   //         profilePic: profilePic
   //     );
      }
   //   else
 //       emit(LoginGoogleUserSuccessState(uId!));
    });
  }


