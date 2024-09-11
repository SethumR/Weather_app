import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Weather App',
      theme: ThemeData.dark(),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E3A59), Color(0xFF1E1E2C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // City and Weather Information
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
                children: [
                  Text(
                    "Colombo, LK",
                    style: TextStyle(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Good Morning",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                                radius: 0.6,
                              ),
                            ),
                            child: Image.asset(
                              'assets/cloud_lightning.png', // Placeholder for weather image
                              width: width * 0.4,
                              height: width * 0.4,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "21°C",
                          style: TextStyle(
                            fontSize: width * 0.2,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(5, 5),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Thunderstorm",
                    style: TextStyle(
                      fontSize: width * 0.06,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Sunrise and Other Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoCard(Icons.wb_sunny_outlined, "Sunrise", "5:45 AM"),
                      _buildInfoCard(Icons.water_drop, "Humidity", "87%"),
                      _buildInfoCard(Icons.cloud_queue_outlined, "Precipitation", "97%"),
                    ],
                  ),
                ],
              ),
            ),
            // Week Forecast Section
            Padding(
              padding: EdgeInsets.all(width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This Week",
                    style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  _buildForecastCard("Mon", "Rainy", "17°C", "🌧️"),
                  _buildForecastCard("Tue", "Sunny", "16°C", "☀️"),
                  _buildForecastCard("Wed", "Rainy", "18°C", "🌧️"),
                  _buildForecastCard("Thu", "Thunder", "15°C", "🌩️"),
                  _buildForecastCard("Fri", "Rainy", "14°C", "🌧️"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build individual forecast card
  Widget _buildForecastCard(String day, String weather, String temp, String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color(0xFF292B3B),
        child: ListTile(
          leading: Text(
            day,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          title: Text(
            weather,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                emoji,
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build info cards (Sunrise, Humidity, etc.)
  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
