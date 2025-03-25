import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Validator _validator = getIt<Validator>();

  String _selectedGender = "female";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// First Name & Last Name
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildTextField(
                      LocaleKeys.FirstName,
                      LocaleKeys.EnterFirstName,
                      _firstNameController,
                      _validator.validateName,
                    ),
                  ),
                  SizedBox(width: 17.w),
                  Expanded(
                    child: _buildTextField(
                      LocaleKeys.LastName,
                      LocaleKeys.EnterLastName,
                      _lastNameController,
                      _validator.validateName,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
      
              /// Email
              _buildTextField(
                LocaleKeys.Email,
                LocaleKeys.EnterYourEmail,
                _emailController,
                _validator.validateEmail,
              ),
              SizedBox(height: 24.h),
      
              /// Password & Confirm Password
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildTextField(
                      LocaleKeys.Password,
                      LocaleKeys.EnterYourPassword,
                      _passwordController,
                      _validator.validatePassword,
                    ),
                  ),
                  SizedBox(width: 17.w),
                  Expanded(
                    child: _buildTextField(
                      LocaleKeys.ConfirmPassword,
                      LocaleKeys.ConfirmPassword,
                      _confirmPasswordController,
                      (value) => _validator.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
      
              /// Phone Number
              _buildTextField(
                LocaleKeys.PhoneNumber,
                LocaleKeys.PhoneNumber,
                _phoneController,
                _validator.validatePhoneNumber,
              ),
              SizedBox(height: 24.h),
      
              /// Gender Selection
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.Gender.tr(),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: AppColors.gray),
                    ),
                    SizedBox(width: 40.w),
                    Expanded(child: _buildRadioTile("female", LocaleKeys.Female)),
                    Expanded(child: _buildRadioTile("male", LocaleKeys.Male)),
                  ],
                ),
              ),
      
              /// Terms & Conditions
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${LocaleKeys.CreatingAnAccountYouAgreeToOur.tr()}, ",
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: LocaleKeys.TermsAndConditions.tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
      
              /// Sign-Up Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implement registration functionality.
                  }
                },
                child: Text(LocaleKeys.Signup.tr()),
              ),
              SizedBox(height: 16.h),
      
              /// Already have an account? Login
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: LocaleKeys.AlreadyHaveAnAccount.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(fontSize: 16.sp),
                  children: [
                    TextSpan(
                      text: " ${LocaleKeys.Login.tr()}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.pink,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.pink,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to login screen
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //************************** Reusable Widgets ************************** */

  /// Reusable Text Field Builder
  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
    String? Function(String) validator,
  ) {
    return TextFormField(
      validator: (value) => validator(value ?? ''),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        labelText: label.tr(),
        hintText: hint.tr(),
        errorMaxLines: 2,
      ),
    );
  }

  /// Reusable Radio Tile Builder
  Widget _buildRadioTile(String value, String labelKey) {
    return RadioListTile<String>(
      title: Text(
        labelKey.tr(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 14.sp,
          color: _selectedGender == value ? AppColors.black : AppColors.gray,
        ),
      ),
      value: value,
      groupValue: _selectedGender,
      activeColor: AppColors.pink,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      onChanged: (newValue) => setState(() => _selectedGender = newValue!),
    );
  }
}
