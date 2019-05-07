import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;
  const HomePage({this.category : Category.all});
  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductRepository.loadProducts(category),);

//    return Scaffold(
//      appBar: AppBar(
//        brightness: Brightness.light,
//        leading: IconButton(
//          icon: Icon(
//            Icons.menu,
//            semanticLabel: 'menu',
//          ),
//          onPressed: (){
//            print('menu button');
//          },
//        ),
//        title: Text('SHRINE'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.search,
//              semanticLabel: 'search',
//            ),
//            onPressed: (){
//              print('search');
//            },
//          ),
//          IconButton(
//            icon: Icon(
//              Icons.tune,
//              semanticLabel: 'filter',
//            ),
//            onPressed: (){
//              print('filter');
//            },
//          ),
//        ],
//      ),
////      body: GridView.count(
////        crossAxisCount: 2,
////        padding: EdgeInsets.all(16),
////        childAspectRatio: 8.0/9.0,
////        children: _buildGridCards(context),
////      ),
//      body:AsymmetricView(products: ProductRepository.loadProducts(Category.all),),
//    );
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString()
    );

    return products.map((product){
      return Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18/11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();

  }
}