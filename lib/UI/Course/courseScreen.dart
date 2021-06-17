import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/UI/common/constants.dart';
import '/UI/common/bottomNavBar.dart';

import 'localConstants.dart';
import 'components/courseAppBar.dart';

class CourseScreen extends StatelessWidget {
  static const String route = 'course';
  final String courseTitle;
  final int modulesCount;
  final String courseCategoryName;

  const CourseScreen({
    this.courseTitle = 'Pre-Flight Briefing Checklist',
    this.modulesCount = 6,
    this.courseCategoryName = 'Safety & Emergency Procedures',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: gPrimaryWhiteBG,
      bottomNavigationBar: BottomNavBar(activeRoute: 'None'),
      appBar: courseAppBar(context, courseCategoryName),
      body: ListView(
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
            imageUrl: randomImageUrl(),
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
                  '20' + ' Nov'.toUpperCase(),
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
                    '30/100 XP',
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
              'Pre-Flight Briefing Checklist',
              style: lCourseTitleTextStyle,
            ),
          ),
          SizedBox(height: gBaseMultiplier / 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gBaseMultiplier / 2),
            child: Text(
              'To provide better customer experience in the business. Varying from light to severe causes and impact it has on the passenger.',
              style: gSubTitleTextStyle.copyWith(
                fontSize: 13 * gScaleFactor,
                height: 1.65 * gScaleFactor,
              ),
            ),
          ),
          SizedBox(height: lDefaultMargin),
          ModulesList(),
          SizedBox(height: gAppBarHeight + gDefaultMargin),
        ],
      ),
    );
  }
}

class ModulesList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: gDefaultMargin / 2),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => ModuleTile(
        index: index,
        moduleType: tempModuleTypeList[index % 4],
        description: faker.lorem.sentences(4).join(' '),
        date: '${index + 1}'.padLeft(2, '0') +
            ' ${faker.date.month()}'.substring(0, 4),
        // currentExpanded: expandedModuleTileIndex,
      ),
    );
  }
}

List tempModuleTypeList = [
  ModuleType.Doc,
  ModuleType.Video,
  ModuleType.Interactive,
  ModuleType.Web,
];
int expandedModuleTileIndex = 0;

class ModuleTile extends StatefulWidget {
  final int index;
  final ModuleType moduleType;
  final String date;
  final String description;
  final Orientation orientation;
  // final
  const ModuleTile({
    required this.index,
    required this.moduleType,
    required this.description,
    this.date = '03 Aug',
    this.orientation = Orientation.portrait,
  });

  @override
  _ModuleTileState createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  bool _isExpanded = false;
  bool _animationEnded = false;

  @override
  Widget build(BuildContext context) {
    print(expandedModuleTileIndex);
    return GestureDetector(
      onTap: () {
        print('animation started');
        setState(() {
          _isExpanded = !_isExpanded;
          expandedModuleTileIndex = widget.index;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: gDefaultMargin / 2),
        padding: EdgeInsets.symmetric(
          horizontal: gDefaultMargin,
          vertical: lDefaultMargin / 2,
        ),
        height: _isExpanded ? gDefaultMargin * 15 : gDefaultMargin * 4,
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
                    moduleTypeDict[widget.moduleType]!.last as IconData,
                    color: gThemeOrangeColor2,
                  ),
                ),
                SizedBox(width: lDefaultMargin / 2),
                Padding(
                  padding: EdgeInsets.only(top: gDefaultMargin / 2),
                  child: Text(
                    '${widget.index + 1}'.padLeft(2, '0') +
                        '. ' +
                        '${widget.moduleType}'.split('.')[1] +
                        ' Module',
                    style: lModuleTitleTextStyle,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: gDefaultMargin / 2),
                  child: Text(
                    widget.date,
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
                  SizedBox(height: gDefaultMargin / 2),
                  Padding(
                    padding: EdgeInsets.only(left: gDefaultMargin / 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: gDefaultMargin),
                          child: Text(
                            moduleTypeDict[widget.moduleType]!.first,
                            style: gSubHeadingTextStyle.copyWith(
                              fontSize: 11 * gScaleFactor,
                              color: gThemeOrangeColor2,
                            ),
                          ),
                        ),
                        Spacer(),
                        Chip(
                          label: Text('00/40'),
                          backgroundColor: lLightOrangeColor,
                          labelStyle: gSubHeadingTextStyle.copyWith(
                            fontSize: 12 * gScaleFactor,
                            color: gThemeOrangeColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: gDefaultMargin / 4),
                  Padding(
                    padding: EdgeInsets.only(left: gDefaultMargin / 4),
                    child: Text(
                      widget.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: lModuleDescriptionTextStyle,
                    ),
                  ),
                  SizedBox(height: gDefaultMargin / 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      elevation: 0,
                      color: gThemeOrangeColor2,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(gDefaultMargin)),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            body: Center(
                              child: Text(
                                'Module #${widget.index + 1} opened. \n Module type: ${widget.moduleType} \nOrientation: ${widget.orientation}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
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
                ],
              ),
          ],
        ),
      ),
    );
  }
}
