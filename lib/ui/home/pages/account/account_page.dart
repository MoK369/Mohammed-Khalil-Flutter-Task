import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/ui/home/pages/account/manager/account_page_state.dart';
import 'package:otex_flutter_task/ui/home/pages/account/manager/account_page_view_model.dart';
import 'package:otex_flutter_task/ui/home/pages/account/widget/custom_plan_card.dart';
import '../../../../core/di/di.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends BaseStatefulWidgetState<AccountPage> {
  AccountPageViewModel accountPageViewModel = getIt.get<AccountPageViewModel>();
  @override
  void initState() {
    super.initState();
    accountPageViewModel.doIntent(GetPlansIntent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => accountPageViewModel,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          titleSpacing: 0,
          title: Text(
            appLocalizations.chooseProperPlan,
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Text(
              appLocalizations.chooseFromSpecialBottomPlans,
              style: theme.textTheme.titleMedium!.copyWith(
                color: AppColors.black.withAlpha(125),
              ),
            ),
          ),
        ),
        body: Center(
          child: BlocBuilder<AccountPageViewModel, AccountPageState>(
            builder: (context, state) {
              switch (state.plansStatus) {
                case StatusEnum.idle:
                case StatusEnum.loading:
                  return const Center(child: CircularProgressIndicator());
                case StatusEnum.success:
                  final plans = state.plans ?? [];
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: plans.length,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CustomPlanCard(
                                features: plans[index].features,
                                planTitle: plans[index].title,
                                viewsNumber: plans[index].viewNumber,
                                planPrice: plans[index].price.toString(),
                              ),
                            );
                          },
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.black.withAlpha(125),
                          borderRadius: BorderRadiusGeometry.circular(8),
                          border: Border.all(
                            color: AppColors.black.withAlpha(12),
                          ),
                        ),
                        child: Column(children: [
                          Text(''),
                          Text("data"),
                          Text("data"),
                        ]),
                      ),
                    ],
                  );
                case StatusEnum.error:
                  return Text(
                    state.plansError.toString(),
                    style: theme.textTheme.titleLarge,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
