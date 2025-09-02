import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/controller/loader_provider.dart';
import 'package:testcode/controller/weather_provider.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().getCurrentWeather(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoaderProvider, WeatherProvider>(
      builder: (context, loaderController, weatherController, _) {
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            await weatherController.getCurrentWeather(context);
          },
          child: loaderController.isApiLoading
              ? const Center(child: CircularProgressIndicator())
              : _buildWeatherContent(context, weatherController),
        );
      },
    );
  }

  Widget _buildWeatherContent(
    BuildContext context,
    WeatherProvider weatherController,
  ) {
    final weather = weatherController.weather;
    if (weather == null) {
      return ListView(
        children: const [
          SizedBox(height: 120),
          Icon(Icons.error, size: 48, color: Colors.redAccent),
          SizedBox(height: PaddingConst.itemSpacing),
          Text(
            "No Data Found\nPull down to refresh",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.all(PaddingConst.innerPadding),
      children: [
        _TopWeatherWidget(weatherController: weatherController),
        const SizedBox(height: PaddingConst.innerPadding),
        Row(
          spacing: PaddingConst.itemSpacing,
          children: [
            _DetailInfoTile(
              icon: const Icon(Icons.thermostat_outlined, color: Colors.white),
              title: 'Feels Like',
              data: "${weather.feelsLike?.toStringAsFixed(0)}°",
            ),
            _DetailInfoTile(
              icon: const Icon(Icons.wind_power_outlined, color: Colors.white),
              title: 'Wind Speed',
              data: "${weather.windSpeed} m/s",
            ),
          ],
        ),
        Row(
          children: [
            _DetailInfoTile(
              icon: const Icon(Icons.water_drop_outlined, color: Colors.white),
              title: 'Humidity',
              data: "${weather.humidity}%",
            ),
          ],
        ),
      ],
    );
  }
}

class _TopWeatherWidget extends StatelessWidget {
  final WeatherProvider weatherController;
  const _TopWeatherWidget({required this.weatherController});

  @override
  Widget build(BuildContext context) {
    final weather = weatherController.weather;
    return Card(
      color: ColorConst.getDialogBg(context),
      child: Padding(
        padding: const EdgeInsets.all(PaddingConst.innerPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather?.city ?? '',
                  style: FontConst.getLargeBoldContent(context),
                ),
                Text(
                  Country.tryParse(weather?.countryCode ?? 'US')?.name ?? "US",
                  style: FontConst.getLargeContent(context),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "${weather?.temp?.toStringAsFixed(0)}",
              style: FontConst.getLargeBoldContent(
                context,
              ).copyWith(fontSize: 48),
            ),
            Transform.translate(
              offset: const Offset(0.0, -15.0),
              child: Text('°C', style: FontConst.getContent(context)),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                weatherController.getWeatherImage(weather?.weatherCategory),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailInfoTile extends StatelessWidget {
  final String title;
  final String data;
  final Widget icon;
  const _DetailInfoTile({
    required this.title,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        color: ColorConst.getDialogBg(context),
        child: Padding(
          padding: const EdgeInsets.all(PaddingConst.innerPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: PaddingConst.itemSpacing,
            children: [
              CircleAvatar(
                backgroundColor: ColorConst.getPrimary(context),
                child: icon,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(child: Text(title, style: FontConst.greyContent)),
                    FittedBox(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 1.0),
                        child: Text(
                          data,
                          style: FontConst.getBoldContent(context),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
