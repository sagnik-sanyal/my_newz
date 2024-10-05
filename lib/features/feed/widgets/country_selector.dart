import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../app/constants/ui_constants.dart';
import '../../../core/async_value.dart';
import '../../../core/models/country_model.dart';
import '../../../shared/extensions/context_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../providers/country_notifier.dart';

@immutable
class CountrySelector extends StatelessWidget {
  const CountrySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Country>> state =
        context.select((CountryNotifier bloc) => bloc.countries);
    return state.maybeWhen(
      error: (Object error, StackTrace stackTrace) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: AppText.bold(
              'Unable to load countries',
              color: Colors.red,
            ),
          ),
        ],
      ),
      orElse: () => Skeletonizer(
        ignoreContainers: true,
        enableSwitchAnimation: true,
        enabled: state.isLoading,
        child: Padding(
          padding: const EdgeInsets.all(vPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: AppText.bold('Select your country', maxLines: 1),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => context.pop<void>(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _buildCountries(
                  state.maybeWhen(
                    data: (List<Country> data) => data,
                    orElse: () => List<Country>.generate(
                      5,
                      (_) => Country.india(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the countries list
  ListView _buildCountries(List<Country> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (BuildContext context, int index) {
        final Country country = countries[index];
        return Selector<CountryNotifier, bool>(
          selector: (_, CountryNotifier bloc) => bloc.state == country,
          builder: (_, bool selected, __) => ListTile(
            selected: selected,
            contentPadding: EdgeInsets.zero,
            trailing: selected ? const Icon(Icons.check) : null,
            leading: country.flag != null ? _buildFlag(country) : null,
            title: AppText.medium(country.name),
            onTap: () => context
              ..read<CountryNotifier>().state = country
              ..pop<void>(),
          ),
        );
      },
    );
  }

  /// Builds the flag widget
  CachedNetworkImage _buildFlag(Country country) {
    return CachedNetworkImage(
      cacheKey: country.code,
      imageUrl: country.flag!,
      width: 35,
      height: 35,
      fit: BoxFit.cover,
      errorWidget: (_, __, ___) => const Icon(Icons.flag),
    );
  }
}
