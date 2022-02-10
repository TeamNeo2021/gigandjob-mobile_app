import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_mobile_app/Widgets/BottomNavBar/bloc/bottomnavbar_bloc.dart';

import 'Dominio/Services/AuthService.dart';
import 'Utils/BlocObserver.dart';

import 'Views/DetallesOferta/bloc/detallesoferta_bloc.dart';
import 'Views/Login/BLOC/authbloc_bloc.dart';
import 'Views/Login/BLOC/authbloc_bloc.dart';
import 'Views/Login/LoginPage.dart';
import 'Views/Main/MainPage.dart';
import 'Views/OfferList/OfferListBLOC/offerlist/offerlist_bloc.dart';
import 'Views/OfferList/OfferList_screen.dart';
import 'Views/SignUp/bloc/signup_bloc.dart';

// void main() {
//   runApp(StateApp());
// }

// class StateApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [
//       //Aqui van todos sus archivos tipo BLOC
//       BlocProvider<DetallesofertaBloc>(
//           create: (_) => DetallesofertaBloc(), child: Container()),
//       BlocProvider<OfferlistBloc>(
//         create: (_) => OfferlistBloc(),
//       )
//     ], child: MyApp());
//   }
// }

Future<void> main() async {
  await BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  final base_url =
      'https://salvacion-git-job.herokuapp.com/'; //el url se otorga mediante inyeccion de dependencia

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
              authRepository: new AuthService(url: (base_url + 'auth/'))),
        ),
        BlocProvider<BottomNavBarBloc>(
          create: (_) => BottomNavBarBloc(),
        ),
        BlocProvider<DetallesofertaBloc>(
          create: (_) => DetallesofertaBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (_) => SignupBloc(),
        ),
      ],
      child: materialApp(),
    );
  }
}

materialApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Gig & jobs App',
    initialRoute: '/',
    routes: {
      '/': (context) => const MainPage(),
    },
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
  );
}
