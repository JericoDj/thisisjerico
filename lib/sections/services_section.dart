import 'package:flutter/material.dart';
import 'package:thisisjerico/sections/service_card_widget.dart';
import '../colors/colors.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    double horizontalPadding = MediaQuery.of(context).size.width * 0.1;

    // Adjust horizontal padding limits for responsiveness
    if (horizontalPadding < 16) horizontalPadding = 16;
    if (horizontalPadding > 200) horizontalPadding = 200;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: horizontalPadding),
      color: MyColors.homepageBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Text(
            'Services',
            style: TextStyle(
              fontFamily: 'PTSerif-Bold',
              fontSize: isSmallScreen ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: MyColors.homepageHeadlineText,
            ),
          ),
          SizedBox(height: 12),

          // Introductory Description for Services
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 200),
            child: Text(
              'I provide a range of services aimed at helping businesses and individuals establish a strong digital presence. '
                  'From creating engaging websites to building powerful mobile apps and integrating secure cloud solutions, '
                  'I’m here to bring your ideas to life with a focus on functionality, security, and user-friendly design.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PTSerif-Regular',
                fontSize: isSmallScreen ? 14 : 16,
                color: MyColors.primaryText,
              ),
            ),
          ),
          SizedBox(height: 24),

          // Service Cards in a Wrap Layout
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ServiceCard(
                icon: Icons.web,
                title: 'Web Development',
                description: 'High-quality web development services with a focus on responsive, functional designs.',
                backgroundColor: MyColors.primaryBackground,
                iconColor: MyColors.accentBlue,
              ),
              ServiceCard(
                icon: Icons.mobile_friendly,
                title: 'Mobile App Development',
                description: 'Professional mobile app solutions for both Android and iOS platforms.',
                backgroundColor: MyColors.primaryBackground,
                iconColor: MyColors.accentRed,
              ),
              ServiceCard(
                icon: Icons.cloud,
                title: 'Cloud Solutions',
                description: 'Scalable and secure cloud integration and data management.',
                backgroundColor: MyColors.primaryBackground,
                iconColor: MyColors.accentGreen,
              ),
            ],
          ),

          // Contact Section CTA
          SizedBox(height: isSmallScreen ? 20 : 40),
          Text(
            'Interested in working together?',
            style: TextStyle(
              fontFamily: 'PTSerif-Bold',
              fontSize: isSmallScreen ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: MyColors.homepageHeadlineText,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Get in touch for more information or to request a quote.',
            style: TextStyle(
              fontFamily: 'PTSerif-Regular',
              fontSize: isSmallScreen ? 14 : 16,
              color: MyColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
