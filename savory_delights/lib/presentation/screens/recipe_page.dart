import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/recipe_cubit.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;
  const RecipePage({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => RecipeCubit(id: recipe.id),
        child: Scaffold(
            appBar: AppBar(
              title: Text(recipe.title),
              // flexibleSpace: Stack(
              //   children: [
              //     Positioned.fill(
              //       child: Image.network(recipe.imageURL, fit: BoxFit.none)
              //     )
              //   ]
              // ),
              bottom: const TabBar(
                  tabs: [Tab(text: "Ingredients"), Tab(text: "Instructions")]),
            ),
            body: BlocBuilder<RecipeCubit, RecipeState>(
              builder: (context, state) {
                if (state is RecipeLoading) {
                  return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Center(child: Text("Hold On Chef!"))
                      ]);
                } else if (state is RecipeLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(children: [
                      ListView.builder(
                        itemCount: state.data.ingredients.length,
                        itemBuilder: (context, index) {
                          return state.data.ingredients[index].isNotEmpty &&
                                  state.data.measures[index].isNotEmpty
                              ? Text(
                                  "${state.data.ingredients[index]} - ${state.data.measures[index]}",
                                  style: const TextStyle(height: 2.5))
                              : const Text("");
                        },
                      ),
                      SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.data.instructions,
                                style: const TextStyle(height: 2.5)),
                          ))
                    ]),
                  );
                  // return Center(child: Text(state.data.instructions));
                } else if (state is RecipeLoadFailed) {
                  return Center(
                      child: Text(state.e,
                          style:
                              const TextStyle(wordSpacing: 2.0, height: 5.0)));
                }
                return Container();
              },
            )),
      ),
    );
  }
}
