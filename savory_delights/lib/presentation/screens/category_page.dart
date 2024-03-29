import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savory_delights/business_logic/cubit/category_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text("Categories")),
            backgroundColor: Colors.blueAccent),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoryLoaded) {
                    return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                            crossAxisSpacing: 10, // Spacing between columns
                            mainAxisSpacing: 10, // Spacing between rows
                          ),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                                category: state.categories[index]);
                          }),
                    );
                  } else if (state is CategoryLoadFailed) {
                    return const Center(child: Text("Failed to Load Categories"));
                  }
                  return Container();
                },
              ),
            ]));
  }
}
