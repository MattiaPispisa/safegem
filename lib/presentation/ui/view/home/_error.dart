import 'package:flutter/material.dart';
import 'package:safegem/domain/domain.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

import 'package:safegem/presentation/ui/widget/widget.dart';

/// Listen every possible problem from the application and
/// display a message using an [Alert].
///
/// Possible errors:
/// - no connectivity from [ConnectivityHandler];
/// - no location from [LocationHandler];
/// - [EmergencyMessageFailure].
class BlocError extends StatelessWidget {
  /// constructor
  const BlocError({super.key});

  @override
  Widget build(BuildContext context) {
    const nothing = SizedBox();

    return LastKnowConnectivityBuilder(
      builder: (context, connectivity) {
        if (connectivity.isNotConnected) {
          return _alert(context.t().noConnectivity);
        }

        return LastKnowLocationBuilder(
          builder: (context, location) {
            if (location == null) {
              return _alert(context.t().locationNotFound);
            }

            return EmergencyComposerSelector(
              selector: (state) => state.optionFailureOrMessageCreated,
              builder: (context, optionFailureOrMessageCreated) {
                return optionFailureOrMessageCreated.fold(
                  () {
                    return nothing;
                  },
                  (failureOrMessageCreated) {
                    return failureOrMessageCreated.fold(
                      (failure) {
                        return _alert(
                          failure.map(
                            onNumberNotFound: (_) =>
                                context.t().authorityNumberNotFound,
                            onNotRecognized: (_) =>
                                context.t().messageNotRecognized,
                            onUnsupportedUserLocation: (_) =>
                                context.t().unsupportedLocation,
                          ),
                        );
                      },
                      (_) {
                        return nothing;
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _alert(String text) {
    return Alert(child: Text(text));
  }
}
