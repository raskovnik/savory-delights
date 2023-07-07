import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/recipe_card_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 16.0),
          child: Text("Featured",
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
                return ListView(scrollDirection: Axis.horizontal, children: [
                  RecipeCard(recipe: state.recipe),
                  RecipeCard(recipe: state.recipe),
                  RecipeCard(recipe: state.recipe)
                ]);
              }
              return Container();
            }),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 16.0),
            child: Text("Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          TextButton(onPressed: () {}, child: const Text("See All"))
        ])
      ])),
    );
  }
}
