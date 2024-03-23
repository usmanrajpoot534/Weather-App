import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/weather_bloc.dart';
import '../widgets/blured_gradient_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BluredGradientScreen(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherSuccessState) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _greeting(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.deepPurple,
                          offset: Offset(1, 1),
                          blurRadius: 30,
                        ),
                        Shadow(
                          color: Colors.deepOrange,
                          offset: Offset(-1, -1),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(
                    'assets/${_weatherIcon(state.weather.weatherConditionCode!)}.png'),
                Text(
                  '${state.weather.temperature?.celsius?.round()}°C',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${state.weather.weatherMain}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  DateFormat('EEEE dd • hh:mm a').format(state.weather.date!),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _indication(
                      'sun',
                      'Sunrise',
                      DateFormat('hh:mm a').format(state.weather.sunrise!),
                    ),
                    _indication(
                      'moon',
                      'Sunset',
                      DateFormat('hh:mm a').format(state.weather.sunset!),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _indication('temp-hot', 'Temp Max',
                        '${state.weather.tempMax?.celsius?.round()}°C'),
                    _indication('temp-cold', 'Temp Min',
                        '${state.weather.tempMin?.celsius?.round()}°C'),
                  ],
                ),
              ],
            );
          }
          return const Center(
            child: Text(
              'Weather fetching failed',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _indication(String icon, String title, String time) {
    return Row(
      children: [
        Image.asset(
          'assets/$icon.png',
          scale: 8,
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _weatherIcon(int code) {
    switch (code) {
      case >= 200 && <= 232:
        return 'thunder';
      case >= 300 && <= 310:
        return 'wind-clouds';
      case >= 311 && <= 321:
        return 'cloudy-winds';
      case >= 500 && <= 502:
        return 'rain';
      case >= 503 && <= 531:
        return 'heavy-rain';
      case >= 600 && <= 622:
        return 'snow-falling';
      case >= 701 && <= 781:
        return 'clouds';
      case == 800:
        return 'sunny';
      case >= 801 && <= 802:
        return 'sunny-clouds';
      case >= 803 && <= 804:
        return 'clouds';
      default:
        return 'sunny';
    }
  }

  String _greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
