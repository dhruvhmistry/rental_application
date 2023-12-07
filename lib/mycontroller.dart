import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rental_application/Home.dart';
import 'package:rental_application/verification.dart';

class authcontroller extends GetxController {
  RxString varid = "".obs;
  phoneverification(contrycode, mobilenumber) async {
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
    Get.to(() => otpver());
  }

  RxString otp = ''.obs;

  verifyOTP(code) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: varid.value, smsCode: code);

      await auth.signInWithCredential(credential);

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
