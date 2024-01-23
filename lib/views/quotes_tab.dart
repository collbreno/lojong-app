import 'package:flutter/material.dart';
import 'package:lojong/models/quote.dart';
import 'package:lojong/views/paginated_list_view.dart';
import 'package:lojong/widgets/quote_card.dart';

class QuotesTab extends StatelessWidget {
  const QuotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView<QuoteModel>(
      itemBuilder: (item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: QuoteCard(item),
        );
      },
    );
  }
}
