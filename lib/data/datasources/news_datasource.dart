import 'package:dio/dio.dart';
import 'package:notices_app/common/api.dart';

abstract class NewsDatasource {
  Future<Map<String, dynamic>> getLatestNews();
}

class NewsDatasourceImpl implements NewsDatasource {
  final Dio dio = Dio();

  @override
  Future<Map<String, dynamic>> getLatestNews() async {
    try {
      final response = await dio.get(
        API.HEADLINES,
        queryParameters: {'country': 'us', 'apiKey': API.API_KEY},
      );
      print(response.data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load News');
      }
    } catch (e) {
      rethrow;
    }
  }
}
