import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/profile/user_profile_cubit.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/color_manager.dart';

class SearchBarScaffold extends StatelessWidget {
  final String title;
  final Color searchIconColor;
  final Color fillColor;

  const SearchBarScaffold({
    required this.title,
    required this.searchIconColor,
    required this.fillColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 650;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                Container(
                  width: screenWidth * 0.3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search, color: searchIconColor),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: fillColor,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                Container(
                  width: 110,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24, width: 1),
                    borderRadius: BorderRadius.circular(55),
                    image: DecorationImage(
                      image: AssetImage('images/logo18.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}