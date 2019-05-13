import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('network images'),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.network(
                'https://s2.ax1x.com/2019/05/07/EsNiy4.jpg',
                width: 200,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://s2.ax1x.com/2019/05/07/EsNEwR.jpg',
                width: 200,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CachedNetworkImage(
                placeholder: (context, url) => new CircularProgressIndicator(),
                imageUrl: 'https://s2.ax1x.com/2019/05/07/EsNeFx.jpg',
                width: 200,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
