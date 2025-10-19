import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/enums.dart';
import 'package:otex_flutter_task/ui/plans/manager/plans_screen_state.dart';
import 'package:otex_flutter_task/ui/plans/manager/plans_screen_view_model.dart';
import 'package:otex_flutter_task/ui/plans/widget/custom_plan_card.dart';
import '../../core/di/di.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends BaseStatefulWidgetState<PlansScreen> {
  PlansScreenViewModel accountPageViewModel = getIt.get<PlansScreenViewModel>();
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
          title: Text(appLocalizations.chooseProperPlan),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
          child: BlocBuilder<PlansScreenViewModel, PlansScreenState>(
            builder: (context, state) {
              switch (state.plansStatus) {
                case StatusEnum.idle:
                case StatusEnum.loading:
                  return const Center(child: CircularProgressIndicator());
                case StatusEnum.success:
                  final plans = state.plans ?? [];
                  return plans.isEmpty
                      ? Text(
                          appLocalizations.noItemsFound,
                          style: theme.textTheme.titleLarge,
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: plans.length + 1,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 8,
                                ),
                                itemBuilder: (context, index) {
                                  return index == plans.length
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: AppColors.black.withAlpha(
                                                12,
                                              ),
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    8,
                                                  ),
                                              border: Border.all(
                                                color: AppColors.black
                                                    .withAlpha(20),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  appLocalizations.plansForYou,
                                                  style: theme
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Text(
                                                  appLocalizations
                                                      .contactUsForProperPlan,
                                                  style: theme
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    appLocalizations.salesTeam,
                                                    style: theme
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                          color: AppColors.blue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 24.0,
                                          ),
                                          child: CustomPlanCard(
                                            features: plans[index].features,
                                            planTitle: plans[index].title,
                                            viewsNumber:
                                                plans[index].viewNumber,
                                            ribbonTitle:
                                                plans[index].ribbonTitle,
                                            planPrice: plans[index].price
                                                .toString(),
                                          ),
                                        );
                                },
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: AppColors.black.withAlpha(20),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: FilledButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(appLocalizations.next),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
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
