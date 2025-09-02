import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:testcode/controllers/controller.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
    weatherController.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        await weatherController.getCurrentWeather();
      },
      child: Obx(() {
        if (loaderController.isApiLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final weather = weatherController.weather.value;
        if (weather == null) {
          return ListView(
            children: const [
              SizedBox(height: 120),
              Icon(Icons.error, size: 48, color: Colors.redAccent),
              SizedBox(height: 8),
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
            const _TopWeatherWidget(),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _DetailInfoTile(
                  icon: const Icon(
                    Icons.thermostat_outlined,
                    color: Colors.white,
                  ),
                  title: 'Feels Like',
                  data: "${weather.feelsLike?.toStringAsFixed(0)}°",
                ),
                _DetailInfoTile(
                  icon: const Icon(
                    Icons.wind_power_outlined,
                    color: Colors.white,
                  ),
                  title: 'Wind Speed',
                  data: "${weather.windSpeed} m/s",
                ),
                _DetailInfoTile(
                  icon: const Icon(
                    Icons.water_drop_outlined,
                    color: Colors.white,
                  ),
                  title: 'Humidity',
                  data: "${weather.humidity}%",
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class _TopWeatherWidget extends StatelessWidget {
  const _TopWeatherWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConst.getDialogBg(),
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
                  "${weatherController.weather.value?.city}",
                  style: FontConst.getLargeBoldContent(context),
                ),
                Text(
                  Country.tryParse(
                        weatherController.weather.value?.countryCode ?? 'US',
                      )?.name ??
                      "US",
                  style: FontConst.getLargeContent(context),
                ),
              ],
            ),
            const Spacer(),
            Text(
              ("${weatherController.weather.value?.temp?.toStringAsFixed(0)}"),
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
                weatherController.getWeatherImage(
                  weatherController.weather.value?.weatherCategory,
                ),
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
        color: ColorConst.getDialogBg(),
        child: Padding(
          padding: const EdgeInsets.all(PaddingConst.innerPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: PaddingConst.itemSpacing,
            children: [
              CircleAvatar(
                backgroundColor: ColorConst.getPrimary(),
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
