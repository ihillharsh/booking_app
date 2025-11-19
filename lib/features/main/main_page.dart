import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:app_initial_structure/core/l10n/app_localizations.dart';
import '../../core/di/injection.dart';
import '../../core/config/router/app_router.dart';
import 'bloc/navigation_bloc.dart';
import 'bloc/navigation_event.dart';
import 'bloc/navigation_state.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NavigationBloc>(),
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          FavouriteRoute(),
          SettingsRoute(),
          ProfileRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              final l10n = AppLocalizations.of(context)!;
              return Scaffold(
                body: child,
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) {
                    context.read<NavigationBloc>().add(TabChanged(index));
                    tabsRouter.setActiveIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: l10n.home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.search),
                      label: l10n.favourite,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.calendar_month_rounded),
                      label: l10n.settings,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: l10n.profile,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
