import 'package:romance_quotes/domain/model/quotes.dart';

class QuotesData {
  static List<Quotes> quotesList() {
    return List.generate(
      10,
      (index) => Quotes(
        id: 'quote_$index',
        categoryID: 'category_$index',
        content: 'This is a sample quote #$index',
        author: 'Author $index',
      ),
    );
  }
}
