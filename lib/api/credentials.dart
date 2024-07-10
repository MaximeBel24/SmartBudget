import 'package:flutter_dotenv/flutter_dotenv.dart';

class Credentials {
  Credentials._();

  //Environment
  static final String env = dotenv.env['ENV']!;

  //Supabase
  static final String supabaseUrl = dotenv.env['SUPABASE_URL']!;
  static final String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  //Complementary
  static String mailRedirectUrl = dotenv.env['MAIL_REDIRECT_URL']!;

}