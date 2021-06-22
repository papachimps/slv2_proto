// import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '/models/course.dart';
import '/models/module.dart';

import '/views/common/constants.dart';
import '/views/common/bottomNavBar.dart';
import '/views/common/players/videoPlayer.dart';
import '/views/common/players/webViewer.dart';
import '/views/common/players/pdfPlayer.dart';

import 'localConstants.dart';
import 'components/courseAppBar.dart';

class CourseScreen extends StatelessWidget {
  static const String route = '/course';
  // final String courseTitle;
  // final int modulesCount;
  // final String courseCategoryName;

  // const CourseScreen({
  //   this.courseTitle = 'Pre-Flight Briefing Checklist',
  //   this.modulesCount = 6,
  //   this.courseCategoryName = 'Safety & Emergency Procedures',
  // });

  @override
  Widget build(BuildContext context) {
    final Course course = Get.arguments;
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      bottomNavigationBar: BottomNavBar(activeRoute: 'None'),
      appBar: courseAppBar(context, course.categoryId),
      body: ListView(
        physics: BouncingScrollPhysics(),
        // shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: gDefaultMargin,
        ),
        children: [
          SizedBox(height: lAppBarHeight + lDefaultMargin * 2),
          CachedNetworkImage(
            // cacheKey: userProfileUrl,
            // width: double.infinity,
            height: 245 * gScaleFactor,
            imageUrl: course.imgUrl,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: gThemeOrangeColor,
              strokeWidth: 1,
            )),
            imageBuilder: (context, imageProvider) => DecoratedBox(
              decoration: ShapeDecoration(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(lDefaultMargin * 2)),
                // color: gSpiceRed,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            ),
          ),
          SizedBox(height: lDefaultMargin),
          Container(
            height: lDefaultMargin,
            padding: EdgeInsets.only(left: gDefaultMargin / 4),
            // width: 328 * gScaleFactor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  course.formattedDate.toUpperCase(),
                  style: gSubHeadingTextStyle.copyWith(
                      fontSize: 11 * gScaleFactor),
                ),
                Container(
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: gDefaultMargin / 4,
                    horizontal: gDefaultMargin / 2,
                  ),
                  child: Text(
                    '${course.userScore.toInt()}/${course.totalScore.toInt()} XP',
                    style: gFilterTitleTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: gThemeOrangeColor,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(gDefaultMargin)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: lDefaultMargin),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gBaseMultiplier / 2),
            child: Text(
              course.title,
              style: lCourseTitleTextStyle,
            ),
          ),
          SizedBox(height: gBaseMultiplier / 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gBaseMultiplier / 2),
            child: Text(
              course.description!,
              style: gSubTitleTextStyle.copyWith(
                fontSize: 13 * gScaleFactor,
                height: 1.65 * gScaleFactor,
              ),
            ),
          ),
          SizedBox(height: lDefaultMargin),
          ModulesList(course.modules),
          SizedBox(height: gAppBarHeight + gDefaultMargin),
        ],
      ),
    );
  }
}

class ModulesList extends StatelessWidget {
  final List<Module> modules;

  const ModulesList(this.modules);

  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: gDefaultMargin / 2),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: modules.length,
      itemBuilder: (context, index) => ModuleTile(index, modules[index]),
    );
  }
}

int expandedModuleTileIndex = 0;

class ModuleTile extends StatefulWidget {
  final Module module;
  final int index;

  const ModuleTile(this.index, this.module);

  @override
  _ModuleTileState createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  bool _isExpanded = false;
  bool _animationEnded = false;
  final GlobalKey expansionTileKey = GlobalKey();

  void _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      // Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scrollable.ensureVisible(
        keyContext,
        alignment: 0.75,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    Module module = widget.module;
    return GestureDetector(
      onTap: () {
        print('animation started');
        setState(() {
          _isExpanded = !_isExpanded;
          expandedModuleTileIndex = widget.index;
        });
      },
      child: AnimatedContainer(
        key: expansionTileKey,
        margin: EdgeInsets.symmetric(vertical: gDefaultMargin / 2),
        padding: EdgeInsets.symmetric(
          horizontal: gDefaultMargin,
          vertical: lDefaultMargin / 2,
        ),
        height: _isExpanded ? gDefaultMargin * 16 : gDefaultMargin * 4,
        decoration: _isExpanded
            ? ShapeDecoration(
                color: Colors.white,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(lDefaultMargin * 2.5),
                  side: BorderSide(
                    width: 0.2,
                    color: Color(0xffF1E5E5),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xff111111).withOpacity(0.02),
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                  ),
                  BoxShadow(
                    color: Color(0xff111111).withOpacity(0.10),
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                  )
                ],
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(gDefaultMargin * 2),
              ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        onEnd: () {
          setState(() {
            _animationEnded = !_animationEnded;
            if (expandedModuleTileIndex != widget.index) {
              _isExpanded = false;
            }
          });
          _scrollToSelectedContent(expansionTileKey: expansionTileKey);
          print('animation ended');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: gDefaultTextMargin,
                  backgroundColor: lLightOrangeColor,
                  child: Icon(
                    moduleTypeDict[module.moduleType]!.last as IconData,
                    color: gThemeOrangeColor2,
                  ),
                ),
                SizedBox(width: lDefaultMargin / 2),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: gDefaultMargin / 2, right: gDefaultMargin / 2),
                    child: Text(
                      '${widget.index + 1}'.padLeft(2, '0') +
                          '. ' +
                          module.title,
                      maxLines: _isExpanded ? 2 : 1,
                      textAlign: TextAlign.left,
                      overflow: _isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      // softWrap: _isExpanded ? true : false,
                      style: lModuleTitleTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: gDefaultMargin / 2),
                  child: Text(
                    module.formattedDate,
                    style: lModuleTitleTextStyle.copyWith(
                        color: gSubTitleTextColor),
                  ),
                ),
                SizedBox(width: gDefaultMargin / 2),
                Padding(
                  padding: EdgeInsets.only(top: gDefaultTextMargin / 2),
                  child: Icon(
                    _isExpanded
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    size: gDefaultMargin,
                    color:
                        _isExpanded ? gThemeOrangeColor2 : gSubTitleTextColor,
                  ),
                ),
              ],
            ),
            if (_animationEnded == true && _isExpanded == true)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: gDefaultMargin / 4),
                  Padding(
                    padding: EdgeInsets.only(left: gDefaultMargin / 4, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: gDefaultMargin),
                          child: Text(
                            moduleTypeDict[module.moduleType]!.first,
                            style: gSubHeadingTextStyle.copyWith(
                              fontSize: 11 * gScaleFactor,
                              color: gThemeOrangeColor2,
                            ),
                          ),
                        ),
                        Chip(
                          label: Text(
                              '${module.userScore.toInt()}/${module.maxScorable.toInt()}'),
                          backgroundColor: lLightOrangeColor,
                          labelStyle: gSubHeadingTextStyle.copyWith(
                            fontSize: 12 * gScaleFactor,
                            color: gThemeOrangeColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: gDefaultMargin / 4),
                  Container(
                    // color: gSpiceRed,
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: gDefaultMargin * 6,
                      minHeight: gDefaultMargin * 5,
                    ),
                    padding: EdgeInsets.only(left: gDefaultMargin / 4),
                    child: Text(
                      module.description!,
                      // module.description! +
                      //     'this is an auxilliary text I have added to check overflows and sizing bugs. what happens when I add even more of these texts.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: lModuleDescriptionTextStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      elevation: 0,
                      color: gThemeOrangeColor2,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(gDefaultMargin)),
                      onPressed: () => onModuleBeginPressed(
                        module.id,
                        module.moduleType,
                        module.orientation,
                        module.moduleUrl,
                      ),
                      child: Text(
                        'Begin',
                        style: gFilterTitleTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: gDefaultMargin / 2),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

void onModuleBeginPressed(
  String moduleId,
  ModuleType moduleType,
  Orientation orientation,
  String moduleUrl,
) {
  String _moduleDefinedRoute() {
    switch (moduleType) {
      case ModuleType.Video:
        return VideoPlayer.route;

      case ModuleType.Doc:
        return PdfPlayer.route;

      case ModuleType.Interactive:
        return WebViewer.route;

      default: //ModuleType.Web
        return WebViewer.route;
    }
  }

  print('working $orientation, $moduleId, $moduleType');

  // Navigator.of(context).pushNamed(_moduleDefinedRoute(), arguments: {
  //   'moduleId': moduleId,
  //   'orientation': orientation,
  // });

  Get.toNamed(_moduleDefinedRoute(), arguments: {
    'moduleId': moduleId,
    'orientation': orientation,
    'moduleUrl': moduleUrl,
  });
}
