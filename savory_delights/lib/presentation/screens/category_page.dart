import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/recipe_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Categories")), backgroundColor: Colors.blueAccent),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<RecipeCubit, RecipeState>(
                  builder: (context, state) {
                    if (state is RecipeLoading) {
                      return const Center(child: CircularProgressIndicator());
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
