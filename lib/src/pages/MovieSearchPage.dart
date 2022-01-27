import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_api/src/configs/appColors.dart';
import 'package:movie_app_api/src/controllers/staticData.dart';
import 'package:movie_app_api/src/pages/movieDetailsPage.dart';
import 'package:movie_app_api/src/widgets/kText.dart';

class MovieSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: KText(
          text: 'Finder',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'Find Movie',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.white54,
                ),
                fillColor: primaryColor,
                filled: true,
              ),
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
    );
  }
}
