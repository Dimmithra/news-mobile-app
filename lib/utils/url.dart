import 'package:intl/intl.dart';

final DateTime currentDate = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);

// ignore: constant_identifier_names
// const BASE_URL =
//     "https://newsapi.org/v2/everything?q=lates&from=formattedDate&sortBy=publishedAt&apiKey=ff00d9c8fc8243f7a5923902de3709a8";
const BASE_URL =
    "https://newsapi.org/v2/everything?q=tesla&from=formattedDate&sortBy=publishedAt&apiKey=e890f258dab74a0b8df549648fcc3fb1";

//all news
const kGetAllNews = BASE_URL;

const countryType = '';

// ignore: constant_identifier_names
const COUNTRY_URL =
    "https://newsapi.org/v2/everything?q=$countryType&apiKey=ff00d9c8fc8243f7a5923902de3709a8";
