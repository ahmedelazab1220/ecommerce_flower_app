import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/search_body.dart';
import '../widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchCubit searchCubit = getIt<SearchCubit>();
    return BlocProvider(
      create: (context) => searchCubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SearchField(),
                SizedBox(height: 12),
                Expanded(child: SearchBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
