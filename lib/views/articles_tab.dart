import 'package:flutter/material.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/views/paginated_list_view.dart';
import 'package:lojong/widgets/list_item.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView<ArticleSummaryModel>(
      itemBuilder: (item) {
        return ListItem(
          title: item.title,
          text: item.text,
          imageUrl: item.imageUrl,
          onSharePressed: () {},
          onItemPressed: () {},
        );
      },
    );
  }
}
