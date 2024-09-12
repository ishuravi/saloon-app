import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import '../color/colors.dart';
import 'otp_page.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _otp = '';
  bool _isLogin = true;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Ensure Form widget is properly wrapped with _formKey
          child: ListView(
            children: <Widget>[
              SizedBox(height: 40),
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Image.asset(
                      'assets/logo.png',
                      height: 200.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    _isLogin ? 'Login' : 'Signup',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (!_isLogin)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildTextFormField(
                      labelText: 'Full Name',
                      prefixIcon: null,
                      onChanged: (value) {
                        setState(() {
                          _fullName = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: _buildTextFormField(
                    labelText: 'Phone Number',
                    prefixIcon: Icons.phone,
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (!_isLogin)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildTextFormField(
                      labelText: 'Email Address',
                      prefixIcon: null,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              SizedBox(height: 20),
              if (!_isLogin)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildTextFormField(
                      labelText: 'Password',
                      prefixIcon: null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              SizedBox(height: 20),
              if (!_isLogin)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildTextFormField(
                      labelText: 'Confirm Password',
                      prefixIcon: null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _confirmPassword = value;
                        });
                      },
                      validator: (value) {
                        if (value != _password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              SizedBox(height: 20),
              if (!_isLogin)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildTextFormField(
                      labelText: 'OTP',
                      prefixIcon: null,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _otp = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length != 6) {
                          return 'Please enter a valid OTP';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ensure _formKey.currentState is not null
                  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                    print('Form is valid');  // Debugging print statement
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpVerificationScreen()),
                    );
                  } else {
                    print('Form is not valid');  // Debugging print statement
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(_isLogin ? 'Login' : 'Signup', style: TextStyle(color: AppColors.text)),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin ? 'Don\'t have an account? Signup' : 'Already have an account? Login',
                  style: TextStyle(color: AppColors.text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField({
    required String labelText,
    IconData? prefixIcon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.text),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.secondary) : null,
        filled: true,
        fillColor: AppColors.primary.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.accent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.accent),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
