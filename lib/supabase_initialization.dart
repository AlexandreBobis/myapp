import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: dotenv.get('https://dkfcfptrfrwksqbyqqlo.supabase.co'),
    anonKey: dotenv.get('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrZmNmcHRyZnJ3a3NxYnlxcWxvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU3MDAzNzAsImV4cCI6MjAzMTI3NjM3MH0.swXCEi4lZ_1Iws8V802o3-cH-QHXnH59CR8UkKtNa08'),
  );
}