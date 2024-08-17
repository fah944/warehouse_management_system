import 'package:flutter/material.dart';
import 'package:project2/screens/login/login_screen.dart';

import '../../screens/Home/home_screen.dart';
import '../../screens/Home/manger_home.dart';
import '../../screens/Home/notifications_screen.dart';
import '../../screens/Home/secretary_home.dart';
import '../../screens/Manager_Screens/profile_screen.dart';
import '../../screens/login/stafflogin_screen.dart';
import '../../screens/register/register_screen.dart';
import '../../screens/warehouse_home/home/warehouse_home_view.dart';

class AppRouter {
  static const String home = '/';
  static const String secretary_home = '/secretary_home';
  static const String profile = '/profile';
  static const String warehouseHome = '/warehouseHome';
  static const String notifications = '/notifications_screen';
  static final routes = <String, WidgetBuilder>{

    LoginScreen.id:(context) =>LoginScreen(),
    RegisterScreen.id:(context) =>LoginScreen(),
    StaffLoginScreen.id:(context) =>StaffLoginScreen(),
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/manager_home',
        name: 'manager_home',
        builder: (context, state) {
          final tabIndex =
              int.tryParse(state.uri.queryParameters['tab'] ?? '0') ?? 0;
          return ManagerHome(tabIndex: tabIndex);
        },
      ),
      GoRoute(
        path: '/secretary_home',
        name: 'secretary_home',
        builder: (context, state) {
          final tabIndex =
              int.tryParse(state.uri.queryParameters['tab'] ?? '0') ?? 0;
          return SecretaryHome(tabIndex: tabIndex);
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: '/warehouseHome',
        builder: (context, state) => const WarehouseManagerHome(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/stafflogin',
        builder: (context, state) => const StaffLoginScreen(),
      ),
      //secertary
      GoRoute(
        path: '/pending_course',
        builder: (context, state) => const PendingCourseScreen(),
      ),
      GoRoute(
        path: '/pending_trainer',
        builder: (context, state) => const PendingTrainerScreen(),
      ),
      GoRoute(
        path: '/pending_beneficiary',
        builder: (context, state) => const PendingBeneficiaryScreen(),
      ),
      GoRoute(
        path: '/course_detail/:id',
        builder: (context, state) {
          final courseId = int.parse(state.pathParameters['id']!);
          return CourseDetailScreen(courseId: courseId);
        },
      ),
      GoRoute(
        path: '/update_beneficiary',
        builder: (context, state) {
          final beneficiary = (state.extra as Map)['beneficiary'] as DataBeneficiary;
          final callback = (state.extra as Map)['callback'] as VoidCallback;
          return BeneficiaryUpdateScreen(
            beneficiary: beneficiary,
            onPop: callback,
          );
        },
      ),
      GoRoute(
        path: '/beneficiary_detail/:id',
        builder: (context, state) {
          final beneficiaryId = int.parse(state.pathParameters['id']!);
          return BeneficiaryDetailsScreen(beneficiaryId: beneficiaryId);
        },
      ),
      GoRoute(
        path: '/trainer_detail/:id',
        builder: (context, state) {
          final trainerId = int.parse(state.pathParameters['id']!);
          return TrainerDetailsScreen(trainerId: trainerId);
        },
      ),
      GoRoute(
        path: '/add_beneficiary',
        builder: (context, state) {
          //    final beneficiary = (state.extra as Map)['beneficiary'] as DataBeneficiary;
          final callback = (state.extra as Map)['callback'] as VoidCallback;
          return BeneficiaryCreateScreen(
            // beneficiary: beneficiary,
            onBeneficiaryAdded: callback,
          );
        },
      ),
      //manager
      GoRoute(
        path: '/course_detail_manager/:id',
        builder: (context, state) {
          final pendingRequest = state.extra as PendingRequest;
          return CourseDetailManagerScreen(pendingRequest: pendingRequest);
        },
      ),
      GoRoute(
        path: '/course_detail_education/:id',
        builder: (context, state) {
          final courseId = int.parse(state.pathParameters['id']!);
          return CourseDetailEducation(courseId: courseId);
        },
      ),
      GoRoute(
        path: '/beneficiary_detail_education/:id',
        builder: (context, state) {
          final beneficiaryId = int.parse(state.pathParameters['id']!);
          return BeneficiaryDetailsEducationScreen(
              beneficiaryId: beneficiaryId);
        },
      ),
      GoRoute(
        path: '/beneficiary_detail_manager/:id',
        builder: (context, state) {
          final pendingRequest = state.extra as DataRequest;
          return BeneficiaryDetailManagerScreen(pendingRequest: pendingRequest);
        },
      ),
      GoRoute(
        path: '/trainer_detail_education/:id',
        builder: (context, state) {
          final trainerId = int.parse(state.pathParameters['id']!);
          return TrainerDetailsEducationScreen(trainerId: trainerId);
        },
      ),
      GoRoute(
        path: '/trainer_detail_manager/:id',
        builder: (context, state) {
          final pendingTrainer = state.extra as PendingTrainer;
          return TranerDetailsManagerScreen(pendingTrainer: pendingTrainer);
        },
      ),


      GoRoute(
        path: '/beneficiary_edit_manager',
        builder: (context, state) {
          final beneficiary = (state.extra as Map)['beneficiary'] as DataRequest;
          final callback = (state.extra as Map)['callback'] as VoidCallback;
          return BeneficiaryEditManagerScreen(
            beneficiary: beneficiary,
            onPop: callback,
          );
        },
      ),

    home: (context) => ManagerHome(),

    secretary_home: (context) => SecretaryHome(),
    profile: (context) => ProfileScreen(),
    warehouseHome: (context) => const WarehouseManagerHome(),
    notifications: (context) =>  NotificationScreen(),



  };
      GoRoute(
        path: '/courses_education',
        builder: (context, state) => const CoursesEducationScreen(),
      ),
      GoRoute(
        path: '/beneficiaries_education',
        builder: (context, state) => const BeneficiariesEducationScreen(),
      ),
      GoRoute(
        path: '/trainers_education',
        builder: (context, state) => const TrainersEducationScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          final query = state.uri.queryParameters['q'] ?? '';
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BeneficiaryCubit(BeneficiaryService())
                  ..searchBeneficiaries(query),
              ),
              BlocProvider(
                create: (context) =>
                    TrainerCubit(TrainerService())..searchTrainers(query),
              ),
              BlocProvider(
                create: (context) =>
                    CourseCubit(CourseService())..searchCourses(query),
              ),
            ],
            child: SearchScreen(query: query),
          );
        },
      ),
      GoRoute(
        path: '/search_bar_scaffold',
        builder: (context, state) {
          final query = state.uri.queryParameters['q'] ?? '';
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => BeneficiaryCubit(BeneficiaryService())
                  ..searchBeneficiaries(query),
              ),
              BlocProvider(
                create: (context) =>
                    TrainerCubit(TrainerService())..searchTrainers(query),
              ),
              BlocProvider(
                create: (context) =>
                    CourseCubit(CourseService())..searchCourses(query),
              ),
            ],
            child: SearchScreen(query: query),
          );
        },
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) {
          final userId = (state.extra as Map<String, dynamic>)['userId'] as int;
          return NotificationScreen(userId: userId);
        },
      ),
    ],
  );
}

