// import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlaybackOptions extends StatefulWidget {
  const PlaybackOptions({Key? key}) : super(key: key);
  static const routeName = "/playback-options";

  @override
  State<PlaybackOptions> createState() => _PlaybackOptionsState();
}

class _PlaybackOptionsState extends State<PlaybackOptions> {
  bool _switchVal1 = false;
  bool _switchVal2 = false;
  bool _switchVal3 = false;
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          title.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            ListTileBuilder(
              context,
              "WiFi Only",
              Switch(
                value: this._switchVal1,
                onChanged: (bool value) {
                  setState(
                    () {
                      this._switchVal1 = value;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListTileBuilder(
              context,
              "Cellular Playback Warning",
              Switch(
                value: this._switchVal2,
                onChanged: (bool value) {
                  setState(
                    () {
                      this._switchVal2 = value;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListTileBuilder(
              context,
              "Play next episode automatically",
              Switch(
                value: this._switchVal3,
                onChanged: (bool value) {
                  setState(
                    () {
                      this._switchVal3 = value;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  ListTile ListTileBuilder(
      BuildContext context, String fieldName, Widget _switchValue) {
    return ListTile(
        title: Text(
          fieldName,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        trailing: _switchValue);
  }
}
