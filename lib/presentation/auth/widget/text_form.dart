import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/core/enums/auth_enums.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/services/validation_service/validation_service.dart';
import 'package:ddverse/core/ui_component/loadingbutton.dart';
import 'package:ddverse/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextForm extends StatefulWidget {
  final AuthEnum authRoute;
  const TextForm({super.key, required this.authRoute});
  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  User credentials = User(email: "", password: "");

  void onClick() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    formKey.currentState!.save();
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<AuthBloc>().add(
      widget.authRoute == AuthEnum.signUp
          ? SignUpEvent(user: credentials)
          : SignInEvent(user: credentials),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeService.width(context) * 0.0300,
      ),
      child: Form(
        key: formKey,
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator:
                  widget.authRoute == AuthEnum.signUp
                      ? (value) {
                        final info = ValidationService.validateEmail(value);
                        if (info != null) {
                          return info;
                        }
                        return null;
                      }
                      : (value) {
                        if (value!.isEmpty) {
                          return "Enter your email";
                        }
                        return null;
                      },
              decoration: InputDecoration(
                hintText: "Email",
                border: _outlineInputBorder(Colors.grey),
                enabledBorder: _outlineInputBorder(Colors.grey),
                focusedBorder: _outlineInputBorder(Colors.black),
                errorBorder: _outlineInputBorder(Colors.red),
                focusedErrorBorder: _outlineInputBorder(Colors.red),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSaved: (value) {
                credentials.email = value!.trim();
              },
            ),
            TextFormField(
              validator:
                  widget.authRoute == AuthEnum.signUp
                      ? (value) {
                        final info = ValidationService.validatePassword(value);
                        if (info != null) {
                          return info;
                        }
                        return null;
                      }
                      : (value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        }
                        return null;
                      },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                hintText: "Password",
                border: _outlineInputBorder(Colors.grey),
                enabledBorder: _outlineInputBorder(Colors.grey),
                focusedBorder: _outlineInputBorder(Colors.black),
                errorBorder: _outlineInputBorder(Colors.red),
                focusedErrorBorder: _outlineInputBorder(Colors.red),
              ),
              obscureText: hidePassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onSaved: (value) {
                credentials.password = value!.trim();
              },
            ),

            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return state is AuthLoadingState &&
                        state.loadingSource != AuthEnum.forgot
                    ? buildLoadingButton(
                      SizeService.height(context) * 1,
                      SizeService.height(context) * 0.0747,
                    )
                    : ElevatedButton(
                      onPressed: () async {
                        onClick();
                      },
                      child: Text(
                        widget.authRoute == AuthEnum.signUp
                            ? "Signup"
                            : "Signin",
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(color: Colors.white),
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder _outlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: 1.5),
  );
}
