import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_ui/home.dart';
import 'package:tmdb_ui/main.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceHeight / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth / 40),
              child: Text(
                'Search',
                style: commonTextStyle(
                    fontSize: textSizeBig, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: deviceHeight / 100,
                  left: deviceWidth / 40,
                  right: deviceWidth / 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [boxShadow]),
              child: TextField(
                // onTap: () => showSearch(
                //     context: context,
                //     delegate:
                //         MySearchDelegate(hintText: "Search title, category etc")),
                readOnly: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon:
                        const Icon(CupertinoIcons.search, color: Colors.grey),
                    hintText: 'Search Here',
                    hintStyle: commonTextStyle(textColor: Colors.grey)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: deviceHeight / 100),
              child: Divider(
                color: Colors.grey.withOpacity(.1),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth / 40),
                          child: Text(
                            'For you',
                            style: commonTextStyle(
                                fontSize: textSizeMediumBig,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : const MovieCard(
                          image:
                              'https://th.bing.com/th/id/OIP.xg6XZQvrc-1pZBoEh5sgagHaKl?rs=1&pid=ImgDetMain',
                          releaseDate: 'Nov 23, 2012',
                          title: 'Harry potter and the snack',
                          overview:
                              'Harry potter and the snack Harry potter and tk',
                          rating: 0.0,
                          isFavorite: false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
