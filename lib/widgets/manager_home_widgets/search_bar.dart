import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Bloc/notification_cubit.dart';
import '../../Bloc/secertary/course/course_cubit.dart';
import '../../Bloc/secertary/student/beneficiary_cubit.dart';
import '../../Bloc/secertary/trainer/trainer_cubit.dart';
import '../../core/utils/color_manager.dart';
import '../../services/Secertary Services/beneficiary_service.dart';
import '../../services/Secertary Services/course_service.dart';
import '../../services/Secertary Services/trainer_services.dart';
import '../../core/utils/shared_preferences_helper.dart';

class Search_Bar extends StatelessWidget {
  final String title;
  final Color searchIconColor;
  final Color fillColor;

  const Search_Bar({
    Key? key,
    required this.title,
    required this.searchIconColor,
    required this.fillColor,
  }) : super(key: key);

  Future<void> _navigateToNotifications(BuildContext context) async {
    final userId = await SharedPreferencesHelper.getUserID();
    if (userId != null) {
      context.go('/notifications', extra: {'userId': userId});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User ID not found.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  onSubmitted: (query) {
                    if (query.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a search term.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      context.go('/search?q=$query');
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search, color: searchIconColor),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: fillColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                iconSize: 25,
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () => _navigateToNotifications(context),
              ),
              const SizedBox(width: 20),
              Container(
                width: 140,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(55)),
                  image: const DecorationImage(
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