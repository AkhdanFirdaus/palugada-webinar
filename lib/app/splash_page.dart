import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/core/routes/router.dart';
import 'package:palugada/features/auth/index.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        if (user != null) {
          context.router.replaceNamed('');
        } else {
          UnauthenticatedWrapperRouter();
          context.router.replaceNamed('auth');
        }
      });
      return null;
    }, [user]);
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
