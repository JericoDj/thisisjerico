import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../navigation_bar.dart';
import '../sections/about_section.dart';
import '../sections/contacts_section.dart';
import '../sections/home_section.dart';
import '../sections/projects_section.dart';
import '../sections/services_section.dart';
import '../colors/colors.dart';
import 'dart:html' as html;  // Add this import

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  String currentSection = 'home';

  final Map<String, GlobalKey> sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'services': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final uri = Uri.base;
      if (uri.fragment.isNotEmpty) {
        _scrollToSection(uri.fragment);
      }
    });
  }

  void _onScroll() {
    final screenHeight = MediaQuery.of(context).size.height;
    sectionKeys.forEach((section, key) {
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero).dy;
        if (position <= screenHeight / 2 && position + renderBox.size.height > 0) {
          setState(() {
            currentSection = section;
            print("Current section: $currentSection"); // Debug output
          });
        }
      }
    });
  }

  void _scrollToSection(String section) {
    final context = sectionKeys[section]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        // Adding a delay to ensure the scroll has completed
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            currentSection = section; // Update the current section after scrolling
          });
        });
      });
    }
  }

  // This method simulates refreshing the data/content
  Future<void> _onRefresh() async {
    setState(() {
      _isRefreshing = true;
    });

    // Simulate some data refresh (e.g., API call or UI update)
    await Future.delayed(Duration(seconds: 2));  // Simulate some network call

    setState(() {
      _isRefreshing = false;  // After refreshing, set _isRefreshing to false
    });

    // Trigger a full page reload in the browser
    html.window.location.reload();

    print("Refreshed!");
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobileView = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: MyColors.homepageBackground,
      appBar: NavigationBarWidget(
        onNavItemClicked: _scrollToSection,
        currentSection: currentSection,
      ),
      drawer: isMobileView
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.navigationBarBackground,
              ),
              child: Text(
                'Jerico De Jesus',
                style: TextStyle(
                  fontFamily: 'Caligraphy',
                  color: MyColors.accentBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontFamily: 'PTSerif-Bold',
                  fontSize: 20,
                  color: currentSection == 'about'
                      ? MyColors.navigationBarButtonBackground
                      : MyColors.accentBlue,
                ),
              ),
              onTap: () => _scrollToSection('about'),
            ),
            ListTile(
              title: Text(
                'Projects',
                style: TextStyle(
                  fontFamily: 'PTSerif-Bold',
                  fontSize: 20,
                  color: currentSection == 'projects'
                      ? MyColors.navigationBarButtonBackground
                      : MyColors.accentBlue,
                ),
              ),
              onTap: () => _scrollToSection('projects'),
            ),
            ListTile(
              title: Text(
                'Services',
                style: TextStyle(
                  fontFamily: 'PTSerif-Bold',
                  fontSize: 20,
                  color: currentSection == 'services'
                      ? MyColors.navigationBarButtonBackground
                      : MyColors.accentBlue,
                ),
              ),
              onTap: () => _scrollToSection('services'),
            ),
            ListTile(
              title: Text(
                'Contact',
                style: TextStyle(
                  fontFamily: 'PTSerif-Bold',
                  fontSize: 20,
                  color: currentSection == 'contact'
                      ? MyColors.navigationBarButtonBackground
                      : MyColors.accentBlue,
                ),
              ),
              onTap: () => _scrollToSection('contact'),
            ),
          ],
        ),
      )
          : null,
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbVisibility: WidgetStateProperty.all(true),
            thumbColor: WidgetStateProperty.all(MyColors.accentBlue),
            trackColor: WidgetStateProperty.all(MyColors.sectionLightGray),
            thickness: WidgetStateProperty.all(isMobileView ? 8.0 : 10),
            radius: Radius.circular(8.0),
          ),
        ),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HomeSection(key: sectionKeys['home']),
                AboutSection(key: sectionKeys['about']),
                ProjectsSection(key: sectionKeys['projects']),
                ServicesSection(key: sectionKeys['services']),
                ContactSection(key: sectionKeys['contact']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}