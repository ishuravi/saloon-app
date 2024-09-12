import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saloon/screens/dashboard.dart';
import '../color/colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> _otp = List.filled(6, '');
  Timer? _timer;
  int _start = 30;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 30;
    _isResendEnabled = false;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isResendEnabled = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/logo.png', // Path to your logo image
                width: 200, // Adjust width as needed
                height: 200, // Adjust height as needed
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Enter the OTP sent to your phone',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.text,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return _buildOtpBox(index);
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isResendEnabled ? _resendOtp : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                _isResendEnabled ? 'Resend OTP' : 'Resend in $_start s',
                style: TextStyle(color: AppColors.text),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_otp.join().length == 6) {
                  _verifyOtp();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Verify OTP', style: TextStyle(color: AppColors.text)),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildOtpBox(int index) {
    return Container(
      width: 40,
      child: TextFormField(
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.secondary, // Default border color
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: AppColors.secondary, // Border color when focused
              width: 2.0,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty) {
            _otp[index] = value;
            // Move focus to the next field if not the last field
            if (index < 5) {
              FocusScope.of(context).nextFocus();
            }
          } else {
            // Move focus to the previous field if the value is empty and not the first field
            if (index > 0) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }


  void _resendOtp() {
    _startTimer();
    print('Resending OTP...');
    // Add your resend OTP logic here
  }

  void _verifyOtp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
    String otpCode = _otp.join();
    print('Verifying OTP: $otpCode');
    // Add your OTP verification logic here
    // Navigate to another screen if verification is successful
  }
}
