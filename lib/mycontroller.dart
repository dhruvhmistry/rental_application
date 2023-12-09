import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_application/Home.dart';
import 'package:rental_application/verification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authcontroller extends GetxController {
  RxString varid = "".obs;
  phoneverification(contrycode, mobilenumber, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${contrycode + mobilenumber}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print(e);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        varid.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    //Get.to(() => otpver());
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => otpver()), (route) => false);
  }

  RxString otp = ''.obs;

  verifyOTP(code) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: varid.value, smsCode: code);

      await auth.signInWithCredential(credential);

      final sp = await SharedPreferences.getInstance();
      sp.setBool('login', true);

      Get.to(() => Home());
    } catch (e) {
      Get.snackbar(
        "Error",
        'Enter Valid OTP.',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
    }
  }
}
