import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_dp_app/theme/themes.dart';
import 'package:flutter_ecommerce_dp_app/widgets/custom_text_fields.dart';
import 'package:flutter_ecommerce_dp_app/widgets/gradient_buttons.dart';

class ForgotEmailScreen extends StatefulWidget {
  const ForgotEmailScreen({super.key});

  @override
  State<ForgotEmailScreen> createState() => _ForgotEmailScreenState();
}

class _ForgotEmailScreenState extends State<ForgotEmailScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _recoveryStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Email",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Enter your phone number to recover your email address",
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 48,
              ),
              if (!_recoveryStarted)
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CustomTextFields(
                        label: "Phone Number",
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your phone number";
                          }
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GradientButton(
                          text: "Recover Email",
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                _recoveryStarted = true;
                              });
                            }
                          }),
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Back to Login",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppTheme.success.withValues(alpha:0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        size: 40,
                        color: AppTheme.success,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Recovery SMS Sent",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "We have sent your email address to your phone number. Please check your Messages.",
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
