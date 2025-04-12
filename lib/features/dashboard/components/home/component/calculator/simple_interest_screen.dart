import 'package:flutter/material.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/common_widgets/rounded_button.dart';
import 'package:smart_nepal/core/common_widgets/text_form_filed.dart';
import 'package:smart_nepal/core/constants/app_constant.dart';
import 'package:smart_nepal/core/constants/app_string.dart';
import 'package:smart_nepal/core/constants/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:smart_nepal/features/dashboard/components/home/view_model/calculator_view_model.dart';

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final _formKey = GlobalKey<FormState>();

  late CalculatorViewModel simpleInterestNotifier;
  @override
  void initState() {
    simpleInterestNotifier =
        Provider.of<CalculatorViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    simpleInterestNotifier.clearSelectedValue();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Simple Interest",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CommonTextFormField(
                labelText: AppSIString.principleAmount,
                backgroundColor: AppColors.lightBlue,
                controller: simpleInterestNotifier.principalController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppSIString.principleAmountValidation;
                  }
                  if (double.tryParse(value) == null) {
                    return AppSIString.principleAmountValidation2;
                  }
                  return null;
                },
              ),
              AppSpacing.verticalMedium,
              CommonTextFormField(
                labelText: AppSIString.rate,
                backgroundColor: AppColors.lightBlue,
                controller: simpleInterestNotifier.rateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppSIString.rateValidation;
                  }
                  if (double.tryParse(value) == null) {
                    return AppSIString.rateValidation2;
                  }
                  return null;
                },
              ),
              AppSpacing.verticalMedium,
              CommonTextFormField(
                labelText: AppSIString.time,
                backgroundColor: AppColors.lightBlue,
                controller: simpleInterestNotifier.timeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppSIString.timeValidation;
                  }
                  if (double.tryParse(value) == null) {
                    return AppSIString.timeValidation2;
                  }
                  return null;
                },
              ),
              AppSpacing.verticalLarge,
              RoundedButton(
                text: AppSIString.calculate,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    simpleInterestNotifier.calculateSimpleInterest();
                  }
                },
                color: AppColors.primary.withOpacity(0.8),
              ),
              AppSpacing.verticalLarge,
              Consumer<CalculatorViewModel>(
                  builder: (context, provider, child) => provider.result != -1
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppSIString.kulByaj}: ${provider.result}',
                              style: AppTextStyles.heading1,
                            ),
                            Text(
                              '${AppSIString.kulRakam}: ${provider.totalAmount}',
                              style: AppTextStyles.heading1,
                            ),
                          ],
                        )
                      : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
