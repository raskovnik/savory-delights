import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/recipe_cubit.dart';

class RecipePage extends StatelessWidget {
  final String id;
  const RecipePage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCubit(id: id),
      child: Scaffold(body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator()), Center(child: Text("Hold On Chef!"))]);
          } else if (state is RecipeLoaded) {
            return Center(child: Text(state.data.instructions,));
          } else if (state is RecipeLoadFailed) {
            return Center(child: Text(state.e));
          }
          return Container();
        },
      )),
    );
  }
}
