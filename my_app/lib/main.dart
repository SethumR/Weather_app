import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
    {
      "day": "Mon",
      "temperature": "24°C",
      "weather": "Sunny",
      "icon": "☀️"
    },
    {
      "day": "Tue",
      "temperature": "21°C",
      "weather": "Cloudy",
      "icon": "☁️"
    },
    {
      "day": "Wed",
      "temperature": "19°C",
      "weather": "Rainy",
      "icon": "🌧️"
    },
    {
      "day": "Thu",
      "temperature": "25°C",
      "weather": "Clear",
      "icon": "🌤️"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Current Weather Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New York",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "25°C",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sunny",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.wb_sunny,
                  size: 80,
                  color: Colors.amber,
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
                color: Colors.black87,
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
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlue[100],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forecastData[index]['day']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
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
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          forecastData[index]['weather']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
