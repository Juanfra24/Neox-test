// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static const BASE_URL = 'https://newsapi.org/v2';
  static const HEADLINES = '$BASE_URL/top-headlines';

  static var API_KEY = dotenv.env['API_KEY'];
}
