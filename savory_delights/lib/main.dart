import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/home_cubit.dart';
import 'package:savory_delights/business_logic/cubit/recipe_card_cubit.dart';
import 'package:savory_delights/business_logic/cubit/category_cubit.dart';
import 'package:savory_delights/presentation/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const HomePage(),
          "/categories": (context) => BlocProvider.value(
              value: BlocProvider.of<HomeCubit>(context),
              child: const CategoryPage()),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
