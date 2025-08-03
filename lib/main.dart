import 'package:bolg_website/Bloc/bloc/blog_fetch_bloc.dart';
import 'package:bolg_website/Screens/Maintree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDl2muUfTEI3b_eO6mrpEv9buL1JVRGa18",
    projectId: "blogwebsite-9dcda",
    messagingSenderId: "627959007344",
    appId: "1:627959007344:web:2f7f12c06988bc22c74cb5",
  ));
  await Supabase.initialize(
    url: 'https://ufmkmficeoyclnwxuudi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVmbWttZmljZW95Y2xud3h1dWRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQwNzE3MjgsImV4cCI6MjA2OTY0NzcyOH0.I0e_yTNRA6Cn2_AR1we5Tp_bH2SNIYFTiT9DOOlEOJE',
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BlogFetchBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Maintree(),
    );
  }
}
