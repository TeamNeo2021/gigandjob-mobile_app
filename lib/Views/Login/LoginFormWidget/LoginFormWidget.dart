import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/BLOC/authbloc_bloc.dart';
import 'package:gigandjob_mobile_app/Views/Login/LoginFormWidget/bloc/loginform_bloc.dart';

class LoginFormWidget extends StatefulWidget {
  LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        builder: (context, state) {
          switch (state.runtimeType) {
            case AuthInitialState:
              return buildLoginForm();
              break;
            case AuthSuccessfulState:
              return Container(
                  child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(fontSize: 24),
                ),
              ));
              break;
            case AuthFailedState:
              return Column(
                children: [
                  Text(
                    'Login failed',
                    style: TextStyle(fontSize: 18, color: Colors.redAccent),
                  ),
                  buildLoginForm()
                ],
              );
              break;
            case AuthLoadingState:
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
              break;
            default:
              return Container(
                child: Text('loading Form...'),
              );
              break;
          }
        });
  }

  buildLoginForm() {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var validForm = true;
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (_) {
              //return !state.email.valid ? 'Invalid Email' : null;
              if (emailController.text.isEmpty) {
                validForm = false;
                return 'Invalid Email';
              } else {
                validForm = true;
                return null;
              }
            },
          ),
          TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              controller: passwordController,
              obscureText: true,
              //autovalidate: true,
              autocorrect: false,
              validator: (_) {
                // return !state.password.valid ? 'Invalid Password' : null;
                if (passwordController.text.isEmpty) {
                  print('password empty');
                  validForm = false;
                  return 'Invalid Password';
                } else {
                  validForm = true;
                  return null;
                }
              }),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                "Login",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            disabledColor: Colors.blue[50],
            onPressed: validForm
                ? () {
                    BlocProvider.of<AuthBloc>(context).add(
                      AuthOnLoginEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  }
                : null,
          ),
        ],
      ),
    );
  }

  // buildLoginForm(){
  //    final emailController = TextEditingController();
  //     final passwordController = TextEditingController();
  //   return  Container(

  //     child: Column(

  //         children: [
  //            Container(
  //                       padding: EdgeInsets.all(5),
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.circular(10),
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 color: Color.fromRGBO(143, 148, 251, .2),
  //                                 blurRadius: 20.0,
  //                                 offset: Offset(0, 10))
  //                           ]),
  //                       child: Column(
  //                         children: <Widget>[
  //                           Container(
  //                             padding: EdgeInsets.all(8.0),
  //                             decoration: BoxDecoration(
  //                                 border: Border(
  //                                     bottom: BorderSide(color: Colors.grey))),
  //                             child: TextField(
  //                               controller: emailController,
  //                               decoration: InputDecoration(
  //                                   border: InputBorder.none,
  //                                   hintText: "Email",
  //                                   hintStyle:
  //                                       TextStyle(color: Colors.grey[400])),
  //                             ),
  //                           ),
  //                           Container(
  //                             padding: EdgeInsets.all(8.0),
  //                             child: TextField(
  //                               controller: passwordController,
  //                               decoration: InputDecoration(
  //                                   border: InputBorder.none,
  //                                   hintText: "Password",
  //                                   hintStyle:
  //                                       TextStyle(color: Colors.grey[400])),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 30,
  //                     ),
  //                     MaterialButton(
  //                       height: 50,
  //                       color: Colors.blue,
  //                       child: Center(
  //                         child: Text(
  //                           "Login",
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                       onPressed: () => BlocProvider.of<AuthBloc>(context).add(
  //                           AuthOnLoginEvent(
  //                               email: emailController.text,
  //                               password: passwordController.text)),
  //                     ),
  //         ]
  //       )
  //   );
  // }
}
