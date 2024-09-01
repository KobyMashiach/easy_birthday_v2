import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/countries_model/countries_model.dart';
import 'package:easy_birthday/services/countries_list.dart';
import 'package:easy_birthday/services/get_direction.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class CountriesCodesDropdown extends StatefulWidget {
  final Function(CountryModel) onCountryChange;
  const CountriesCodesDropdown({super.key, required this.onCountryChange});

  @override
  State<CountriesCodesDropdown> createState() => _CountriesCodesDropdownState();
}

class _CountriesCodesDropdownState extends State<CountriesCodesDropdown> {
  List<CountryModel> countries =
      countriesList.map((json) => CountryModel.fromJson(json)).toList();
  List<CountryModel> filteredCountries = [];
  CountryModel? selectedCountry;
  OverlayEntry? _dropdownOverlayEntry;
  final LayerLink _layerLink = LayerLink();
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredCountries = countries;
    selectedCountry = countries.firstWhere(
      (country) => country.name.toLowerCase() == 'israel',
      orElse: () => countries.first,
    );
    widget.onCountryChange(selectedCountry!);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()) ||
              country.dialCode.contains(query))
          .toList();
    });
  }

  void _showDropdown(BuildContext context) {
    _dropdownOverlayEntry = _createDropdown();
    Overlay.of(context).insert(_dropdownOverlayEntry!);
  }

  void _hideDropdown() {
    _dropdownOverlayEntry?.remove();
    _dropdownOverlayEntry = null;
  }

  OverlayEntry _createDropdown() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width * 0.9,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            elevation: 6,
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                    onChanged: _filterCountries,
                  ),
                ),
                kheasydevDivider(black: true),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      return ListTile(
                        leading: Text(
                          country.flag,
                          style: AppTextStyle().description,
                        ),
                        title: Text(
                          country.name,
                          style: AppTextStyle().description,
                        ),
                        trailing: Text(
                          country.dialCode,
                          style: AppTextStyle().description,
                        ),
                        onTap: () {
                          setState(() {
                            selectedCountry = country;
                            widget.onCountryChange(country);
                            _hideDropdown();
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (_dropdownOverlayEntry == null) {
            _showDropdown(context);
          } else {
            _hideDropdown();
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            right: isRTL(context) ? 12 : 0,
            left: !isRTL(context) ? 12 : 0,
          ),
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedCountry == null
                    ? Expanded(
                        child: Text(
                          "Select a country",
                          style: AppTextStyle().smallDescription,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Row(
                        children: [
                          Text(selectedCountry!.flag),
                          const SizedBox(width: 12),
                          Text(selectedCountry!.dialCode),
                        ],
                      ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
