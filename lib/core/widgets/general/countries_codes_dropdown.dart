import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/countries/countries_model.dart';
import 'package:easy_birthday/core/utils/countries/countries_list.dart';
import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class CountriesCodesDropdown extends StatefulWidget {
  final ValueChanged<CountryModel> onCountryChange;
  final String? countryDialCode;
  const CountriesCodesDropdown({
    super.key,
    required this.onCountryChange,
    this.countryDialCode,
  });

  @override
  State<CountriesCodesDropdown> createState() => _CountriesCodesDropdownState();
}

/// Parsed once and shared by every dropdown instance.
final List<CountryModel> _countries = countriesList
    .map((json) => CountryModel.fromJson(json))
    .toList();

class _CountriesCodesDropdownState extends State<CountriesCodesDropdown> {
  List<CountryModel> filteredCountries = _countries;
  late CountryModel selectedCountry;
  OverlayEntry? _dropdownOverlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCountry = _countries.firstWhere(
      (country) => country.dialCode == (widget.countryDialCode ?? '+972'),
      orElse: () => _countries.first,
    );
    widget.onCountryChange(selectedCountry);
  }

  @override
  void dispose() {
    _hideDropdown();
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries(String query) {
    filteredCountries = _countries
        .where(
          (country) =>
              country.name.toLowerCase().contains(query.toLowerCase()) ||
              country.dialCode.contains(query),
        )
        .toList();
  }

  void _showDropdown(BuildContext context) {
    _dropdownOverlayEntry = _createDropdown();
    Overlay.of(context).insert(_dropdownOverlayEntry!);
  }

  void _hideDropdown() {
    _dropdownOverlayEntry
      ?..remove()
      ..dispose();
    _dropdownOverlayEntry = null;
  }

  void _onCountrySelected(CountryModel country) {
    _hideDropdown();
    setState(() => selectedCountry = country);
    widget.onCountryChange(country);
  }

  OverlayEntry _createDropdown() {
    // The FIELD's direction decides which way the list opens (callers wrap the
    // phone row in an LTR Directionality even in Hebrew); the overlay's own
    // context is the app's direction and would push the list off-screen.
    final TextDirection fieldDirection = Directionality.of(context);
    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          // Open toward the screen: the field sits at the start edge, so in
          // RTL the list must grow leftwards or it ends up off-screen.
          targetAnchor: AlignmentDirectional.topStart.resolve(fieldDirection),
          followerAnchor: AlignmentDirectional.topStart.resolve(fieldDirection),
          offset: const Offset(0, 60),
          child: Material(
            elevation: 6,
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            child: StatefulBuilder(
              builder: (context, setState) => Column(
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
                      onChanged: (text) =>
                          setState(() => _filterCountries(text)),
                    ),
                  ),
                  kheasydevDivider(black: true),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
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
                          onTap: () => _onCountrySelected(country),
                        );
                      },
                    ),
                  ),
                ],
              ),
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
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: AppColors.softFill,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Scales down instead of overflowing on narrow fields with
                // large text; unchanged when it fits.
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        Text(selectedCountry.flag),
                        const SizedBox(width: 12),
                        Text(selectedCountry.dialCode),
                      ],
                    ),
                  ),
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
