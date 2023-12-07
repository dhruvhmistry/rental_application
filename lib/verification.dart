import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rental_application/Home.dart';
import 'package:rental_application/Resetpass.dart';
import 'package:rental_application/forgotpass.dart';
import 'package:rental_application/mycontroller.dart';

class otpver extends StatelessWidget {
  const otpver({super.key});

  @override
  Widget build(BuildContext context) {
    String otp = "";
    final authcontroller controller = Get.put(authcontroller());

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 65, 68),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                "Enter your OTP code here",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40,
              ),
              Pinput(
                focusedPinTheme: PinTheme(),
                length: 6,
                onChanged: (Value) {
                  otp = Value;
                  controller.otp.value = Value;
                  print(otp);
                },
                onCompleted: (code) {
                  otp = code;
                  controller.otp.value = code;
                  print(otp);
                },
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  try {
                    if (controller.otp.value.length == 6) {
                      controller.verifyOTP(controller.otp.value);
                    }
                  } catch (e) {
                    if (controller.otp.value.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Enter 6 Digit OTP")));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Invalid OTP")));
                    }
                    // OnTap;
                    // () {
                    //   Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(builder: (context) => Home()));
                    // };
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF1B3E41),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "verify",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(33.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        color: Colors.red,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    ));
  }
}
