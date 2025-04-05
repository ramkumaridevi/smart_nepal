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

class CompoundInterestScreen extends StatefulWidget {
  const CompoundInterestScreen({super.key});

  @override
  State<CompoundInterestScreen> createState() => _CompoundInterestScreenState();
}

class _CompoundInterestScreenState extends State<CompoundInterestScreen> {
  final _formKey = GlobalKey<FormState>();

  late DashboardViewModel compoundInterestNotifier;
  @override
  void initState() {
    compoundInterestNotifier =
        Provider.of<DashboardViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    compoundInterestNotifier.clearSelectedValue();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final compoundInterestProvider =
        Provider.of<DashboardViewModel>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        context.go('/');
        return false;
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: "Compound Interest",
          leading: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Consumer<DashboardViewModel>(
          builder: (context, compoundInterestvalue, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CommonTextFormField(
                    labelText: AppCIString.principleAmount,
                    backgroundColor: AppColors.lightOrange,
                    controller:
                        compoundInterestProvider.compoundPrincipalController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppCIString.principleAmountValidation;
                      }
                      if (double.tryParse(value) == null) {
                        return AppCIString.principleAmountValidation2;
                      }
                      return null;
                    },
                  ),
                  AppSpacing.verticalMedium,
                  CommonTextFormField(
                    labelText: AppCIString.rateMonthly,
                    backgroundColor: AppColors.lightOrange,
                    controller: compoundInterestProvider.compoundRateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppCIString.rateValidation;
                      }
                      if (double.tryParse(value) == null) {
                        return AppCIString.rateValidation2;
                      }
                      return null;
                    },
                  ),
                  AppSpacing.verticalMedium,
                  GestureDetector(
                    onTap: () => compoundInterestProvider.selectDate(context,
                        isLoanDate: true),
                    child: AbsorbPointer(
                      child: CommonTextFormField(
                        labelText: AppCIString.loanLiyekoMiti,
                        controller: TextEditingController(
                          text: compoundInterestvalue.loanTakenDateUI != null
                              ? compoundInterestvalue.loanTakenDateUI
                                  .toString() // Raw date string
                              : '',
                        ),
                        backgroundColor: AppColors.lightOrange,
                        suffixIcon: const Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  AppSpacing.verticalMedium,
                  GestureDetector(
                    onTap: () => compoundInterestProvider
                      ..selectDate(context, isLoanDate: false),
                    child: AbsorbPointer(
                      child: CommonTextFormField(
                        labelText: AppCIString.bhuktaniMiti,
                        controller: TextEditingController(
                          text: compoundInterestvalue.paymentDateUI != null
                              ? compoundInterestvalue.paymentDateUI
                                  .toString() // Raw date string
                              : '',
                        ),
                        backgroundColor: AppColors.lightOrange,
                        suffixIcon: const Icon(Icons.calendar_month),
                      ),
                    ),
                  ),
                  AppSpacing.verticalLarge,
                  RoundedButton(
                    text: AppCIString.calculate,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        compoundInterestProvider
                            .calculateCompoundInterest(context);
                        setState(() {});
                      }
                    },
                    color: AppColors.primary.withOpacity(0.8),
                  ),
                  AppSpacing.verticalMedium,
                  if (compoundInterestvalue.totalCompoundAmount != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppCIString.smayAwadhi} ${compoundInterestvalue.timePeriod}',
                          style: AppTextStyles.heading1,
                        ),
                        AppSpacing.verticalExtraSmall,
                        Text(
                          '${AppCIString.kulByaj}: ${compoundInterestvalue.interest}',
                          style: AppTextStyles.heading1,
                        ),
                        AppSpacing.verticalExtraSmall,
                        Text(
                          '${AppCIString.kulRakam}: ${compoundInterestvalue.totalCompoundAmount}',
                          style: AppTextStyles.heading1,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
