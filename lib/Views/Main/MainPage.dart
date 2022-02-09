import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/bloc/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/LoginPage.dart';
import 'package:gigandjob_mobile_app/Views/SignUp/bloc/signup_bloc.dart';
import 'package:gigandjob_mobile_app/Views/SignUp/signup.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (_) => SignupBloc(),
        ),
      ],
      child: LoginPage(),
    );
  }

  // isAuthenticated(){
  //   return BlocListener{
  //     bloc: BlocProvider.of<AuthBloc>(context),
  //     listener: (context, state){
  //       if(state is Authenticated){
  //         Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()));
  //       }
  //     },
  //     child: LoginPage(),
  //   };

  // }
}
