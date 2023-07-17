import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/home_cubit.dart';
import 'package:savory_delights/business_logic/cubit/recipe_card_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Savory Delights")),
            backgroundColor: const Color.fromARGB(255, 148, 170, 208)
            ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text("Random Picks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.25,
          child: BlocProvider(
            create: (context) => RecipeCardCubit(),
            child: BlocBuilder<RecipeCardCubit, RecipeCardState>(
                builder: (context, state) {
              if (state is RecipeCardLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RecipeCardLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recipe.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: state.recipe[index]);
                  }
                ); 
                }
              return Container();
            }),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 10, // Spacing between columns
                      mainAxisSpacing: 10, // Spacing between rows
                    ),
                    itemCount: state.meals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RecipeCard(recipe: state.meals[index]);
                    },
                  ),
                );
              } else if (state is HomeLoadFailed) {
                return const Center(child: Text("Failed to load"));
              }
              return Container();
            },
          ),
        )
      ])),
    );
  }
}
