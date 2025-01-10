import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_dp_app/theme/themes.dart';
import 'package:flutter_ecommerce_dp_app/widgets/gradient_buttons.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String? _selectedLanguage;

  final List<Map<String, String>> _languages = [
    {
      'code': 'en',
      'name': 'English',
      'nativeName': 'English',
    },
    {
      'code': 'es',
      'name': 'Spanish',
      'nativeName': 'Espanol',
    },
    {
      'code': 'fr',
      'name': 'French',
      'nativeName': 'Francais',
    },
    {
      'code': 'de',
      'name': 'German',
      'nativeName': 'Deutsch',
    },
    {
      'code': 'it',
      'name': 'Italian',
      'nativeName': 'Italiano',
    },
  ];

  void _handleLanguageSelection() {
    if (_selectedLanguage != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Language",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Select your preferred language",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _languages.length,
                      itemBuilder: (context, index) {
                        final language = _languages[index];
                        final isSelected =
                            language['code'] == _selectedLanguage;

                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primaryColor
                                  : AppTheme.textSecondary
                                      .withValues(alpha: 0.2),
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedLanguage = language['code'];
                              });
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          language['name']!,
                                          style: TextStyle(
                                            color: AppTheme.textPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          language['nativeName']!,
                                          style: TextStyle(
                                            color: AppTheme.textSecondary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? AppTheme.primaryColor
                                            : AppTheme.textSecondary
                                                .withValues(alpha: 0.2),
                                        width: 2,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Container(
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: AppTheme.primaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: GradientButton(
                        text: "Continue",
                        onPressed: _handleLanguageSelection,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
