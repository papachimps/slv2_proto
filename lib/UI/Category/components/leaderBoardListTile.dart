import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/UI/common/constants.dart';
import '../localConstants.dart';

class LeaderBoardListTile extends StatelessWidget {
  final int userRanking;
  final bool isCurrentUser;
  final String userProfileUrl;
  final String userName;
  final String userBase;
  final int userScore;

  const LeaderBoardListTile({
    required this.userRanking,
    required this.userProfileUrl,
    required this.userScore,
    this.userName = 'Rahul Ramchandani',
    this.userBase = 'BOM',
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: lDefaultMargin / 2),
      height: lDefaultMargin * 4,
      padding: EdgeInsets.symmetric(horizontal: lDefaultMargin),
      decoration: ShapeDecoration(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(gDefaultMargin * 2),
        ),
        color: isCurrentUser ? gSpiceRed2 : gPrimaryWhiteBG,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: lDefaultMargin,
            child: Text(
              '$userRanking',
              textAlign: TextAlign.left,
              style: gFilterTitleTextStyle.copyWith(
                color: isCurrentUser ? Colors.white : gCourseCardTitleTextColor,
              ),
            ),
          ),
          CircleAvatar(
            radius: gDefaultMargin * 2,
            backgroundColor: Colors.white,
            child: CachedNetworkImage(
              cacheKey: userProfileUrl,
              width: double.infinity,
              height: double.infinity,
              imageUrl: userProfileUrl,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: gThemeOrangeColor,
                strokeWidth: 1,
              )),
              imageBuilder: (context, imageProvider) => DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: gDefaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  overflow: TextOverflow.fade,
                  style: gFilterTitleTextStyle.copyWith(
                    fontSize: 13 * gScaleFactor,
                    color: isCurrentUser
                        ? Colors.white
                        : gCourseCardTitleTextColor,
                  ),
                ),
                SizedBox(height: gDefaultMargin / 8),
                Text(
                  userBase.toUpperCase(),
                  style: gSubTitleTextStyle.copyWith(
                    fontSize: 11 * gScaleFactor,
                    letterSpacing: 1.05,
                    color: isCurrentUser
                        ? Colors.white
                        : gCourseCardTitleTextColor,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            userScore.toString(),
            textAlign: TextAlign.right,
            style: gCourseCountTextStyle.copyWith(
              color: isCurrentUser ? Colors.white : gCourseCardTitleTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
