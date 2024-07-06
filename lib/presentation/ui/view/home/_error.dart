import 'package:flutter/material.dart';
import 'package:safegem/presentation/ui/extension/extension.dart';

import '../../widget/widget.dart';

class BlocError extends StatelessWidget {
  const BlocError({super.key});

  @override
  Widget build(BuildContext context) {
    final nothing = SizedBox();

    return LastKnowConnectivityBuilder(builder: (context, connectivity) {
      if (connectivity.isNotConnected) {
        return _alert(context.t().noConnectivity);
      }

      return LastKnowLocationBuilder(builder: (context, location) {
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
      });
    });
  }

  Widget _alert(String text) {
    return Alert(child: Text(text));
  }
}
