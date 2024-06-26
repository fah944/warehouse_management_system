import 'package:dio/dio.dart';
import 'package:project2/models/user_profile.dart';

class MangerProfileService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://127.0.0.1:8000/api';
  final String _token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzE5MTAzMjUzLCJleHAiOjE3MzYzODMyNTMsIm5iZiI6MTcxOTEwMzI1MywianRpIjoiUmZmRHhPR2pEdkpkbktZTSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.FTdTjGK08B_BTL8sEcLY4z3POQlwlbmUPeESXwI6K8Q';

  Future<UserProfile> fetchUserProfile() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/userProfile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );
      if (response.statusCode == 200) {
        print('Response data: ${response.data}');
        return UserProfile.fromJson(response.data[0]);
      } else {
        print('Failed to load user profile: ${response.statusMessage}');
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.data}');
        print('DioError Type: ${e.type}');
        print('DioError Message: ${e.message}');
      } else {
        print('Error: $e');
      }
      throw Exception('Failed to load user profile');
    }
  }
}
