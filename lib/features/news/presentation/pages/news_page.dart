import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_tdd/features/news/presentation/bloc/news_bloc/news_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final news = state.news;
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: state.status == LoadingStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(
                              news[i].title == '' ? 'Unknown' : news[i].author,
                            ),
                            leading: SizedBox(
                              width: 100,
                              child: Text(
                                news[i].author,
                                maxLines: 1,
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<NewsBloc>().add(NewsStarted());
            },
          ),
        );
      },
    );
  }
}
