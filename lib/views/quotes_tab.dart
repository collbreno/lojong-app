import 'package:flutter/material.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/views/paginated_list_view.dart';

class QuotesTab extends StatelessWidget {
  const QuotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView<QuoteModel>(
      itemBuilder: (item) {
        return ListTile(
          title: Text(item.text),
          subtitle: Text(item.author),
        );
      },
    );
  }
}
