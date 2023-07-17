// ignore_for_file: unused_import

import 'dart:ffi';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/cashe_helper.dart';
import '../../data/userModel.dart';
import '../../data/user_cache_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(

      ) : super(LoginInitial());


static LoginCubit get(context) => BlocProvider.of(context);
//form key
  final formKey = GlobalKey<FormState>();
  //text editing controller
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  //
  // String? profilePicURL;
  //
  // Future<void> uploadProfilePic(
  //
  //     ) async {
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child(Uri.file(profileImage!.path).pathSegments.last)
  //       .putFile(profileImage!)
  //       .then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       editUserData(
  //         image: value,
  //       );
  //       emit(UploadProfilePicSuccessState());
  //     }).catchError((error) {
  //       print(error.toString());
  //       emit(UploadProfilePicErrorState());
  //     });
  //     emit(UploadProfilePicSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(UploadProfilePicErrorState());
  //   });
  // }
  // File? profileImage;
  // ImagePicker? picker = ImagePicker();
  //
  // Future? getProfileImage() async {
  //   final pickedFile = await picker?.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     profileImage =  File(pickedFile.path);
  //     await uploadProfilePic();
  //     emit(GetProfilePicSuccessState());
  //   } else {
  //     print('No Image Selected');
  //     emit(GetProfilePicErrorState());
  //   }
  // }
  // void editUserData({
  //   String? firstName,
  //   String? lastName,
  //   String? phone,
  //   String? image,
  // }) async {
  //   emit(EditUserDataLoadingState());
  //   final user = FirebaseAuth.instance.currentUser;
  //   final updateData = <String, Object?>{};
  //   final notificationData = <String, dynamic>{};
  //   //// Retrieve the user data from the cache
  //   // UserCacheModel userData = CacheHelper.getUser();
  //   //
  //   // // Update the specific attribute
  //   // userData.hourlyRate = newHourlyRate;
  //   //
  //   // // Save the updated user data back to the cache
  //   // CacheHelper.saveUser(userData);
  //   //CacheHelper.getUser();
  //   UserCacheModel? userData =await CacheHelper.getUser();
  //   if (firstName != null) {
  //     updateData['first_name'] = firstName;
  //     userData!.fname = firstName;
  //     notificationData['message'] = 'تم تحديث الاسم الأول إلى $firstName';
  //      }
  //   if (lastName != null) {
  //     updateData['last_name'] = lastName;
  //     userData!.lname = lastName;
  //     notificationData['message'] = 'تم تحديث الاسم الأخير إلى $lastName';
  //   }
  //   if (phone != null) {
  //     updateData['phone'] = phone;
  //     userData!.phone = phone;
  //     notificationData['message'] = 'تم تحديث رقم الهاتف إلى $phone';
  //   }
  //   if (image != null) {
  //     updateData['image'] = image;
  //     userData!.image = image;
  //     notificationData['message'] = 'تم تحديث الصورة إلى $image';
  //   }
  //
  //   // Update the user data
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user!.uid)
  //         .update(updateData);
  //
  //     // Update the local cache
  //     CacheHelper.getUser()!.then((userData) {
  //       if (firstName != null) {
  //         userData!.name = firstName + ' ' + (lastName ?? '');
  //       }
  //       if (phone != null) {
  //         userData!.phone = phone;
  //       }
  //       if (image != null) {
  //         userData!.image = image;
  //       }
  //       CacheHelper.saveUser(userData);
  //     });
  //     // Add notification to the subcollection
  //     notificationData['timestamp'] = FieldValue.serverTimestamp();
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .collection('notifications')
  //         .add(notificationData);
  //
  //     emit(EditUserDataSuccessState());
  //   } catch (error) {
  //     print(error.toString());
  //     emit(EditUserDataErrorState(error.toString()));
  //   }
  // }

//make a function to edit user data in firebase and cache
  //user can edit first name , last name , image ,phone number seperately in firebase and cache
  // void editUserData({
  //   String? firstName,
  //   String? lastName,
  //   String? phone,
  //   String? image,
  // }) {
  //   emit(EditUserDataLoadingState());
  //   var user = FirebaseAuth.instance.currentUser;
  //   Map<String, Object?> updateData = {};
  //   if (firstName != null) {
  //     updateData['first_name'] = firstName;
  //   }
  //   if (lastName != null) {
  //     updateData['last_name'] = lastName;
  //   }
  //   if (phone != null) {
  //     updateData['phone'] = phone;
  //   }
  //   if (image != null) {
  //     updateData['image'] = image;
  //   }
  //
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .update(updateData)
  //       .then((_) {
  //     // update local cache
  //     CacheHelper.getUser()!.then((userData) {
  //       if (firstName != null) {
  //         userData!.name = firstName + ' ' + (lastName ?? '');
  //       }
  //       if (phone != null) {
  //         userData!.phone = phone;
  //       }
  //       if (image != null) {
  //         userData!.image = image;
  //       }
  //       CacheHelper.saveUser(userData);
  //     });
  //
  //     emit(EditUserDataSuccessState());
  //   }).catchError((error) {
  //     emit(EditUserDataErrorState(error.toString()));
  //   });
  // }
  UserCacheModel? userData ;
  void userLogin({
    required String phone,
    required String password,
  }) {
    //rafik  //
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
              if (data!['deviceToken'].length < 1000000) {

                 userData = UserCacheModel(
                                      image: data['image'],
                                      email: user.email??'${data['phone']}@placeholder.com',
                                      phone: user.phoneNumber??data['phone'],
                                      token: token??data['deviceToken'][0],
                                      uId: user.uid,
                                      fname: data['fname'],
                                      lname: data['lname'],
                                      name: data['name'],
                                      level: data['level'],
                                      hourlyRate: data['hourlyRate']??30,
                                      totalHours: data['totalHours']??0,
                                      totalSalary: data['totalSalary']??0,
                                      currentMonthHours: data['currentMonthHours']??0,
                                      currentMonthSalary: data['currentMonthSalary']??0,

                   branches: (data['branches'] as List<dynamic>).map((branch) => branch.toString()).toList(),
                                    );
                                    CacheHelper.saveUser(userData);

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
        //network error
        case "network-request-failed":
          if (kDebugMode) {
            errorMessage = 'Please check your internet connection';
          }
          break;
        case "invalid-email":
          if (kDebugMode) {
            //translate to arabic
            //errorMessage = 'The email address is badly formatted.';
            errorMessage = 'البريد الإلكتروني غير صالح';
          }
          break;
        case "user-not-found":
          if (kDebugMode) {
           // errorMessage = 'No user found for that mobile number.';
            errorMessage = 'لا يوجد مستخدم بهذا الرقم';
          }
          break;
        case "wrong-password":
          if (kDebugMode) {
          //  errorMessage = 'Wrong password provided for that user.';
            errorMessage = 'كلمة المرور غير صحيحة';
          }
          break;
        default:
          if (kDebugMode) {
           errorMessage = 'The error is $error';
          //  errorMessage = 'حدث خطأ ما';
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


