import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:news_app_with_clean_architecture/features/get_news/presentation/widgets/news_container.dart';
import '../../data/models/enums/theme_state.dart';
import '../manager/get_news_cubit/get_news_cubit.dart';
import '../manager/switch_theme_cubit/switch_theme_cubit.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static const String id = 'NewsScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetNewsCubit, GetNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.appName),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Switch(
                      inactiveThumbColor: Theme.of(context).colorScheme.primary,
                      value: BlocProvider.of<SwitchThemeCubit>(context).state is LightTheme ? false : true,
                      onChanged: (value) {
                        BlocProvider.of<SwitchThemeCubit>(context).switchTheme(value ? ThemeState.dark : ThemeState.light);
                    },),
                  )
                ],
              ),
              body: state is GetNewsSuccess
                  ? _buildBodyContent(state)
                  : state is GetNewsFailure
                      ? Center(
                          child: Text(state.errMessage),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ));
        });
  }

  Widget _buildBodyContent(GetNewsSuccess state) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
      child: ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return state.news[index].title != '[Removed]'? NewsContainer(newsEntity: state.news[index]):Container();
                      },
                    ),
    );
  }
}
