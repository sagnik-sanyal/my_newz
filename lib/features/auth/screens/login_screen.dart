import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/ui_constants.dart';
import '../../../shared/extensions/context_ext.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/loading_button.dart';
import '../providers/auth_notifier.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import 'signup_screen.dart';

@immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  /// Builds the form
  FormGroup _buildForm() {
    return FormGroup(<String, AbstractControl<Object?>>{
      'email': FormControl<String>(
        validators: <Validator<Object?>>[Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: <Validator<Object?>>[
          Validators.required,
          Validators.minLength(6),
          Validators.pattern(PasswordField.regex),
        ],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppText.bold('MyNews', color: AppColors.primary, fontSize: 20),
      ),
      body: ReactiveFormBuilder(
        form: _buildForm,
        builder: (_, __, Widget? child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const EmailField(controlName: 'email'),
                        const PasswordField(controlName: 'password'),
                      ].addSpacing(25),
                    ),
                  ),
                ),
              ),
              _buildButton(),
              _buildFooter(context)
                  .padding(const EdgeInsets.only(top: vPadding - 4)),
            ],
          ),
        ),
      ).padding(),
    );
  }

  /// Builds the footer text
  Text _buildFooter(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'New here? ',
        style: const TextStyle(fontWeight: FontWeight.w400),
        children: <WidgetSpan>[
          WidgetSpan(
            child: GestureDetector(
              onTap: () => context.push<void>(const SignupScreen()),
              child: AppText.bold(
                'Register',
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the register button
  ReactiveFormConsumer _buildButton() {
    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup form, _) => LoadingButton(
        isLoading: context
            .select<AuthNotifier, bool>((AuthNotifier n) => n.isLoggingIn),
        onPressed: form.invalid
            ? null
            : () => context.read<AuthNotifier>().loginUser(form.value),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(220, 49),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text('Login'),
      ),
    );
  }
}
