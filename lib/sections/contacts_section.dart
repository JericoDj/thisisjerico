// sections/contact_section.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../colors/colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  void _scheduleCall() async {
    final url = 'https://calendly.com/dejesusjerico528/30min';
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not schedule a call';
    }
  }

  void _sendEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: 'dejesusjerico528@gmail.com', // Actual email
      query: 'subject=Contact Inquiry&body=Hello, Jerico!',
    );
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch email client';
    }
  }

  void _openLink(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showCustomSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Email address copied to clipboard!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        onPressed: () => _openLink(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.homepageBackground,
      padding: EdgeInsets.symmetric( horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact me',
            style: TextStyle(
              fontFamily: 'PTSerif-Bold',
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: MyColors.homepageHeadlineText,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Interested in collaborating or just want to say hi? Feel free to reach out!',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'PTSerif-Regular' ,fontSize: 18, color: MyColors.primaryText),

          ),
          SizedBox(height: 32),

          // Buttons for Contact Me and Schedule a Call
          ElevatedButton(
            onPressed: _sendEmail,
            child: Text(
              'Contact Me',
              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'PTSerif-Bold'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.accentBlue,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _scheduleCall,
            icon: Icon(Icons.schedule, color: Colors.white),
            label: Text(
              'Schedule a 30-minute Call',
              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'PTSerif-Regular'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.accentGreen,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 32),

          Divider(color: MyColors.dividerColor, thickness: 1.0),
          SizedBox(height: 32),

          // Footer Section
          Text(
            'Stay Connected',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'PTSerif-Regular',
              color: MyColors.secondaryText,
            ),
          ),
          SizedBox(height: 16),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(FontAwesomeIcons.facebook, MyColors.accentBlue, 'https://facebook.com/your-profile'),
              _buildSocialIcon(FontAwesomeIcons.instagram, MyColors.accentRed, 'https://instagram.com/your-profile'),
              _buildSocialIcon(FontAwesomeIcons.linkedin, MyColors.accentBlue, 'https://linkedin.com/in/your-profile'),
              _buildSocialIcon(FontAwesomeIcons.envelope, MyColors.accentGreen, 'mailto:dejesusjerico528@gmail.com'),
            ],
          ),
          SizedBox(height: 32),

          // Selectable Email Address with Copy Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                'dejesusjerico528@gmail.com',
                style: TextStyle(
                  fontFamily: 'PTSerif-Regular',
                  fontSize: 16,
                  color: MyColors.accentBlue,
                  decoration: TextDecoration.underline,
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, color: MyColors.primaryText),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: 'dejesusjerico528@gmail.com'));
                  _showCustomSnackBar(context);
                },
              ),
            ],
          ),
          SizedBox(height: 16),

          // Copyright or Footer Text
          Text(
            '© ${DateTime.now().year} Jerico De Jesus. All Rights Reserved.',
            style: TextStyle(fontSize: 14, color: MyColors.secondaryText),
          ),
        ],
      ),
    );
  }
}
