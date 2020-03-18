import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  // Value that is shown in the date picker in time mode.
//  DateTime time = DateTime.now();
  DateTime startTime = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime endTime = DateTime.utc(2020, 1, 1, 18, 0, 0);

  @override
  Widget build(BuildContext context) {
//    print(time);
    print(DateFormat.jm().format(startTime).toString());
    print(DateFormat.jm().format(endTime).toString());
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return _BottomPicker(
              child: CupertinoDatePicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                mode: CupertinoDatePickerMode.time,
                initialDateTime: startTime,
                onDateTimeChanged: (newDateTime) {
                  setState(() => startTime = newDateTime);
                },
              ),
            );
          },
        );
      },
      child: _Menu(
        children: [
          Text(
            // this formats the time to 8 am.
            // todo: use this time value and push to server
            DateFormat.jm().format(startTime),
            style: TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }
}

class TimePicker2 extends StatefulWidget {
  @override
  _TimePicker2State createState() => _TimePicker2State();
}

class _TimePicker2State extends State<TimePicker2> {
  // Value that is shown in the date picker in time mode.
//  DateTime time = DateTime.now();
  DateTime startTime = DateTime.utc(2020, 1, 1, 8, 0, 0);
  DateTime endTime = DateTime.utc(2020, 1, 1, 18, 0, 0);

  @override
  Widget build(BuildContext context) {
//    print(time);
    print(startTime);
    print(endTime);
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) {
            return _BottomPicker(
              child: CupertinoDatePicker(
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                mode: CupertinoDatePickerMode.time,
                initialDateTime: endTime,
                onDateTimeChanged: (newDateTime) {
                  setState(() => endTime = newDateTime);
                },
              ),
            );
          },
        );
      },
      child: _Menu(
        children: [
          Text(
            DateFormat.jm().format(endTime),
            style: TextStyle(color: CupertinoColors.inactiveGray),
          ),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key key,
    @required this.children,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          right: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          left: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}
