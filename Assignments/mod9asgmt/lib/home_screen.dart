import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mod9asgmt/backgroud.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _locationController = TextEditingController();
  String _location = '';
  String _temperature = '';
  String _weatherDescription = '';
  String _weatherImage = '';
  String _temperatureMin = '';
  String _temperatureMax = '';
  String _feelsLike = '';
  String _pressure = '';

  bool _isLoading = false;
  bool _hasError = false;
  final List<Map<String, String>> _recentSearches = [];
  @override
  void initState() {
    super.initState();
    fetchWeatherData('Seoul'); 
  }

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
        final wind = data['wind'];

        setState(() {
          _location = data['name'];
          _temperature = (main['temp']).toStringAsFixed(1);
          _weatherDescription = weather['description'];
          _weatherImage = weather['icon'];
          _temperatureMin = (main['temp_min']).toStringAsFixed(1);
          _temperatureMax = (main['temp_max']).toStringAsFixed(1);
          _feelsLike = (main['feels_like']).toStringAsFixed(1);
          _pressure = main['pressure'].toString();

          final humidity = main['humidity'].toString();
          final visibility = data['visibility'].toString();
          final windSpeed = wind['speed'].toString();
          final windDirection = wind['deg'].toString();

          _recentSearches.add({
            'location': _location,
            'temperature': _temperature,
            'weatherImage': _weatherImage,
            'weatherDescription': _weatherDescription,
            'temperatureMin': _temperatureMin,
            'temperatureMax': _temperatureMax,
            'feelsLike': _feelsLike,
            'pressure': _pressure,
            'humidity': humidity,
            'visibility': visibility,
            'windSpeed': windSpeed,
            'windDirection': windDirection,
          });
          _isLoading = false;
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .65,
        
      ),
      itemCount: _recentSearches.length,
      itemBuilder: (context, index) {
        final searchResult = _recentSearches[index];
        final location = searchResult['location'];
        final temperature = searchResult['temperature'];
        final weatherImage = searchResult['weatherImage'];
        final temperatureMin = searchResult['temperatureMin'];
        final temperatureMax = searchResult['temperatureMax'];
        final pressure = searchResult['pressure'];
        final humidity = searchResult['humidity'];
        final visibility = searchResult['visibility'];
        final windSpeed = searchResult['windSpeed'];
        final windDirection = searchResult['windDirection'];

        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                      ),
                      child: Icon(FontAwesomeIcons.squareXmark),
                    ),
                  ),
                      Text(
                        location,
                        style: const TextStyle(fontSize: 24.0),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://openweathermap.org/img/w/$weatherImage.png',
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            '$temperature°C',
                            style: const TextStyle(fontSize: 32.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Weather: $_weatherDescription',
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Temperature Range: $temperatureMin°C - $temperatureMax°C',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Pressure: $pressure hPa',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Humidity: $humidity%',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Visibility: $visibility meters',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Wind Speed: $windSpeed m/s',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Wind Direction: $windDirection°',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(location!),
                Image.network(
                  'https://openweathermap.org/img/w/$weatherImage.png',
                ),
                Text('$temperature°C'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _recentSearches.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lastUpdatedTime = DateFormat('h:mm a, MMM dd').format(DateTime.now());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'W E A T H E R !',
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: getBackgroundDecoration(context),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(controller: _locationController,
                    decoration: InputDecoration(
                      fillColor: Colors.blueGrey.withAlpha(120),
                      filled: true,
                      labelText: 'Enter a location',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey.withAlpha(120)),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      fetchWeatherData(value);
                      setState(() {
      _locationController.clear();
    });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else if (_hasError)
                    const Text('Failed to fetch weather data. \nEnter valid location or Check your internet connection')
                  else if (_location.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          _location,
                          style: const TextStyle(fontSize: 24.0),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://openweathermap.org/img/w/$_weatherImage.png',
                            ),
                            const SizedBox(width: 10.0),
                            Row(
                              children: [
                                Text(
                                  '$_temperature°C',
                                  style: const TextStyle(fontSize: 32.0),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Max: $_temperatureMax°C',
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                    Text(
                                      'Min: $_temperatureMin°C',
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Feels Like: $_feelsLike°C,',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'Weather: $_weatherDescription',
                          style: const TextStyle(fontSize: 22.0),
                        ),
                        Text(
                          'Pressure: $_pressure hPa,',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Last Updated: $lastUpdatedTime',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withAlpha(120),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: const Text(
                            'Recent Searches',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _recentSearches.clear();
                          });
                        },
                        child: const Text('Clear'),
                      )
                    ],
                  ),
                  Expanded(
                    child: buildRecentSearches(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
