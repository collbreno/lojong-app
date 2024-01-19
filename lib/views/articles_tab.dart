import 'package:flutter/material.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/views/paginated_list_view.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView<ArticleSummaryModel>(
      itemBuilder: (item) {
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.text),
        );
      },
    );
  }
}
