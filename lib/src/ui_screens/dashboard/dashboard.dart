import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc_dashboard/dashboard_bloc.dart';
import '../../bloc/bloc_main/main_bloc.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';
import '../../utils/sharedpreference_helper/sharepreference_helper.dart';

class DashBoard extends StatefulWidget {
  static const String routeName = "/DashBoard";

  final String link;
  final bool value;
  final String body;
  final String appointment_id;

  const DashBoard(
      {Key? key, required this.link, required this.value, required this.body, required this.appointment_id})
      : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var exitApp;
  int _currentIndex = 0;
  int i = 0;
  late PageController _pageController;
  bool open = false;
  //String name, email, urlLink, roomName, subject, appointment_id, video_url;

  MainBloc mainBloc = MainBloc(MainInitial());
  DashboardBloc dashboardBloc = DashboardBloc(DashboardInitial());
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /*FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();*/

  @override
  void initState() {
    super.initState();
    exitApp = 0;

  }

  displayMessage(BuildContext context, String message) async {
    if ("${message.substring(0, 5)}" == "Sorry") {
      Navigator.of(context).pop();
    }
    // Navigator.of(context).pop();
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext contextPopup) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 200,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  textHelper(
                    title: StringHelper.alert,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  "${message.substring(0, 5)}" == "Sorry"
                      ? Container()
                      : Container(
                    height: 1,
                    width: double.infinity,
                    color: ColorsHelper.blueColor(),
                    //primaryColor
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  "${message.substring(0, 5)}" == "Sorry"
                      ? Container(
                    child: Container(
                      height: 30.0,
                      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            //color: Colors.grey[500],
                            //offset: Offset(0.0, 1.5),
                            blurRadius: 1.5,
                          ),
                        ],
                        border: Border.all(
                            width: 2, color: ColorsHelper.blueColor()),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorsHelper.whiteColor(),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(30.0),
                            onTap: () {
                              // Navigator.maybePop(context);
                              //flutterLocalNotificationsPlugin.cancelAll();
                            },
                            child: Center(
                              child: Text("Cancel",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorsHelper.blueColor(),
                                  )),
                            )),
                      ),
                    ),
                  )
                      : Row(
                    children: <Widget>[
                      //Cancel
                      Expanded(
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey[500],
                                //offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ],
                            border: Border.all(
                                width: 2,
                                color: ColorsHelper.blueColor()),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: ColorsHelper.whiteColor(),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(30.0),
                                onTap: () {
                                  Navigator.maybePop(context);
                                  //flutterLocalNotificationsPlugin
                                      //.cancelAll();
                                },
                                child: Center(
                                  child: Text(StringHelper.reject,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsHelper.blueColor(),
                                      )),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      //Retry
                      Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: ColorsHelper.blueColor(),
                                boxShadow: [
                                  BoxShadow(
                                    //color: Colors.grey[500],
                                    blurRadius: 1.5,
                                  ),
                                ]),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              color: ColorsHelper.blueColor(),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(30.0),
                                  onTap: () async {
                                    Navigator.maybePop(context);
                                    //flutterLocalNotificationsPlugin
                                        //.cancelAll();
                                    //joinCall();
                                  },
                                  child: Center(
                                    child: Text(StringHelper.accept,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsHelper.whiteColor(),
                                        )),
                                  )),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _pageController.dispose();
    dashboardBloc.close();
    super.dispose();
  }

  Future<bool> onWillPop() {
    /*Fluttertoast.showToast(
        msg: StringHelper.press_back_again_to_exit,
        backgroundColor: ColorsHelper.blueColor(),
        textColor: Colors.white);*/
    exitApp++;
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (exitApp >= 2) {
        exit(0);
      } else {
        exitApp = 0;
      }
    });
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //top bar color
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      //top bar icons
      systemNavigationBarColor: Colors.transparent,
      //bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
    ));

    /*try {
      if (widget.value) {
        print("Success");
        callDialog(context);
      }
    } catch (e) {
      print(e);
    }*/

    return WillPopScope(
      onWillPop: onWillPop,
      child: BlocProvider(
        create: (context) => dashboardBloc,
        child: Scaffold(
          key: _key,
          body: SizedBox.expand(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                //HomeTab
                /*HomeTab(),*/
                //DoctorDashboard(),
                //AppointmentsTab
                // const ScheduleScreen(),
                //const PatientList(),
                //PrescriptionTab
                // PrescriptionScreen(),
                //ProfileTab(),
                //MoreTab
                // MoreTab()
              ],
            ),
          ),
          bottomNavigationBar: bottomNavBar(index: _currentIndex),
          floatingActionButton: FloatingActionButton(
            /*child: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: ColorsHelper.greenColor(),
            ),*/
            backgroundColor: ColorsHelper.whiteColor(),
            onPressed: () {
              //launchWhatsApp();
            },
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar({int? index}) => Container(
    height: Platform.isIOS ? 80 : 60,
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ))),
    child: Row(
      children: <Widget>[
        //home
        bottomNavBarHelper(
            onTap: () {
              _pageController.jumpToPage(0);
              if (mounted) {
                setState(() {});
              }
            },
            title: StringHelper.home,
            image: index == 0 ? ImageAssets.home_blue : ImageAssets.home,
            //index: index,
            i: 0),
        //schedule
        bottomNavBarHelper(
            onTap: () {
              _pageController.jumpToPage(1);
              if (mounted) {
                setState(() {});
              }
            },
            //title: StringHelper.patient,
            image: index == 1
                ? ImageAssets.patients
                : ImageAssets.patient_gray,
            //index: index,
            i: 1),
        //profile
        bottomNavBarHelper(
            onTap: () {
              _pageController.jumpToPage(2);
              if (mounted) {
                setState(() {});
              }
            },
            title: StringHelper.profile,
            image:
            index == 2 ? ImageAssets.profile_blue : ImageAssets.profile,
            //index: index,
            i: 2),
        //more
        /* bottomNavBarHelper(
                onTap: () {
                  _pageController.jumpToPage(3);
                  if (mounted) {
                    setState(() {});
                  }
                },
                title: StringHelper.more,
                image: index == 3 ? ImageAssets.more_blue : ImageAssets.more,
                index: index,
                i: 3),*/
      ],
    ),
  );

  Widget bottomNavBarHelper(
      {Function? onTap, String? title, String? image, int? index, int? i}) =>
      Expanded(
        child: InkWell(
          //onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //assetImageHelper(image: image, height: 20),
              const SizedBox(
                height: 5,
              ),
              textHelper(
                  title: title!.toUpperCase(),
                  fontSize: 9.5,
                  fontWeight: FontWeight.w600,
                  textColor:
                  index == i ? ColorsHelper.blueColor() : Colors.grey)
            ],
          ),
        ),
      );
}