// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:spice_learn/constants/C.dart';
// import 'package:spice_learn/constants/constant.dart';
// import 'package:spice_learn/constants/rcConstant.dart';
// import 'package:spice_learn/database/databaseHelper.dart';
// import 'package:spice_learn/networking/WebviewforScorm.dart';
// import 'package:spice_learn/networking/WebviewforSettings.dart';
// import 'package:spice_learn/screens/Feedback.dart';
// import 'package:spice_learn/screens/login/login_page.dart';

// class SettingsUI extends StatefulWidget {
//   @override
//   _SettingsUIState createState() => _SettingsUIState();
// }

// bool _isMobileData = true;
// bool _isNotification = true;
// final prefs = SharedPreferences.getInstance();

// class _SettingsUIState extends State<SettingsUI> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build

//     return Container(
//         child: new Scaffold(
//       backgroundColor: kBackgroundColour,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: kHomeHeaderTextColour, //change your color here
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Container(
//         color: kBackgroundColour,
//         child: Container(
//           height: 395,
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.white,
//                 padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                 child: Text(
//                   'Settings',
//                   style: kMyCoursesHeaderStyle,
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 20,
//               ),
//               //Notifications
//               Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                 height: 50,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Notifications',
//                       style: kSettingsTextStyle,
//                     ),
//                     FlutterSwitch(
//                       width: 48.0,
//                       height: 24.0,
//                       valueFontSize: 12.0,
//                       toggleSize: 16.0,
//                       value: _isNotification,
//                       borderRadius: 30.0,
//                       padding: 3.0,
//                       activeColor: kBeginbbtnColor,
//                       inactiveColor: kToggleInactive,
//                       disabled: false,
//                       //showOnOff: true,
//                       onToggle: (val) {
//                         setState(() {
//                           _isNotification = val;
//                           if (_isNotification) {
//                             //prefs.setString(NOTIFICATION, "0");

//                             //_isNotification = false;
//                           } else {
//                             //_isNotification = true;
//                           }
//                           print(_isNotification);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                 child: Container(
//                   color: kInactiveTextFieldColour,
//                   height: 2,
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ),
//               //Feedback
//               GestureDetector(
//                 child: Container(
//                   color: Colors.white,
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Feedback',
//                         style: kSettingsTextStyle,
//                       ),
//                       // ToggleButtons(children: null, isSelected: null),
//                       SvgPicture.asset('images/setting_arrow.svg'),
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) => FeedbackUI()));
//                 },
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                 child: Container(
//                   color: kInactiveTextFieldColour,
//                   height: 2,
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ), //164
//               //T&C
//               GestureDetector(
//                 child: Container(
//                   color: Colors.white,
//                   height: 50,
//                   padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Terms & Condition',
//                         style: kSettingsTextStyle,
//                       ),
//                       SvgPicture.asset('images/setting_arrow.svg'),
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                               WebviewforSettings(getURL(3), 1)));
//                 },
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                 child: Container(
//                   color: kInactiveTextFieldColour,
//                   height: 2,
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ), //72

//               //Privacy
//               GestureDetector(
//                 child: Container(
//                   height: 50,
//                   color: Colors.white,
//                   padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Privacy Policy',
//                         style: kSettingsTextStyle,
//                       ),

//                       // ToggleButtons(children: null, isSelected: null),
//                       SvgPicture.asset('images/setting_arrow.svg'),
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                               WebviewforSettings(getURL(2), 1)));
//                 },
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                 child: Container(
//                   color: kInactiveTextFieldColour,
//                   height: 2,
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ), //72
//               //Help
//               GestureDetector(
//                 child: Container(
//                   color: Colors.white,
//                   height: 50,
//                   padding: EdgeInsets.fromLTRB(20, 00, 20, 0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Help',
//                         style: kSettingsTextStyle,
//                       ),

//                       // ToggleButtons(children: null, isSelected: null),
//                       SvgPicture.asset('images/setting_arrow.svg'),
//                     ],
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                               WebviewforSettings(getURL(1), 1)));
//                 },
//               ),
//               Container(
//                 color: Colors.white,
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//           color: Colors.white,
//           height: 60,
//           child: Container(
//             child: FlatButton(
//               minWidth: MediaQuery.of(context).size.width,
//               height: 60,
//               child: Text(
//                 'LOGOUT',
//                 style: kLogotbuttonTextStyle,
//               ),
//               color: Colors.white,
//               onPressed: () {
//                 // logout();
//                 _exitApp(context);
//               },
//             ),
//           )),
//     ));
//   }

//   Future<void> logout() async {
//     var db = new DatabaseHelper();
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//     await Future.delayed(Duration(seconds: 1));
//     await db.deleteUsers();
//     Navigator.of(context).pushAndRemoveUntil(
//       // the new route
//       MaterialPageRoute(
//         builder: (BuildContext context) => LoginUI(),
//       ),

//       // this function should return true when we're done removing routes
//       // but because we want to remove all other screens, we make it
//       // always return false
//       (Route route) => false,
//     );
//   }

//   Future<bool> _exitApp(BuildContext context) {
//     return showDialog(
//           builder: (context) => Container(
//             decoration: ShapeDecoration(
//                 shape: ContinuousRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(30),
//               ),
//             )),
//             child: AlertDialog(
//               backgroundColor: Colors.white,
//               title: Text('Are you sure you want to logout?',
//                   style: kLogoutTextStyle),
//               actions: <Widget>[
//                 FlatButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   child: Text('No', style: kLogoutTextStyle),
//                 ),
//                 FlatButton(
//                   onPressed: () {
//                     logout();
//                   },
//                   child: Text('Yes', style: kLogoutTextStyle),
//                 ),
//               ],
//             ),
//           ),
//           context: context,
//         ) ??
//         false;
//   }

//   gotoPage(String i) {
//     switch (i) {
//       case "1":
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => WebviewforScorm(
//                     "https://spicelearn.inroad.in/local/staticpage/view.php?page=terms-and-conditions",
//                     1)));
//         break;
//       case "2":
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => WebviewforScorm(
//                     "https://spicelearn.inroad.in/local/staticpage/view.php?page=privacy-policy",
//                     2)));
//         break;
//       case "3":
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => WebviewforScorm(
//                     "https://spicelearn.inroad.in/local/staticpage/view.php?page=help",
//                     2)));
//         break;
//     }
//   }

//   Future<String> getURL(int i) async {
//     final prefs = await SharedPreferences.getInstance();

//     switch (i) {
//       case 1:
//         String url = prefs.getString(HELP);
//         return url;
//         break;
//       case 2:
//         String url = prefs.getString(PRIVACYPOLICY);
//         return url;
//         break;
//       case 3:
//         String url = prefs.getString(TERMS);
//         return url;
//         break;

//         return "";
//     }
//   }
// }
