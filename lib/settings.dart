import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// settings page NEW made variables, might be available in constants already.
const kBorderColor = Color(0xFFD9DCE3);
const kDialogButtonTitleColor = Color(0xff88889D);
const kOrangeAccentColor = Color(0xFFFF7648);

/// [kMultiplyFactor] is used to convert design hard values(margin, padding, size, borders, etc)
/// into screen specific values.
double kMultiplyFactor = 1;
TextStyle kSettingsTileTextStyle = GoogleFonts.poppins(
  fontSize: 13 * kMultiplyFactor,
  color: kHomeHeaderTextColour,
  fontWeight: FontWeight.w400,
);

/// [routeURLs] is the used for mapping 
Map<String, String> routeURLs = {
  // 'Notifications':  " No url for Notifications",
  // 'Feedback' : "No url for FeedbackUI() screen",
  'Terms & Conditions':
      "https://spicelearn.inroad.in/local/staticpage/view.php?page=terms-and-conditions",
  'Privacy Policy':
      "https://spicelearn.inroad.in/local/staticpage/view.php?page=privacy-policy",
  'Help': "https://spicelearn.inroad.in/local/staticpage/view.php?page=help",
};
//

// already in the constants file; copied from global constants file
const kBackgroundColour = Color(0xFFF2F4FB);
const kHomeHeaderTextColour = Color(0xFF212523);

TextStyle kMyCoursesHeaderStyle = GoogleFonts.poppins(
  fontSize: 18 * kMultiplyFactor,
  color: kHomeHeaderTextColour,
  fontWeight: FontWeight.w600,
);
//

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kMultiplyFactor = MediaQuery.of(context).size.width / 360;
    print(kMultiplyFactor);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColour,
        appBar: CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              color: Colors.white,
              child: Column(
                children: [
                  SettingsTile(
                    title: 'Notifications',
                    showToggleSwitch: true,
                    switchToggleAction: () {
                      print('Extra Toggle Action Ran!');
                    },
                  ),
                  SettingsTile(
                    title: 'Feedback',
                  ),
                  SettingsTile(
                    title: 'Terms & Conditions',
                  ),
                  SettingsTile(
                    title: 'Privacy Policy',
                  ),
                  SettingsTile(
                    title: 'Help',
                  ),
                ],
              ),
            ),
            Spacer(),
            LogoutButton(
              onPressed: () => onLogOutPressed(
                context: context,
                logOutConfirmationAction: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ).show(),
            ),
          ],
        ),
      ),
    );
  }
}

//top appbar
class CustomAppBar extends StatelessWidget implements PreferredSize {
  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(104 * kMultiplyFactor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.30),
      padding: EdgeInsets.only(
          left: 24 * kMultiplyFactor, top: 24 * kMultiplyFactor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Icon(
              Icons.arrow_back_ios,
              color: kHomeHeaderTextColour,
              size: 24,
            ),
          ),
          SizedBox(height: 12 * kMultiplyFactor),
          Text('Settings', style: kMyCoursesHeaderStyle),
        ],
      ),
    );
  }
}

//settings options tile component
class SettingsTile extends StatefulWidget {
  final String title;
  final bool showToggleSwitch;
  final Function? switchToggleAction;

  const SettingsTile({
    required this.title,
    this.showToggleSwitch = false,
    this.switchToggleAction,
  });

  @override
  _SettingsTileState createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  bool switchValue = false;

  /// attach persistance [switchValue] or it will reset on every page transition.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.showToggleSwitch
          ? () {} //no action on tapping tile body if Switch avaliable
          : () {
              print('${widget.title} pressed!');
              onSettingTilePressed(
                  context, routeURLs[widget.title] ?? 'Default');
            },
      child: Container(
        height: 64 * kMultiplyFactor,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5 * kMultiplyFactor,
              color: kBorderColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: kSettingsTileTextStyle,
            ),
            widget.showToggleSwitch
                ? CupertinoSwitch(
                    value: switchValue,
                    onChanged: (bool value) {
                      print('toggleButton pressed!');
                      setState(() {
                        switchValue = value;
                      });
                      // add switch functionality here to onPressed property;
                      widget.switchToggleAction!();
                    },
                    // onChanged: (_) {},
                    activeColor: kOrangeAccentColor,
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    color: kBorderColor,
                    size: 18 * kMultiplyFactor,
                  ),
          ],
        ),
      ),
    );
  }
}

//bottom logout button
class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogoutButton({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 64 * kMultiplyFactor,
      color: Colors.white,
      splashColor: kOrangeAccentColor.withOpacity(0.1),
      minWidth: double.infinity,
      child: Center(
        child: Text(
          'Log Out',
          style: GoogleFonts.poppins(
            color: kOrangeAccentColor,
            fontSize: 13 * kMultiplyFactor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// on pressing logout button; show alert box
// using rflutter_alert package for custom alert box
Alert onLogOutPressed(
    {required BuildContext context,
    required VoidCallback logOutConfirmationAction}) {
  // Dialog Button Widget abstraction for repeated use
  // used inside Alert widget
  DialogButton templateDialogButton({
    required String title,
    Color color = Colors.white,
    Color titleColor = Colors.white,
    VoidCallback? onPressed,
  }) =>
      DialogButton(
        height: 48 * kMultiplyFactor,
        width: 184 * kMultiplyFactor,
        radius: BorderRadius.circular(12),
        color: color,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: titleColor,
            fontSize: 16 * kMultiplyFactor,
          ),
        ),
        onPressed: onPressed,
      );

  return Alert(
    context: context,
    style: AlertStyle(
      alertPadding: EdgeInsets.all(60),
      overlayColor: Colors.black38,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      alertBorder: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(48),
        side: BorderSide(
          width: 1 * kMultiplyFactor,
          color: Color(0xffECEDF1),
        ),
      ),
      buttonsDirection: ButtonsDirection.column,
      titleStyle: GoogleFonts.poppins(
        color: kHomeHeaderTextColour,
        fontSize: 20 * kMultiplyFactor,
        fontWeight: FontWeight.w400,
        letterSpacing: -1 * kMultiplyFactor,
      ),
    ),
    // type: AlertType.warning,
    title: "Are you sure you want \nto Log out?",
    // desc: "Are you sure you want \nto Log Out?",
    buttons: [
      templateDialogButton(
        title: "Log Out",
        color: kOrangeAccentColor,
        onPressed: logOutConfirmationAction,
      ),
      templateDialogButton(
          title: "Cancel",
          titleColor: kDialogButtonTitleColor,
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );
}

/// Use [onSettingTilePressed] method for opening the webView for respective tile
/// Update return type accordingly.
/// routeURL can be retrieved by your already created [getURL] method.
void onSettingTilePressed(BuildContext context, String routeURL) {
  Navigator.of(context).push(
    MaterialPageRoute(
      // builder: (BuildContext context) => WebviewforSettings(getURL(3), 1),
      builder: (BuildContext context) => routeURL == 'Default'
          //Replace this Scaffold with Feedback Page
          ? Scaffold(
              body: Center(child: Text('Special route for Feedback')),
            )
          : Scaffold(
              body: Center(child: Text(routeURL)),
            ),
    ),
  );
}
