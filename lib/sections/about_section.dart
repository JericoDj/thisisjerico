import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../colors/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  void downloadCV() async {
    final url = 'https://firebasestorage.googleapis.com/v0/b/edukid-60f55.appspot.com/o/Jerico_De_Jesus_CV.pdf?alt=media&token=76a79aed-5b43-462d-9d2f-1b241f68d684';
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not download CV';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double horizontalPadding = isSmallScreen ? 16 : 200;

    final List<Map<String, dynamic>> expertiseList = [
      {'icon': Icons.devices, 'title': 'Cross-platform', 'subtitle': 'Development with Flutter'},
      {'icon': Icons.lock, 'title': 'Backend Integration', 'subtitle': 'with secure payment processing'},
      {'icon': Icons.cloud, 'title': 'Firebase Realtime', 'subtitle': 'data and authentication'},
      {'icon': Icons.design_services, 'title': 'Building Responsive', 'subtitle': 'and user-friendly interfaces'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: isSmallScreen ? 16 : 64),
      color: MyColors.homepageBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // About Me Section
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isSmallScreen ? 36 : 48,
              fontFamily: 'Caligraphy',
              fontWeight: FontWeight.bold,
              color: MyColors.homepageHeadlineText,
            ),
          ),
          SizedBox(height: 12),

          // Introduction with Name
          Text(
            'Hi!, my name is Jerico.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isSmallScreen ? 20 : 24, fontWeight: FontWeight.bold, color: MyColors.homepageHeadlineText),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              "I'm a freelance Flutter developer who started my career in the Hospitality Industry but discovered my true passion in creating cross-platform mobile and web applications. A self-trained developer, I specialize in Firebase backend integration and have experience in implementing secure payment processing solutions. My background in customer service has shaped my focus on user experience, while my technical skills allow me to deliver efficient, responsive designs. I’m always eager to learn new technologies and push the boundaries of what's possible to create impactful, user-friendly applications.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: isSmallScreen ? 14 : 16, color: MyColors.primaryText),
            ),
          ),

          SizedBox(height: 16),
          // Row with icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.code, color: MyColors.accentBlue, size: 28),
              SizedBox(width: 16),
              Icon(Icons.security, color: MyColors.accentGreen, size: 28),
              SizedBox(width: 16),
              Icon(Icons.mobile_friendly, color: MyColors.accentRed, size: 28),
            ],
          ),
          SizedBox(height: 12),

          // Quote Section with Background Accent
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: MyColors.homepageBackground,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              '“Striving for excellence in every project.”',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
                fontStyle: FontStyle.italic,
                color: MyColors.secondaryText,
              ),
            ),
          ),
          Divider(color: MyColors.dividerColor, thickness: 1.0),
          SizedBox(height: 16),

          // Expertise Section
          Text(
            'What I Bring to the Table',
            style: TextStyle(
              fontFamily: 'Edu',
              fontSize: isSmallScreen ? 20 : 24,
              fontWeight: FontWeight.w600,
              color: MyColors.homepageHeadlineText,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              "With a solid foundation in Flutter development, I bring a unique blend of technical expertise and customer-focused design thinking to each project. My experience in backend integration, secure payment solutions, and real-time data handling allows me to create comprehensive, seamless applications that not only meet client needs but also deliver a smooth user experience. I’m committed to building reliable, scalable applications and am always ready to explore innovative ways to solve challenges.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: isSmallScreen ? 14 : 16, color: MyColors.primaryText),
            ),
          ),
          SizedBox(height: 24),

          // Expertise List with Icons on Top and Multi-line Text, with responsiveness
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: isSmallScreen ? 12 : 24,
              runSpacing: 16,
              children: expertiseList.map((expertise) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      expertise['icon'],
                      color: MyColors.defaultIcon,
                      size: isSmallScreen ? 32 : 40,
                    ),
                    SizedBox(height: 4),
                    Text(
                      expertise['title'],
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryText,
                      ),
                    ),
                    Text(
                      expertise['subtitle'],
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                        color: MyColors.primaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 24),

          // Download CV Button
          ElevatedButton.icon(
            onPressed: downloadCV,
            icon: Icon(Icons.download, color: Colors.white),
            label: Text('Download CV', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryButtonBackground,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
