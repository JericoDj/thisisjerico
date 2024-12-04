import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thisisjerico/sections/widgets/animated_shape.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors/colors.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    // Check for small screen using MediaQuery
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    bool isMediumScreen = MediaQuery.of(context).size.width < 900;

    // Calculate padding dynamically based on screen width
    double horizontalPadding = MediaQuery.of(context).size.width * 0.1;
    horizontalPadding = horizontalPadding.clamp(16.0, 150.0);

    // Calculate radius dynamically based on screen size
    double radius =
        isSmallScreen ? 60.0 : 90.0; // Adjust radius for small or large screen

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
      color: MyColors.homepageBackground,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: _buildImage(context, isSmallScreen, isMediumScreen)),
                // Adjust image size for medium screens as well
                SizedBox(width: isSmallScreen ? 20 : 40),
                Expanded(
                    child: _buildTaglineAndDescription(
                        context, isSmallScreen, radius)),
              ],
            ),
          ),

          isSmallScreen
              ? Column(
                children: [
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSocialIcon(
                        FontAwesomeIcons.facebook,
                        Colors.blue,
                        'https://www.facebook.com/MjericoDj/',
                        isSmallScreen),
                    _buildSocialIcon(
                        FontAwesomeIcons.instagram,
                        Colors.red,
                        'https://www.instagram.com/djjerico/profilecard/?igsh=YXdyaGVxNGM3b3ly',
                        isSmallScreen),
                    _buildSocialIcon(
                        FontAwesomeIcons.linkedin,
                        Colors.blue,
                        'https://www.linkedin.com/in/mjericodj',
                        isSmallScreen),
                    _buildSocialIcon(
                        FontAwesomeIcons.github,
                        Colors.black,
                        'https://github.com/JericoDj',
                        isSmallScreen),
                  ],
                              ),
                            ),
                ],
              )
              :   SizedBox.shrink()
        ],
      ),
    );
  }

  // Updated _buildImage to handle different sizes for small and medium screens
  Widget _buildImage(
      BuildContext context, bool isSmallScreen, bool isMediumScreen) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: isSmallScreen
          ? screenWidth * 0.6
          : (isMediumScreen ? screenWidth * 0.6 : screenWidth * 0.4),
      // Adjust size for small and medium screens
      height: isSmallScreen
          ? screenWidth * 0.60
          : (isMediumScreen ? screenWidth * 0.62 : screenWidth * 0.4),
      // Adjust height for small and medium screens
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Picture-hd.png'),

          fit: BoxFit.contain,
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Grey color for the bottom border
            width: 0.5, // Set the width of the bottom border
          ),
        ),
      ),
    );
  }

  Widget _buildTaglineAndDescription(
      BuildContext context, bool isSmallScreen, double radius) {
    return Column(
      children: [
        SizedBox(height: isSmallScreen ? 60 : 100),
        AnimatedHexagon(size: isSmallScreen ? 30 : 40, radius: radius),
        // Pass radius based on screen size
        SizedBox(height: isSmallScreen ? 60 : 100),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Turning Ideas Into Reality',
                    style: TextStyle(
                      fontFamily: 'PTSerif-Bold',
                      fontSize: isSmallScreen ? 24 : 48,
                      fontWeight: FontWeight.bold,
                      color: MyColors.homepageHeadlineText,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 8 : 16),
                  Text(
                    'Bringing functional, user-focused applications to life with precision.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'PTSerif-Regular',
                      fontSize: isSmallScreen ? 14 : 24,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),
                  isSmallScreen
                      ? SizedBox.shrink()
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildSocialIcon(
                                  FontAwesomeIcons.facebook,
                                  Colors.blue,
                                  'https://www.facebook.com/MjericoDj/',
                                  isSmallScreen),
                              _buildSocialIcon(
                                  FontAwesomeIcons.instagram,
                                  Colors.red,
                                  'https://www.instagram.com/djjerico/profilecard/?igsh=YXdyaGVxNGM3b3ly',
                                  isSmallScreen),
                              _buildSocialIcon(
                                  FontAwesomeIcons.linkedin,
                                  Colors.blue,
                                  'https://www.linkedin.com/in/mjericodj',
                                  isSmallScreen),
                              _buildSocialIcon(
                                  FontAwesomeIcons.github,
                                  Colors.black,
                                  'https://github.com/JericoDj',
                                  isSmallScreen),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(
      IconData icon, Color color, String url, bool isSmall) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isSmall ? 5.0 : 8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: isSmall ? 16.0 : 24.0,
        // Adjust icon size based on screen size
        padding: EdgeInsets.all(isSmall ? 4.0 : 8.0),
        // Smaller padding for smaller icons
        icon: FaIcon(icon, color: color),
        onPressed: () => _launchURL(url),
      ),
    );
  }
}
