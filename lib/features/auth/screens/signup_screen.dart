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
import '../widgets/name_field.dart';
import '../widgets/password_field.dart';

@immutable
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  /// Builds the form
  FormGroup _buildForm() {
    return FormGroup(<String, AbstractControl<Object?>>{
      'name': FormControl<String>(
        validators: <Validator<Object?>>[
          const RequiredValidator(),
          const MinLengthValidator(3),
          Validators.pattern(RegExp(r'^[a-zA-Z\s]*$')),
        ],
      ),
      'email': FormControl<String>(
        validators: const <Validator<Object?>>[
          RequiredValidator(),
          EmailValidator(),
        ],
      ),
      'password': FormControl<String>(
        validators: <Validator<Object?>>[
          const RequiredValidator(),
          const MinLengthValidator(6),
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
                        const NameField(controlName: 'name'),
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
          ).padding(),
        ),
      ),
    );
  }

  /// Builds the footer text
  Text _buildFooter(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Already have an account? ',
        style: const TextStyle(fontWeight: FontWeight.w400),
        children: <WidgetSpan>[
          WidgetSpan(
            child: GestureDetector(
              onTap: () => context.pop<void>(),
              child: AppText.bold(
                'Login',
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the submit button
  ReactiveFormConsumer _buildButton() {
    return ReactiveFormConsumer(
      builder: (BuildContext cxt, FormGroup form, _) => LoadingButton(
        isLoading:
            cxt.select<AuthNotifier, bool>((AuthNotifier n) => n.isSigningUp),
        onPressed: form.invalid
            ? null
            : () => cxt.read<AuthNotifier>().registerUser(form.value, cxt),
        child: const Text('Signup'),
      ),
    );
  }
}
