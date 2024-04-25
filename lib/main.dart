import 'package:blog_clean_architecture/core/secrets/app_secrets.dart';
import 'package:blog_clean_architecture/core/theme/theme.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_clean_architecture/features/auth/data/respositories/auth_repository_impl.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecase/usecase.dart';
import 'package:blog_clean_architecture/features/auth/pressentation/bloc/auth_bloc.dart';
import 'package:blog_clean_architecture/features/auth/pressentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
    debug: true,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourcesImpl(supabase.client),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: SignUpPage(),
    );
  }
}
