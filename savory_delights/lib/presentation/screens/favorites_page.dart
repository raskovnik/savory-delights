import 'package:flutter/material.dart';
import 'package:savory_delights/business_logic/cubit/favorites_cubit.dart';
import 'package:savory_delights/presentation/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text("Favorites")),
            backgroundColor: const Color.fromARGB(255, 148, 170, 208)),
        body: BlocProvider(
            create: (context) => FavoritesCubit(),
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesLoading) {
                  return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Center(child: Text("Hold on Chef!"))
                      ]);
                } else if (state is FavoritesLoaded) {
                  return state.favs.isNotEmpty
                      ?
                      // Expanded(
                      // child:
                      GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                            crossAxisSpacing: 10, // Spacing between columns
                            mainAxisSpacing: 10, // Spacing between rows
                          ),
                          itemCount: state.favs.length,
                          itemBuilder: (context, index) {
                            return RecipeCard(recipe: state.favs[index]);
                          })
                      // )
                      : const Center(child: Text("No Favorites yet"));
                }
                return Container();
              },
            )));
  }
}
