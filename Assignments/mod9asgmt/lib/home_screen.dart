import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mod9asgmt/backgroud_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _location = '';
  String _temperature = '';
  String _weatherDescription = '';
  String _weatherImage = '';
  bool _isLoading = false;
  bool _hasError = false;
  List<Map<String, String>> _recentSearches = [];

  void fetchWeatherData(String location) async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      const apiKey = 'b56885ee979cee677331c9f68db18319';
      final apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final main = data['main'];
        final weather = data['weather'][0];

        setState(() {
          _location = data['name'];
          _temperature = (main['temp']).toStringAsFixed(1);
          _weatherDescription = weather['description'];
          _weatherImage = weather['icon'];

          _isLoading = false;

          _recentSearches.add({
            'location': _location,
            'temperature': _temperature,
            'weatherImage': _weatherImage,
          });
        });
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Widget buildRecentSearches() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemCount: _recentSearches.length,
      itemBuilder: (context, index) {
        final searchResult = _recentSearches[index];
        final location = searchResult['location'];
        final temperature = searchResult['temperature'];
        final weatherImage = searchResult['weatherImage'];

        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(location!),
              SizedBox(height: 8.0),
              Image.network(
                'https://openweathermap.org/img/w/$weatherImage.png',
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(height: 8.0),
              Text('$temperature°C'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('W E A T H E R !'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    //fetchWeatherData();
                  },
                  icon: Icon(Icons.refresh_rounded)),
            )
          ],
        ),
        body: Container(
          decoration: getBackgroundDecoration(context),
          child: Padding(
            padding: EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a location',
                  ),
                  onSubmitted: (value) {
                    fetchWeatherData(value);
                  },
                ),
                SizedBox(height: 16.0),
                if (_isLoading)
                  CircularProgressIndicator()
                else if (_hasError)
                  Text('Failed to fetch weather data.')
                else if (_location.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        _location,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 16.0),
                      Image.network(
                        'https://openweathermap.org/img/w/$_weatherImage.png',
                        // width: 200.0,
                        // height: 200.0,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Temperature: $_temperature°C',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Weather: $_weatherDescription',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Last Updated: ${DateFormat.Hm().format(DateTime.now())}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withAlpha(120),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: Text(
                          'Recent Searches',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withAlpha(120),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.0, vertical: 6.5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _recentSearches.clear();
                          });
                        },
                        child: Text('Clear'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: buildRecentSearches(),
                ),
              ],
            ),
          ),
        ));
  }
}
