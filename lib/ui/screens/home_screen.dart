import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/models/scroll_home_screen.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/components/actions_app_bar.dart';
import 'package:personal_website/ui/components/bottom_nav_bar.dart';
import 'package:personal_website/ui/screens/base_screen.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatelessWidget {
  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/"));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScrollHomeScreen>(
      create: (context) => ScrollHomeScreen(metricsPixel: 0.0),
      child: HomeScreenProvided(),
    );
  }
}

class HomeScreenProvided extends StatefulWidget {
  @override
  _HomeScreenProvidedState createState() => _HomeScreenProvidedState();
}

class _HomeScreenProvidedState extends BaseScreenState<HomeScreenProvided> {
  ScrollController scrollController;
  GlobalKey keyResume = GlobalKey();
  GlobalKey keyProjects = GlobalKey();
  GlobalKey keyTimeMoney = GlobalKey();
  GlobalKey keyContactMe = GlobalKey();

  _launchURL() async {
    const url = 'https://www.linkedin.com/in/dimitri-leurs-666733130/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  void scrollNavItem(int index) {
    if (index == 0) {
      scrollController.position.ensureVisible(
        keyResume.currentContext.findRenderObject(),
        alignment:
            0, // How far into view the item should be scrolled (between 0 and 1).
        duration: const Duration(milliseconds: 600),
      );
    } else if (index == 1) {
      scrollController.position.ensureVisible(
        keyProjects.currentContext.findRenderObject(),
        alignment:
            0, // How far into view the item should be scrolled (between 0 and 1).
        duration: const Duration(milliseconds: 600),
      );
    } else if (index == 2) {
      scrollController.position.ensureVisible(
        keyTimeMoney.currentContext.findRenderObject(),
        alignment:
            0, // How far into view the item should be scrolled (between 0 and 1).
        duration: const Duration(milliseconds: 600),
      );
    } else if (index == 3) {
      scrollController.position.ensureVisible(
        keyContactMe.currentContext.findRenderObject(),
        alignment:
            0, // How far into view the item should be scrolled (between 0 and 1).
        duration: const Duration(milliseconds: 600),
      );
    }
  }

  @override
  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomNavBar(scrollNavItem: scrollNavItem);
  }

  @override
  List<Widget> buildActionsAppBar(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MyAppBar.buildActions(
      context: context,
      setLanguage: setLanguage,
      scrollNavItem: scrollNavItem,
      displayNavItems: (width > Const.mediumScreen),
    );
  }

  List<Widget> nameAndPicture(BuildContext context) {
    return [
      Center(
        child: Text(
          S.of(context).my_name,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      SizedBox(height: Const.largePadding),
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
          child: Padding(
            padding: const EdgeInsets.all(Const.smallPadding),
            child: Image.asset('assets/images/Dimitri_Leurs_Numberly.jpg'),
          ),
        ),
      ),
    ];
  }

  List<Widget> linkedinAndThank(BuildContext context) {
    return [
      Center(
        child: Text(
          S.of(context).my_job_title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: Const.mediumPadding),
      Center(
        child: Text(
          S.of(context).my_job_subtitle,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6.fontSize * 0.8),
        ),
      ),
      SizedBox(height: Const.mediumPadding),
      Center(
        child: Text(
          S.of(context).contact_me,
          //style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SizedBox(height: Const.mediumPadding),
      Center(
        child: GestureDetector(
            onTap: _launchURL,
            child: FittedBox(
              fit: BoxFit.contain,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/second_linkedin.jpg'),
                ), //Image.asset('assets/images/linkedin.jpg'),
              ),
            )),
      ),
      SizedBox(height: Const.largePadding),
      Center(
        child: ElevatedButton(
          onPressed: () {
            (Router.of(context).routerDelegate as MyRouterDelegate)
                .toDetailScreen();
          },
          child: Text(
            S.of(context).thank_you,
          ),
        ),
      ),
      SizedBox(height: Const.largePadding),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [],
      ),
    ];
  }

  Widget fakeChapter({
    @required BuildContext context,
    @required GlobalKey key,
    @required String title,
    @required NavPart navPart,
  }) {
    ScrollHomeScreen scrollProvider = Provider.of<ScrollHomeScreen>(context);
    return VisibilityDetector(
      key: key,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Const.largePadding,
              Const.mediumPadding, Const.largePadding, Const.mediumPadding),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        ...dummyText(),
        ...dummyText(),
        ...dummyText(),
      ]),
      onVisibilityChanged: (VisibilityInfo info) {
        debugPrint("onVisibilityChanged " +
            navPart.toString() +
            " - " +
            info.visibleFraction.toString());
        NavPart newFocus =
            scrollProvider.updateVisibleFraction(navPart, info.visibleFraction);
        print("newFocus :" + newFocus.toString());
      },
    );
  }

  List<Widget> dummyText() {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(Const.mediumPadding,
            Const.smallPadding, Const.mediumPadding, Const.smallPadding),
        child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(Const.mediumPadding,
              Const.smallPadding, Const.mediumPadding, Const.smallPadding),
          child: Text(
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"))
    ];
  }

  List<Widget> allChapters() {
    return [
      fakeChapter(
        context: context,
        title: S.of(context).resume_nav_item,
        key: keyResume,
        navPart: NavPart.resume,
      ),
      fakeChapter(
        context: context,
        title: S.of(context).projects_nav_item,
        key: keyProjects,
        navPart: NavPart.projects,
      ),
      fakeChapter(
          context: context,
          title: S.of(context).time_money_nav_item,
          key: keyTimeMoney,
          navPart: NavPart.timeMoney),
      fakeChapter(
          context: context,
          title: S.of(context).contact_me_nav_item,
          key: keyContactMe,
          navPart: NavPart.contactMe),
    ];
  }

  @override
  Widget buildLargeScreen(BuildContext context) {
    ScrollHomeScreen scrollHomeScreenProvided =
        Provider.of<ScrollHomeScreen>(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Const.largePadding),
              ...nameAndPicture(context),
              SizedBox(height: Const.largePadding),
              ...linkedinAndThank(context),
            ],
          ),
        ),
      ),
      SizedBox(height: Const.largePadding),
      Expanded(
          flex: 2,
          child: Center(
              child: SingleChildScrollView(
            //mainAxisAlignment: MainAxisAlignment.center,
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Const.largePadding),
                SizedBox(height: Const.smallPadding),
                ...allChapters(),
              ],
            ),
          ))),
    ]);
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    ScrollHomeScreen scrollHomeScreenProvided =
        Provider.of<ScrollHomeScreen>(context);
    print(scrollHomeScreenProvided);
    return SingleChildScrollView(
      //mainAxisAlignment: MainAxisAlignment.center,
      controller: scrollController,
      child: Column(children: [
        SizedBox(height: Const.largePadding),
        ...nameAndPicture(context),
        SizedBox(height: Const.largePadding),
        ...linkedinAndThank(context),
        //SizedBox(height: Const.largePadding),
        ...allChapters(),
      ]),
    );
  }
}
