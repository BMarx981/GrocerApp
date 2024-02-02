import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/login_providers/login_provider.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';

class LoginSection extends ConsumerWidget {
  const LoginSection({super.key});

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
          child: Column(
            children: [
              const Expanded(
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
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomTextformField(
                      label: "User Name",
                      key: Key('login_username_textfield'))),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomTextformField(
                      label: "Password",
                      obscureText: true,
                      key: Key('login_password_textfield'))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                        value: provider,
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
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("Submit",
                      style: provider
                          ? const TextStyle(color: Colors.red)
                          : const TextStyle(color: Colors.grey)),
                  onPressed: () {
                    provider
                        ? Beamer.of(context)
                            .beamToReplacementNamed('/dashboard')
                        : null;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
