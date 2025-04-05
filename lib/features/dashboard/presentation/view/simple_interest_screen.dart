import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/common_widgets/rounded_button.dart';
import 'package:smart_nepal/core/common_widgets/text_form_filed.dart';
import 'package:smart_nepal/core/constants/app_constant.dart';
import 'package:smart_nepal/core/constants/app_string.dart';
import 'package:smart_nepal/core/constants/app_text_style.dart';
import 'package:smart_nepal/features/dashboard/view_model/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final _formKey = GlobalKey<FormState>();

  late DashboardViewModel simpleInterestNotifier;
  @override
  void initState() {
    simpleInterestNotifier =
        Provider.of<DashboardViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    simpleInterestNotifier.clearSelectedValue();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/');
        return false;
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: "Simple Interest",
          leading: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: Icon(Icons.arrow_back_ios)),
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
                Consumer<DashboardViewModel>(
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
      ),
    );
  }
}
