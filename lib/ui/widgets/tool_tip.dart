import 'package:flutter/material.dart';
import 'package:gonner/models/tool_tip/tool_tip_model.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ToolTip extends StatefulWidget {
  final double pinPillPosition;
  final PinInformation currentlySelectedPin;

  ToolTip({this.pinPillPosition, this.currentlySelectedPin});

  @override
  State<StatefulWidget> createState() => ToolTipState();
}

class ToolTipState extends State<ToolTip> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.pinPillPosition,
      right: 0,
      left: 0,
      duration: Duration(milliseconds: 200),
      child: Align(
        child: Container(
          margin: EdgeInsets.all(10),
          height: 70,
          padding: EdgeInsets.only(left: 18, right: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 20,
                    offset: Offset.zero,
                    color: Colors.grey.withOpacity(0.5))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.currentlySelectedPin.locationName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Latitude: ${widget.currentlySelectedPin.location.latitude.toString()}',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(
                        'Longitude: ${widget.currentlySelectedPin.location.longitude.toString()}',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  MapsLauncher.launchCoordinates(
                      widget.currentlySelectedPin.location.latitude,
                      widget.currentlySelectedPin.location.longitude);
                },
                child: Text(
                  'View on map',
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 12),
                ),
                padding: EdgeInsets.all(0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
