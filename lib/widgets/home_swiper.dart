import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/config.dart';

class HomeSwiper extends StatelessWidget {
  final swiperConfig;

  HomeSwiper({this.swiperConfig});

  @override
  Widget build(BuildContext context) {
    if (swiperConfig == null) {
      return null;
    }

    final images = swiperConfig.map((slide) => slide['image']);
    final titles = swiperConfig.map((slide) => slide['title']);

    return Container(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${config.getMediaUrl()}${images.elementAt(index)}',
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    titles.elementAt(index),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: images.length,
        pagination: SwiperPagination(),
      ),
    );
    ;
  }
}
