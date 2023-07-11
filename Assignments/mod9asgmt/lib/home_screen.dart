import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mod9asgmt/background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

DateTime? parseDateTimeFromUnixTimestamp(String timestamp) {
  try {
    final intTimestamp = int.parse(timestamp);
    return DateTime.fromMillisecondsSinceEpoch(intTimestamp * 1000);
  } catch (e) {
    print('Error parsing timestamp: $timestamp');
    return null;
  }
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

  String _sunRise = '';
  String _sunSet = '';
  String _currentlyText = '';
  bool _isDayTime = true;
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

        final sys = data['sys'];

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

          _sunRise = sys['sunrise'].toString();
          _sunSet = sys['sunset'].toString();

          final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
          final sunriseTime = int.parse(_sunRise);
          final sunsetTime = int.parse(_sunSet);

          _isDayTime = now >= sunriseTime && now <= sunsetTime;

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
            'sunRise': _sunRise,
            'sunSet': _sunSet,
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
            final sunriseDateTime =
                parseDateTimeFromUnixTimestamp(searchResult['sunRise']!);
            final sunsetDateTime =
                parseDateTimeFromUnixTimestamp(searchResult['sunSet']!);
            final isDay = sunriseDateTime != null &&
                sunsetDateTime != null &&
                DateTime.now().isAfter(sunriseDateTime) &&
                DateTime.now().isBefore(sunsetDateTime);

            String currentlyText = '';

            if (isDay) {
              currentlyText = 'Currently day in $_location';
            } else {
              currentlyText = 'Currently night in $_location';
            }

            setState(() {
              _location = location;
              _temperature = temperature!;
              _weatherImage = weatherImage!;
              _temperatureMin = temperatureMin!;
              _temperatureMax = temperatureMax!;
              _weatherDescription = searchResult['weatherDescription']!;
              _feelsLike = searchResult['feelsLike']!;
              _pressure = pressure!;
              _isDayTime = isDay;
              _currentlyText = currentlyText;
            });
          },
          onLongPress: () {
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
            color: _isDayTime
                ? Colors.white.withAlpha(200)
                : Colors.black.withAlpha(200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  location!,
                  style: TextStyle(fontSize: 16),
                ),
                Image.network(
                  'https://openweathermap.org/img/w/$weatherImage.png',
                ),
                Text(
                  '$temperature°C',
                  style: TextStyle(fontSize: 18),
                ),
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
    final brightness = _isDayTime ? Brightness.light : Brightness.dark;
    final theme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
    );

    final sunriseDateTime = parseDateTimeFromUnixTimestamp(_sunRise);
    final sunsetDateTime = parseDateTimeFromUnixTimestamp(_sunSet);

    final isDay = sunriseDateTime != null &&
        sunsetDateTime != null &&
        DateTime.now().isAfter(sunriseDateTime) &&
        DateTime.now().isBefore(sunsetDateTime);

    final allColor =
        _isDayTime ? Colors.white.withAlpha(130) : Colors.black.withAlpha(130);

    return Theme(
      data: theme,
      child: Scaffold(
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
                decoration: getBackgroundDecoration(_isDayTime),
              ),
              Container(
                margin: const EdgeInsets.only(top: 85),
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        fillColor: allColor,
                        focusColor: allColor,
                        filled: true,
                        labelText: 'Enter location',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: allColor, width: 2.0),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      textInputAction: TextInputAction.search,
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
                      const Text(
                          'Failed to fetch weather data. \nEnter valid location or Check your internet connection')
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
                          if (_isDayTime)
                            Text(
                              'Currently day in $_location',
                              style: TextStyle(fontSize: 16.0),
                            )
                          else
                            Text(
                              'Currently night in $_location',
                              style: TextStyle(fontSize: 16.0),
                            ),
                        ],
                      ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: _isDayTime
                                  ? Colors.white.withAlpha(200)
                                  : Colors.black.withAlpha(200),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Recent Searches',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _recentSearches.clear();
                                        });
                                      },
                                      child: const Text('Clear'),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: buildRecentSearches(),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
