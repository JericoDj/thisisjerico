import 'package:flutter/material.dart';
import 'colors/colors.dart';

class NavigationBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final List<String> navItems = ['About', 'Projects', 'Services', 'Contact'];
  final Function(String) onNavItemClicked;
  final String currentSection;

  NavigationBarWidget({
    required this.onNavItemClicked,
    required this.currentSection,
  });

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  String _selectedItem = 'home';

  @override
  void didUpdateWidget(covariant NavigationBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentSection != oldWidget.currentSection) {
      setState(() {
        _selectedItem = widget.currentSection;
      });
    }
  }

  void _onNavItemClicked(String item) {
    setState(() {
      _selectedItem = item;
    });
    widget.onNavItemClicked(item);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobileView = MediaQuery.of(context).size.width < 900;

    return AppBar(
      backgroundColor: MyColors.navigationBarBackground,
      title: isMobileView
          ? Center(
        child: InkWell(
          onTap: () => _onNavItemClicked('home'),
          child: Text(
            'Jerico De Jesus',
            style: TextStyle(
              fontFamily: 'Caligraphy',
              color: widget.currentSection == 'home'
                  ? MyColors.accentBlue
                  : MyColors.navigationBarName,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
          : Row(
        children: [
          SizedBox(width: 150), // Left padding
          InkWell(
            onTap: () => _onNavItemClicked('home'),
            child: Text(
              'Jerico De Jesus',
              style: TextStyle(
                fontFamily: 'Caligraphy',
                color: widget.currentSection == 'home'
                    ? MyColors.accentBlue
                    : MyColors.navigationBarName,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.navItems.map((item) {
              String itemKey = item.toLowerCase();
              bool isSelected = _selectedItem == itemKey;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  onPressed: () => _onNavItemClicked(itemKey),
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      color: isSelected
                          ? MyColors.navigationBarButtonBorder
                          : MyColors.navigationBarButtonBorderSelected,
                    ),
                    backgroundColor: isSelected
                        ? MyColors.navigationBarButtonBackground
                        : MyColors.navigationBarButtonSelected,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(
                      color: isSelected
                          ? MyColors.navigationBarButtonTextSelected
                          : MyColors.navigationBarButtonText,
                      fontSize: 20,
                      fontFamily: 'PTSerif-Bold',
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(width: 100), // Right padding
        ],
      ),
    );
  }
}
