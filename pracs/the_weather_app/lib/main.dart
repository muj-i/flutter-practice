import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  late TextEditingController _locationController;
  String _weatherData = " ";

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController();
  }

  void _fetchWeatherData() async {
    final apiKey = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m"; // Replace with your actual API key
    final location = _locationController.text;

    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        _weatherData = response.body;
      });
    } else {
      setState(() {
        _weatherData = " ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter location',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _fetchWeatherData,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16.0),
            _weatherData != null
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Text(_weatherData),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
