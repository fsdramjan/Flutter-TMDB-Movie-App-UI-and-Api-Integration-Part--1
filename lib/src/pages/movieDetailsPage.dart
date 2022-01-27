import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/src/configs/appColors.dart';
import 'package:movie_app_api/src/controllers/staticData.dart';
import 'package:movie_app_api/src/widgets/kText.dart';

class MovieDetailsPage extends StatelessWidget {
  final Map<String, Object> item;
  final int id;
  MovieDetailsPage({required this.item, required this.id});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.defaultDialog(
                      title: '${item['title']}',
                      content: Image.network(
                        '${item['image']}',
                        fit: BoxFit.cover,
                        height: 500,
                        width: Get.width,
                      ),
                    ),
                    child: Container(
                      height: 200,
                      width: Get.width,
                      color: primaryColor2,
                      child: Image.network(
                        '${item['image']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: KText(
                      text: 'OverView',
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: '${item['title']}',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        SizedBox(width: 10),
                        KText(
                          text: '${item['year']}',
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 20,
                      // updateOnDrag: true,
                      tapOnlyMode: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 5),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: movieImageAndName.length,
                      padding: EdgeInsets.only(left: 12),
                      itemBuilder: (context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            // width: 140,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: KText(
                                  text:
                                      '${movieImageAndName[index]['category']}'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColor2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: KText(
                              text: 'Story Line',
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        KText(
                          text: '${item['desciption']}',
                          fontSize: 14,
                          maxLines: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
