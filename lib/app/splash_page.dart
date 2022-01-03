import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:palugada/core/routes/router.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        context.router.replace(HomeWrapperRouter());
      });
      return null;
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitChasingDots(
            color: Colors.purple,
            size: 100,
          ),
        ),
      ),
    );
  }
}
