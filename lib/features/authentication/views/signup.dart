import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/customwidgets/text/body.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),

                // Title
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 30),

                // Name Field
                _buildLabel('Name'),
                SizedBox(height: 8),
                _buildTextField(
                  hintText: 'Enter your full name',
                  keyboardType: TextInputType.name,
                ),

                SizedBox(height: 12),

                // Email Field
                _buildLabel('Email'),
                SizedBox(height: 8),
                _buildTextField(
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 12),

                // Phone Number Field
                _buildLabel('Phone number'),
                SizedBox(height: 8),
                _buildTextField(
                  hintText: 'Enter your phone number',
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(height: 12),

                // Password Field
                _buildLabel('Password'),
                SizedBox(height: 8),
                _buildTextField(
                  hintText: 'Enter your password',
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                SizedBox(height: 12),

                // Repeat Password Field
                _buildLabel('Repeat Password'),
                SizedBox(height: 8),
                _buildTextField(
                  hintText: 'Repeat your password',
                  obscureText: _obscureRepeatPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureRepeatPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureRepeatPassword = !_obscureRepeatPassword;
                      });
                    },
                  ),
                ),

                SizedBox(height: 14),

                // Terms and Conditions Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                        });
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: Colors.orange,
                      checkColor: Colors.white,
                    ),
                    Expanded(
                      child: MainBody(title: "Agree to Terms & Condition"),
                    ),
                  ],
                ),

                SizedBox(height: 18),

                // Sign Up Button
                Container(
                  height: 48,
                  child: ElevatedButton(
                    onPressed:
                        _agreeToTerms
                            ? () {
                              // Handle sign up
                              print('Sign up pressed');
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      disabledBackgroundColor: AppColors.orange.withOpacity(
                        0.6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle login navigation
                        print('Login pressed');
                      },
                      child: Text(
                        'Login in',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      height: 50,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
