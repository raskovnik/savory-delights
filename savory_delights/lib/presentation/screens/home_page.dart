import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/recipe_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Savory Delights")),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Text("Categories")),
              BlocBuilder<RecipeCubit, RecipeState>(
                  builder: (context, state) {
                    if (state is RecipeLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is RecipeLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            return CategoryWidget(category: state.categories[index]);
                          }
                        ),
                      );
                    }                
                    return Container();
                  },
                ),
            ]
        )
      );
  }
}
