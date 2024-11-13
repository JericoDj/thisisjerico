import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thisisjerico/colors/colors.dart';

import '../navigation_bar.dart';
import '../sections/about_section.dart';
import '../sections/contacts_section.dart';
import '../sections/home_section.dart';
import '../sections/projects_section.dart';
import '../sections/services_section.dart';

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
      );
      GoRouter.of(context).go('/#${section}');
    }
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
              title: Text('About'),
              onTap: () => _scrollToSection('about'),
            ),
            ListTile(
              title: Text('Projects'),
              onTap: () => _scrollToSection('projects'),
            ),
            ListTile(
              title: Text('Services'),
              onTap: () => _scrollToSection('services'),
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () => _scrollToSection('contact'),
            ),
          ],
        ),
      )
          : null, // Only display drawer in mobile view
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(MyColors.accentBlue),
            trackColor: MaterialStateProperty.all(MyColors.sectionLightGray),
            thickness: MaterialStateProperty.all(8.0),
            radius: Radius.circular(8.0),
          ),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
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
