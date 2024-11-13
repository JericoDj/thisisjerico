import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../colors/colors.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  void _launchProject(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Image.asset(imagePath, fit: BoxFit.contain),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final double textFontSize = isSmallScreen ? 16 : 48;
    final double descriptionFontSize = isSmallScreen ? 14 : 16;
    final double projectCardWidth = isSmallScreen
        ? MediaQuery.of(context).size.width * 0.9
        : MediaQuery.of(context).size.width * 0.4;

    final List<Map<String, dynamic>> projects = [
      {
        'name': 'EduKid',
        'description': 'An educational platform for kids offering resources, booking sessions, and interactive quizzes.',
        'url': 'https://edukidweb.netlify.app',
        'images': [
          'assets/images/edukid_sample/Edukid 1.png',
          'assets/images/edukid_sample/Edukid 3.png',
          'assets/images/edukid_sample/Edukid 4.png',
          'assets/images/edukid_sample/Edukid.png',
        ],
      },
      {
        'name': 'TimeKeeper',
        'description': 'An HR app for tracking employee attendance with a manager dashboard and timecard view.',
        'url': 'https://timekeeperbyleos.netlify.app',
        'images': [
          'assets/images/timekeeper_sample/Timekeeper 3.png',
          'assets/images/timekeeper_sample/Timekeeper 5.png',
          'assets/images/timekeeper_sample/Timekeeper 6.png',
          'assets/images/timekeeper_sample/Timekeeper.png',
        ],
      },
    ];

    return Center(
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
        color: MyColors.homepageBackground,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Projects',
              style: TextStyle(
                fontSize: textFontSize,
                fontFamily: 'Caligraphy',
                fontWeight: FontWeight.bold,
                color: MyColors.homepageHeadlineText,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Here are some of the projects I’ve developed to help clients achieve seamless and efficient solutions,',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: descriptionFontSize,
                color: MyColors.primaryText,
              ),
            ),
            Text(
              'from educational platforms to HR management tools.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: descriptionFontSize,
                color: MyColors.primaryText,
              ),
            ),
            SizedBox(height: 16),

            // Responsive project display using Wrap for responsiveness
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: projects.map((project) {
                return Container(
                  width: projectCardWidth,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Project Title and Link
                          GestureDetector(
                            onTap: () => _launchProject(project['url']),
                            child: Text(
                              project['name'],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryText,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),

                          // Project Description
                          Text(
                            project['description'],
                            style: TextStyle(
                              fontSize: descriptionFontSize,
                              color: MyColors.secondaryText,
                            ),
                          ),
                          SizedBox(height: 12),

                          // Display project images with a responsive GridView
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isSmallScreen ? 1 : 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 1.6,
                            ),
                            itemCount: project['images'].length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => _showImageDialog(context, project['images'][index]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    project['images'][index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
