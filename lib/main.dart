import 'package:ddverse/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:ddverse/bloc/auth_state_bloc/bloc/auth_state_bloc.dart';
import 'package:ddverse/core/bloc_dependencies/auth_dep.dart';
import 'package:ddverse/core/route/route.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/theme/elevatedbutton.dart';
import 'package:ddverse/core/theme/floatingbutton.dart';
import 'package:ddverse/core/theme/text_theme.dart';
import 'package:ddverse/secrets/firebase_options.dart';
import 'package:ddverse/presentation/auth/widget/switch_signinup.dart';
import 'package:ddverse/presentation/home/navbar.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = SizeService.height(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(authDep)),
        BlocProvider(create: (context) => AuthStateBloc(firebaseAuthInstance)),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: textTheme(size),
          elevatedButtonTheme: elevatedButtonTheme(size),
          floatingActionButtonTheme: floatingActionButtonTheme(),
        ),
        routes: routes,
        home: BlocSelector<AuthStateBloc, AuthStateState, bool>(
          selector: (state) {
            return state is LoggedInState;
          },
          builder: (context, isloggedIn) {
            if (isloggedIn) {
              return const NavBar();
            } else {
              return SwitchSigninup();
            }
          },
        ),
      ),
    );
  }
}
