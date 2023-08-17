import 'package:cannicheck/views/profile.dart';
import 'package:cannicheck/views/search_business.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../custom_drawer/drawer_user_controller.dart';
import '../custom_drawer/home_drawer.dart';
import '../models/user.dart';
import 'create_transaction.dart';
import 'home.dart';
import 'membership_plan.dart';

class NavigationHome extends StatefulWidget {
  final User? user;
  final Function toggle;
  const NavigationHome(this.user, this.toggle, {Key? key}) : super(key: key);

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    if(widget.user!.subscriptionActive == true) {
      screenView = HomePage(widget.user);
    } else{
      screenView = Membership(widget.user);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            user: widget.user,
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }
  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            if(widget.user!.subscriptionActive == true) {
              screenView = HomePage(widget.user);
            } else{
              screenView = Membership(widget.user);
            }
          });
          break;
        case DrawerIndex.Profile:
          setState(() {
            if(widget.user!.subscriptionActive == true) {
              screenView = ProfilePage(widget.user, widget.toggle);
            } else{
              screenView = Membership(widget.user);
            }
          });
          break;
        case DrawerIndex.Create:
          setState(() {
            if(widget.user!.subscriptionActive == true) {
              screenView = CreateTransaction(widget.user, widget.toggle);
            } else{
              screenView = Membership(widget.user);
            }
          });
          break;
        case DrawerIndex.Search:
          setState(() {
            if(widget.user!.subscriptionActive == true) {
              screenView = SearchBusiness();
            } else{
              screenView = Membership(widget.user);
            }
          });
          break;
        default:
          break;
      }
    }
  }
}
