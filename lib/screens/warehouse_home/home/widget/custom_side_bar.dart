import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Bloc/auth/logout_cubit.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../login/login_screen.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        color: ColorManager.blue2,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/logo6.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Youth Empowerment Project',
                      style: TextStyle(
                        color: ColorManager.bc0,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Material(
                color: ColorManager.primaryColor,
                child: ListView(
                  children: [
                    _buildNavItem(Icons.dashboard, 'Dashboard', context, AppRouter.warehouseHome),
                    Container(height: 0.1, color: ColorManager.blue,),
                    // _buildNavItem(Icons.settings, 'Notifications', context, AppRouter.home),
                     _buildNavItem(Icons.error, 'Reports', context, AppRouter.home),
                    Container(height: 0.1, color: ColorManager.blue,),
                    // _buildNavItem(Icons.settings, 'Settings', context, AppRouter.home),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<LogoutCubit>().logout();
                Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
              },
              child: const Material(
                color: ColorManager.blue,
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 80,),
                        Icon(Icons.logout, color: Colors.white, size: 25),
                        SizedBox(width: 10,),
                        Text('Logout', style: TextStyle(color: Colors.white, fontSize: 17)),
                      ],
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, BuildContext context, String route) {
    bool isSelected = ModalRoute.of(context)?.settings.name == route;

    return Container(
      color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 15,),
          Icon(icon, color: ColorManager.blue, size: 30),
          SizedBox(width: 20,),
          Text(title, style: const TextStyle(color: ColorManager.blue, fontSize: 15)),
        ],
      ),/*ListTile(
        leading: Icon(icon, color: ColorManager.blue, size: 25),
        title: Text(title, style: const TextStyle(color: ColorManager.blue, fontSize: 17)),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(route);
        },
      ),*/
    );
  }
}
