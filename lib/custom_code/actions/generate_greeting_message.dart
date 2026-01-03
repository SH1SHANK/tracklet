// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

/// Enhanced time-based greeting system with 4-hour intervals
class _PersonalizedGreetings {
  // Time periods divided into 4-hour segments for precise personalization
  static const _timePeriods = {
    'early_morning': [4, 5, 6, 7], // 4 AM - 7:59 AM
    'morning': [8, 9, 10, 11], // 8 AM - 11:59 AM
    'midday': [12, 13, 14, 15], // 12 PM - 3:59 PM
    'afternoon': [16, 17, 18, 19], // 4 PM - 7:59 PM
    'evening': [20, 21, 22, 23], // 8 PM - 11:59 PM
    'night': [0, 1, 2, 3], // 12 AM - 3:59 AM
  };

  // Authentic, conversational greetings
  static const _greetings = {
    'early_morning_sunny': [
      'Rise and shine, {name}! ☀️',
      'Good morning, {name}! What a beautiful start! 🌅',
      'Morning sunshine, {name}! 🌞',
      'Early bird {name}! Love the energy! ✨'
    ],
    'early_morning_cloudy': [
      'Good morning, {name}! Cozy vibes today! ☁️',
      'Morning {name}! Perfect weather for productivity! 🌥️',
      'Hey {name}! Gentle morning ahead! ☁️',
      'Morning, {name}! Soft skies, strong possibilities! 🌤️'
    ],
    'early_morning_rainy': [
      'Good morning, {name}! Fresh start with fresh rain! 🌧️',
      'Morning {name}! Cozy rainy day energy! ☔',
      'Hey {name}! Perfect morning for indoor victories! 🌦️',
      'Morning, {name}! Rain brings renewal! 🌧️'
    ],
    'early_morning_stormy': [
      'Good morning, {name}! Powerful weather for powerful goals! ⛈️',
      'Morning {name}! Storm energy fuels your determination! ⚡',
      'Hey {name}! Even storms bow to your resilience! 🌩️',
      'Morning, {name}! Thunder announces your arrival! ⛈️'
    ],
    'early_morning_default': [
      'Good morning, {name}! Ready to seize the day! 🌟',
      'Morning {name}! Your day is full of potential! ✨',
      'Hey {name}! What an amazing morning to be alive! 💫',
      'Morning, {name}! Today feels special already! 🚀'
    ],
    'morning_sunny': [
      'Good morning, {name}! The sun is shining just for you! ☀️',
      'Morning {name}! Perfect weather for perfect plans! 🌞',
      'Hey {name}! This sunshine matches your bright spirit! ✨',
      'Morning, {name}! Golden hour, golden opportunities! 🔆'
    ],
    'morning_cloudy': [
      'Good morning, {name}! Peaceful skies for focused work! ☁️',
      'Morning {name}! These clouds are creating your perfect bubble! 🌥️',
      'Hey {name}! Gentle morning for gentle progress! ☁️',
      'Morning, {name}! Soft light, sharp focus! 🌤️'
    ],
    'morning_rainy': [
      'Good morning, {name}! Rain sounds like applause for your day! 🌧️',
      'Morning {name}! Cozy weather for big achievements! ☔',
      'Hey {name}! Fresh rain, fresh possibilities! 🌦️',
      'Morning, {name}! Let the rain wash yesterday away! 🌧️'
    ],
    'morning_stormy': [
      'Good morning, {name}! Storm clouds can\'t dim your light! ⛈️',
      'Morning {name}! Channel this storm energy into success! ⚡',
      'Hey {name}! You\'re the calm in any storm! 🌩️',
      'Morning, {name}! Thunder is just nature cheering you on! ⛈️'
    ],
    'morning_default': [
      'Good morning, {name}! Ready to make today count! 🌟',
      'Morning {name}! Your potential is unlimited today! ✨',
      'Hey {name}! Something amazing is waiting for you! 💫',
      'Morning, {name}! Today is your canvas to paint! 🎨'
    ],
    'midday_sunny': [
      'Good afternoon, {name}! Hope your day is going smoothly! ☀️',
      'Afternoon {name}! This sunshine is energizing! 🌞',
      'Hey {name}! Perfect midday for a perfect person! ✨',
      'Afternoon, {name}! The sun is celebrating you! 🔆'
    ],
    'midday_cloudy': [
      'Good afternoon, {name}! Peaceful vibes for the rest of your day! ☁️',
      'Afternoon {name}! These clouds are keeping you comfortable! 🌥️',
      'Hey {name}! Gentle afternoon energy coming your way! ☁️',
      'Afternoon, {name}! Soft skies, strong momentum! 🌤️'
    ],
    'midday_rainy': [
      'Good afternoon, {name}! Rain is bringing fresh energy! 🌧️',
      'Afternoon {name}! Perfect weather for indoor focus! ☔',
      'Hey {name}! Let this rain refresh your spirit! 🌦️',
      'Afternoon, {name}! Rainy days make victories sweeter! 🌧️'
    ],
    'midday_stormy': [
      'Good afternoon, {name}! Stormy weather, unstoppable you! ⛈️',
      'Afternoon {name}! Your energy surpasses any storm! ⚡',
      'Hey {name}! Thunder can\'t compete with your power! 🌩️',
      'Afternoon, {name}! Storms come and go, you remain! ⛈️'
    ],
    'midday_default': [
      'Good afternoon, {name}! Hope your day is treating you well! 🌟',
      'Afternoon {name}! You\'re halfway to an amazing day! ✨',
      'Hey {name}! The day is still full of possibilities! 💫',
      'Afternoon, {name}! Keep that momentum going! 🚀'
    ],
    'afternoon_sunny': [
      'Good afternoon, {name}! This golden hour is yours! ☀️',
      'Afternoon {name}! Beautiful weather for beautiful plans! 🌞',
      'Hey {name}! The sun is setting the stage for your success! ✨',
      'Afternoon, {name}! Golden light, golden opportunities! 🔆'
    ],
    'afternoon_cloudy': [
      'Good afternoon, {name}! These clouds are creating magic! ☁️',
      'Afternoon {name}! Perfect atmosphere for reflection! 🌥️',
      'Hey {name}! Gentle afternoon vibes just for you! ☁️',
      'Afternoon, {name}! Soft skies, strong finish ahead! 🌤️'
    ],
    'afternoon_rainy': [
      'Good afternoon, {name}! Rain is washing away all worries! 🌧️',
      'Afternoon {name}! Cozy weather for cozy achievements! ☔',
      'Hey {name}! This rain is nature\'s way of refreshing you! 🌦️',
      'Afternoon, {name}! Let the rain inspire your creativity! 🌧️'
    ],
    'afternoon_stormy': [
      'Good afternoon, {name}! Storm\'s fury can\'t match yours! ⛈️',
      'Afternoon {name}! Electrifying weather, electrifying you! ⚡',
      'Hey {name}! You\'re the eye of this storm! 🌩️',
      'Afternoon, {name}! Lightning strikes, but you strike back! ⛈️'
    ],
    'afternoon_default': [
      'Good afternoon, {name}! Time to make the rest of your day amazing! 🌟',
      'Afternoon {name}! You\'re doing great, keep going! ✨',
      'Hey {name}! The afternoon is full of promise! 💫',
      'Afternoon, {name}! Your best moments are still ahead! 🚀'
    ],
    'evening_sunny': [
      'Good evening, {name}! What a beautiful way to end the day! 🌅',
      'Evening {name}! This sunset is celebrating your day! 🌇',
      'Hey {name}! Golden hour matches your golden spirit! ✨',
      'Evening, {name}! Time to relax and reflect! 🌟'
    ],
    'evening_cloudy': [
      'Good evening, {name}! Peaceful skies for a peaceful evening! ☁️',
      'Evening {name}! These gentle clouds are wrapping up your day! 🌥️',
      'Hey {name}! Soft evening vibes coming your way! ☁️',
      'Evening, {name}! Time to unwind under these calm skies! 🌤️'
    ],
    'evening_rainy': [
      'Good evening, {name}! Rain sounds perfect for relaxation! 🌧️',
      'Evening {name}! Cozy weather for a cozy night in! ☔',
      'Hey {name}! Let this rain wash away the day\'s stress! 🌦️',
      'Evening, {name}! Perfect weather for reflection and rest! 🌧️'
    ],
    'evening_stormy': [
      'Good evening, {name}! Storm outside, peace inside! ⛈️',
      'Evening {name}! Thunder outside, tranquility within! ⚡',
      'Hey {name}! The storm makes your calm even more powerful! 🌩️',
      'Evening, {name}! Let the storm rage, you\'ve earned your rest! ⛈️'
    ],
    'evening_default': [
      'Good evening, {name}! Time to celebrate today\'s victories! 🌟',
      'Evening {name}! You\'ve earned this moment of peace! ✨',
      'Hey {name}! What a day it\'s been - time to unwind! 💫',
      'Evening, {name}! Reflect on today, dream about tomorrow! 🌙'
    ],
    'night_any': [
      'Good night, {name}! Hope you had an amazing day! 🌙',
      'Night {name}! Time to rest and recharge! ✨',
      'Hey {name}! Sweet dreams and peaceful sleep ahead! 💫',
      'Night, {name}! Tomorrow is going to be even better! 🌟',
      'Good night, {name}! You\'ve earned this rest! 😴',
      'Night {name}! Let your dreams be as wonderful as you are! 🌙'
    ]
  };

  static String _getTimePeriod(int hour) {
    for (final entry in _timePeriods.entries) {
      if (entry.value.contains(hour)) {
        return entry.key;
      }
    }
    return 'morning'; // fallback
  }

  static String getGreeting(String condition, int hour, String name) {
    final random = Random();
    final timePeriod = _getTimePeriod(hour);

    // Special handling for night period (no weather differentiation)
    if (timePeriod == 'night') {
      final templates = _greetings['night_any']!;
      return templates[random.nextInt(templates.length)]
          .replaceAll('{name}', name);
    }

    // Build key with weather condition
    final key = '${timePeriod}_${condition}';
    final templates = _greetings[key] ?? _greetings['${timePeriod}_default']!;

    return templates[random.nextInt(templates.length)]
        .replaceAll('{name}', name);
  }
}

/// Weather condition mapping with comprehensive coverage
class _WeatherConditions {
  static const _conditions = {
    0: 'sunny', // Clear sky
    1: 'cloudy', // Mainly clear
    2: 'cloudy', // Partly cloudy
    3: 'cloudy', // Overcast
    45: 'cloudy', // Fog
    48: 'cloudy', // Depositing rime fog
    51: 'rainy', // Light drizzle
    53: 'rainy', // Moderate drizzle
    55: 'rainy', // Dense drizzle
    56: 'rainy', // Light freezing drizzle
    57: 'rainy', // Dense freezing drizzle
    61: 'rainy', // Slight rain
    63: 'rainy', // Moderate rain
    65: 'rainy', // Heavy rain
    66: 'rainy', // Light freezing rain
    67: 'rainy', // Heavy freezing rain
    71: 'rainy', // Slight snow fall
    73: 'rainy', // Moderate snow fall
    75: 'rainy', // Heavy snow fall
    77: 'rainy', // Snow grains
    80: 'rainy', // Slight rain showers
    81: 'rainy', // Moderate rain showers
    82: 'rainy', // Violent rain showers
    85: 'rainy', // Slight snow showers
    86: 'rainy', // Heavy snow showers
    95: 'stormy', // Thunderstorm
    96: 'stormy', // Thunderstorm with slight hail
    99: 'stormy' // Thunderstorm with heavy hail
  };

  static String getCondition(int code) => _conditions[code] ?? 'default';
}

// Singleton HTTP client for connection reuse
final _httpClient = http.Client();

const _weatherApiUrl =
    'https://api.open-meteo.com/v1/forecast?latitude=11.2588&longitude=75.7804&current_weather=true';

/// Main function to generate personalized greeting message
/// Returns: String
Future<String> generateGreetingMessage(
  String? userName,
  bool includeWeather,
) async {
  // Input validation: handle null or empty string
  final name = (userName == null || userName.trim().isEmpty)
      ? 'there' // Fallback placeholder to keep the sentence natural
      : userName.trim();

  try {
    String weatherCondition = 'default';

    if (includeWeather) {
      weatherCondition = await _fetchWeatherCondition().timeout(
        const Duration(milliseconds: 2000),
        onTimeout: () => 'default',
      );
    }

    final hour = DateTime.now().hour;

    // The getGreeting logic already uses replaceAll('{name}', name),
    // so it will now use "there" if no name was provided.
    return _PersonalizedGreetings.getGreeting(weatherCondition, hour, name);
  } catch (e) {
    debugPrint('❌ Error: $e');
    return _createFallbackGreeting(name);
  }
}

/// Fetches current weather condition from Open-Meteo API
Future<String> _fetchWeatherCondition() async {
  try {
    final response = await _httpClient
        .get(Uri.parse(_weatherApiUrl))
        .timeout(const Duration(milliseconds: 2000));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final weatherCode = data['current_weather']?['weathercode'] as int?;
      if (weatherCode != null) {
        return _WeatherConditions.getCondition(weatherCode);
      }
    }
  } catch (e) {
    debugPrint('⚠️ Weather fetch error: $e');
  }
  return 'default';
}

/// Creates a fallback greeting as a String
String _createFallbackGreeting(String name) {
  final random = Random();
  final hour = DateTime.now().hour;

  final fallbackGreetings = {
    'early_morning': ['Good morning, $name! 🌅', 'Rise and shine, $name! ☀️'],
    'morning': ['Good morning, $name! ✨', 'Morning sunshine, $name! 🌞'],
    'midday': [
      'Good afternoon, $name! 🌟',
      'Hey $name! Hope your day is great! ✨'
    ],
    'afternoon': ['Good afternoon, $name! 🌅', 'Afternoon, $name! ✨'],
    'evening': ['Good evening, $name! 🌙', 'Evening, $name! Time to unwind! ✨'],
    'night': ['Good night, $name! 🌙', 'Night, $name! Sweet dreams! ✨']
  };

  final timePeriod = _PersonalizedGreetings._getTimePeriod(hour);
  final greetingOptions =
      fallbackGreetings[timePeriod] ?? fallbackGreetings['morning']!;

  return greetingOptions[random.nextInt(greetingOptions.length)];
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
