import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_app_api/src/configs/appColors.dart';
import 'package:movie_app_api/src/controllers/staticData.dart';
import 'package:movie_app_api/src/pages/MovieSearchPage.dart';
import 'package:movie_app_api/src/pages/movieDetailsPage.dart';
import 'package:movie_app_api/src/widgets/kText.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //sorry for copy paste I am done this offline because my laptop  is so hange.
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(
                text: 'Watch Now',
                fontSize: 28,
              ),
              IconButton(
                onPressed: () => Get.to(MovieSearchPage()),
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Container(
            height: 60,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: movieImageAndName.length,
              itemBuilder: (context, int index) {
                final item = movieImageAndName[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Container(
                    alignment: Alignment.center,
                    // width: 140,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: KText(text: '${item['category']}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: .66),
          itemCount: movieImageAndName.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          primary: false,
          itemBuilder: (context, index) {
            final item = movieImageAndName[index];
            return GestureDetector(
              onTap: () => Get.to(
                MovieDetailsPage(
                  item: item,
                  id: int.parse(
                    item['id'].toString(),
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.network('${item['image']}')),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(
                            text: '${item['title']}',
                            color: white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          KText(
                            text: '${item['year']}',
                            color: white,
                            fontSize: 13,
                          ),
                          SizedBox(height: 2),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            itemSize: 15,
                            // updateOnDrag: true,
                            tapOnlyMode: true,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(height: 2),
                          KText(
                            text: '${item['desciption']}',
                            maxLines: 3,
                            color: white.withOpacity(.70),
                            fontSize: 11,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        color: primaryColor2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.grey,
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.movie,
                size: 30,
                color: Colors.grey,
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
