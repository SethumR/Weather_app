import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Weather App',
      theme: ThemeData(
        fontFamily: 'Montserrat', // You can add custom fonts if necessary
        useMaterial3: true,
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final List<Map<String, String>> forecastData = [
    {"day": "Mon", "temperature": "24°C", "weather": "Sunny", "icon": "☀️"},
    {"day": "Tue", "temperature": "21°C", "weather": "Cloudy", "icon": "☁️"},
    {"day": "Wed", "temperature": "19°C", "weather": "Rainy", "icon": "🌧️"},
    {"day": "Thu", "temperature": "25°C", "weather": "Clear", "icon": "🌤️"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Beautiful Weather'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF50C9C3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100), // Space for transparent app bar
            // Current Weather Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New York",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "25°C",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sunny",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.wb_sunny,
                  size: 80,
                  color: Colors.yellowAccent,
                ),
              ],
            ),
            const SizedBox(height: 40),
            // 5-Day Forecast Section
            const Text(
              "5-Day Forecast",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: forecastData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.all(16.0),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [Color(0xFF50C9C3), Color(0xFF4A90E2)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forecastData[index]['day']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          forecastData[index]['icon']!,
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          forecastData[index]['temperature']!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          forecastData[index]['weather']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
