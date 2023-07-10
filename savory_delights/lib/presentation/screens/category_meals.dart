import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/categorymeals_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';

class MealsByCategory extends StatelessWidget {
  final String category;
  const MealsByCategory({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(category)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          BlocProvider(
              create: (context) => CategorymealsCubit(category: category),
              child: BlocBuilder<CategorymealsCubit, CategorymealsState>(
                  builder: (context, state) {
                if (state is CategorymealsLoaded) {
                  return Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns in the grid
                          crossAxisSpacing: 10, // Spacing between columns
                          mainAxisSpacing: 10, // Spacing between rows
                        ),
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(recipe: state.data[index]);
                        }),
                  );
                } else if (state is CategorymealsLoading) {
                  return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Center(child: Text("Hold On Chef!"))
                      ]);
                } else if (state is CategorymealsLoadFailed) {
                  const Center(child: Text("Failed to load!"));
                }
                return Container();
              }))
        ]));
  }
}
