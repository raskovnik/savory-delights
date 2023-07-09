import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/recipe_cubit.dart';

class RecipePage extends StatelessWidget {
  final String id;
  const RecipePage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => RecipeCubit(id: id),
        child: Scaffold(
          appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Ingredients"),
              Tab(text: "Instructions")
            ]
          ),
          ),
          body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoading) {
              return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(child: CircularProgressIndicator()), Center(child: Text("Hold On Chef!"))]);
            } else if (state is RecipeLoaded) {
              return TabBarView(
                children: [
                  ListView.builder(
                    itemCount: state.data.ingredients.length,
                    itemBuilder: (context, index) {
                      return Text("${state.data.ingredients[index]} - ${state.data.measures[index]}");
                    },
                  ),
                  SingleChildScrollView(child: Text(state.data.instructions))
                ]
              );
              // return Center(child: Text(state.data.instructions));
            } else if (state is RecipeLoadFailed) {
              return Center(child: Text(state.e, style: const TextStyle(wordSpacing: 2.0, height: 5.0)));
            }
            return Container();
          },
        )),
      ),
    );
  }
}
