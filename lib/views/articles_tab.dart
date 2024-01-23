import 'package:flutter/material.dart';
import 'package:lojong/models/article_summary.dart';
import 'package:lojong/views/article_page.dart';
import 'package:lojong/views/paginated_list_view.dart';
import 'package:lojong/widgets/list_item.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView<ArticleSummaryModel>(
      showSeparator: true,
      itemBuilder: (item) {
        return ListItem(
          title: item.title,
          text: item.text,
          imageUrl: item.imageUrl,
          onSharePressed: () {},
          onItemPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticlePage(item.id),
              ),
            );
          },
        );
      },
    );
  }
}
