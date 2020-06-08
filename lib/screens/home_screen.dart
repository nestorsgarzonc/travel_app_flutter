import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_flutter/global/app_colors.dart';
import 'package:travel_app_flutter/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///Container welcome text
            HeaderMain(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Top',
                    style: GoogleFonts.poppins(
                      color: AppColors.lightGreenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'For you',
                    style: GoogleFonts.poppins(
                      color: AppColors.lightGreenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Hidden Gems',
                    style: GoogleFonts.poppins(
                      color: AppColors.veryLightTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.veryLightTextColor,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),

            ///Vertical spacing
            SizedBox(height: 16),
            Expanded(
              child: Container(
                child: LayoutGrid(
                  columnGap: 12,
                  rowGap: 12,
                  templateColumnSizes: [
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                  ],
                  templateRowSizes: [
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(0.6),
                    FlexibleTrackSize(1),
                  ],
                  children: <Widget>[
                    getPlaceWidget('assets/5.svg', context).withGridPlacement(
                      rowStart: 0,
                      columnStart: 0,
                      rowSpan: 2,
                    ),
                    getPlaceWidget('assets/3.svg', context).withGridPlacement(
                      rowStart: 2,
                      columnStart: 0,
                      rowSpan: 1,
                    ),
                    getPlaceWidget('assets/2.svg', context).withGridPlacement(
                      rowStart: 0,
                      columnStart: 1,
                      rowSpan: 1,
                    ),
                    getPlaceWidget('assets/4.svg', context).withGridPlacement(
                      rowStart: 1,
                      columnStart: 1,
                      rowSpan: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPlaceWidget(imagePatch, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(imagePatch),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.lightRedColor,
        ),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: imagePatch,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SvgPicture.asset(
                  imagePatch,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pakistan',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Chip(
                  backgroundColor: Colors.white,
                  label: Row(
                    children: <Widget>[
                      Icon(Icons.star, color: AppColors.lightGreenColor, size: 15),
                      SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.veryLightTextColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HeaderMain extends StatelessWidget {
  const HeaderMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Hi, Sebastian',
                  style: TextStyle(
                    color: AppColors.veryLightTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Where\nare you going\n on vacations?',
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.darkTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ),

          ///Profile picture
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: Image.asset('assets/dp.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
