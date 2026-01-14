import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import '/backend/supabase/supabase.dart';
import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  await initFirebase();

  await SupaFlow.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = trackletFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tracklet',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'dashboard';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'dashboard': DashboardWidget(),
      'myItems': MyItemsWidget(),
      'myClaims': MyClaimsWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: SafeArea(
          child: GNav(
            selectedIndex: currentIndex,
            onTabChange: (i) => safeSetState(() {
              _currentPage = null;
              _currentPageName = tabs.keys.toList()[i];
            }),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            color: FlutterFlowTheme.of(context).secondaryText,
            activeColor: FlutterFlowTheme.of(context).alternate,
            tabBackgroundColor: FlutterFlowTheme.of(context).primary,
            tabBorderRadius: 100.0,
            tabMargin: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 6.0, 6.0),
            gap: 2.0,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            duration: Duration(milliseconds: 500),
            haptic: true,
            tabs: [
              GButton(
                icon: currentIndex == 0 ? FFIcons.khome : FFIcons.ksmartHome,
                text: 'Dashboard',
                textStyle: GoogleFonts.outfit(
                  color: FlutterFlowTheme.of(context).info,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                ),
                iconSize: 16.0,
              ),
              GButton(
                icon: currentIndex == 1
                    ? FFIcons.kbxsNotepad
                    : FFIcons.knotepadBold,
                text: 'My Items',
                textStyle: GoogleFonts.outfit(
                  color: FlutterFlowTheme.of(context).info,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                ),
                iconSize: 16.0,
              ),
              GButton(
                icon: currentIndex == 2 ? FFIcons.kuser : FFIcons.kuser,
                text: 'My Claims',
                textStyle: GoogleFonts.outfit(
                  color: FlutterFlowTheme.of(context).info,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                ),
                iconSize: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
