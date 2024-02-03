import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/login_providers/login_provider.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';
import 'package:grocerapp/presentation/view/features/login/terms_conditions.dart';

class LoginSection extends ConsumerWidget {
  LoginSection({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginTermsNotifierProviderProvider);
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 3),
        child: Container(
          width: 350,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: Colors.white,
              ),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.8)
              ])),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                _titleRow(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextformField(
                    label: "User Name",
                    key: const Key(
                      'login_username_textfield',
                    ),
                    validator: (value) {
                      return validateUsername(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextformField(
                    label: "Password",
                    obscureText: true,
                    key: const Key('login_password_textfield'),
                    validator: (value) {
                      if (value == "") return "Plese enter a valid password";
                      return null;
                    },
                  ),
                ),
                _termAndConditionsRow(provider, ref, context),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    key: const Key("login_submit_button"),
                    child: Text("Submit",
                        style: provider
                            ? const TextStyle(color: Colors.red)
                            : const TextStyle(color: Colors.grey)),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        provider
                            ? Beamer.of(context)
                                .beamToReplacementNamed('/dashboard')
                            : null;
                      } else {}
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateUsername(String userName) {
    if (userName == "") return "Please enter a valid user name";
    return null;
  }

  String? validatePassword(String password) {
    if (password == "") return "Please enter a valid password";
    return null;
  }

  Widget _termAndConditionsRow(
      bool checked, WidgetRef ref, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
              key: const Key('login_term_check'),
              value: checked,
              onChanged: (value) {
                ref
                    .read(loginTermsNotifierProviderProvider.notifier)
                    .checkBoxSelected();
              }),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Please agree to our ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'terms and conditions',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(
                        context: context,
                        builder: (context) => showTermsAlertDialog(context),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleRow() {
    return const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
