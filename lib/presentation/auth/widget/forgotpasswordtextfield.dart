import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/core/enums/auth_enums.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/ui_component/loadingbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordTextField extends StatefulWidget {
  const ForgotPasswordTextField({super.key});

  @override
  State<ForgotPasswordTextField> createState() =>
      _ForgotPasswordTextFieldState();
}

class _ForgotPasswordTextFieldState extends State<ForgotPasswordTextField> {
  final formKey = GlobalKey<FormState>();
  String? _email;

  void onClick() {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) return;
    formKey.currentState!.save();
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<AuthBloc>().add(ForgotPasswordEvent(email: _email!));
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
              validator: (value) {
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
                _email = value!.trim();
              },
            ),

            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return state is AuthLoadingState &&
                        state.loadingSource == AuthEnum.forgot
                    ? buildLoadingButton(
                      SizeService.height(context) * 1,
                      SizeService.height(context) * 0.0747,
                    )
                    : ElevatedButton(
                      onPressed: () async {
                        onClick();
                      },
                      child: Text(
                        "Reset",
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
