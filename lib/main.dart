import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map POC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
          );
        }
      }
      class HomePage extends StatefulWidget {
        HomePage({Key key}) : super(key: key);
      
        @override
        _HomePageState createState() => _HomePageState();
      }
      
      class _HomePageState extends State<HomePage> {
        BitmapDescriptor pinLocationIcon;
        Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

void _onMapCreated (GoogleMapController controller) {
  setState(() {
   
    _markers.add(
      Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(19.344518, 72.806253),
        infoWindow: InfoWindow(
            title: "Pegasus"
          ),
        icon: pinLocationIcon
      )
    );
    
  });
}
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(19.344518, 72.806253),
    zoom: 15,
  );
        @override
        void initState() {
      super.initState();
      setCustomMapPin();
   }
   void setCustomMapPin() async {
      pinLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/custom.png');
   }
        Widget build(BuildContext context) {
          return Scaffold(
             appBar: AppBar(
               title: Text("Maps POC"),
               centerTitle: true,
             ),
             body: GoogleMap(
               mapType: MapType.normal,
               initialCameraPosition: _initialCameraPosition,
              //  onMapCreated: (GoogleMapController controller){
              //    _controller.complete(controller);
                 
              //  },
              onMapCreated: _onMapCreated,
              
               markers: _markers
             ),
          );
        }
      }