import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../colors/colors.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    double horizontalPadding = MediaQuery.of(context).size.width * 0.1;

    // Set minimum and maximum padding values
    horizontalPadding = horizontalPadding.clamp(16.0, 150.0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
      color: MyColors.homepageBackground,
      child: isSmallScreen
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImageAndSocialButtons(context),
          SizedBox(height: 32),
          _buildTaglineAndDescription(context),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildImageAndSocialButtons(context)),
          Expanded(child: _buildTaglineAndDescription(context)),
        ],
      ),
    );
  }

  Widget _buildImageAndSocialButtons(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth < 600 ? screenWidth * 1.1 : 660; // Adjust based on screen width
    double imageWidth = screenWidth < 600 ? screenWidth * 0.8 : 300; // Adjust width for smaller screens

    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        color: MyColors.homepageBackground,
        border: Border(bottom: BorderSide(width: 2, color: MyColors.dividerColor)),
        image: DecorationImage(
          image: AssetImage('assets/images/Web_Picture.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildTaglineAndDescription(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Turning Ideas Into Reality',
            style: TextStyle(
              fontFamily: 'Edu',
              fontSize: isSmallScreen ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: MyColors.homepageHeadlineText,
            ),
          ),
          SizedBox(height: isSmallScreen ? 8 : 16),
          Text(
            'Bringing functional, user-focused applications to life with precision.',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Edu',
              fontSize: isSmallScreen ? 18 : 24,
              color: MyColors.homepagePrimaryText,
            ),
          ),
          SizedBox(height: isSmallScreen ? 16 : 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSocialIcon(FontAwesomeIcons.facebook, MyColors.accentBlue, 'https://www.facebook.com/MjericoDj/'),
              _buildSocialIcon(FontAwesomeIcons.instagram, MyColors.accentRed, 'https://instagram.com/Djjerico'),
              _buildSocialIcon(FontAwesomeIcons.linkedin, MyColors.accentBlue, 'https://www.linkedin.com/in/mjericodj'),
              _buildSocialIcon(FontAwesomeIcons.github, MyColors.primaryText, 'https://github.com/JericoDj'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color, String url) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyColors.socialMediaButtonBorder),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color),
        onPressed: () => _launchURL(url),
      ),
    );
  }
}
