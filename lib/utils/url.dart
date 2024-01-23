import 'package:intl/intl.dart';

final DateTime currentDate = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);

// ignore: constant_identifier_names
const BASE_URL =
    "https://newsapi.org/v2/everything?q=tesla&from=formattedDate&sortBy=publishedAt&apiKey";

const kApiKey = "$BASE_URL=ff00d9c8fc8243f7a5923902de3709a8";
