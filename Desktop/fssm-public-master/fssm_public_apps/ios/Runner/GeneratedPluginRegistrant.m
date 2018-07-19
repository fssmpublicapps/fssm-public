//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <barcode_scan/BarcodeScanPlugin.h>
#import <geolocation/GeolocationPlugin.h>
#import <geolocator/GeolocatorPlugin.h>
#import <sqflite/SqflitePlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BarcodeScanPlugin registerWithRegistrar:[registry registrarForPlugin:@"BarcodeScanPlugin"]];
  [GeolocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocationPlugin"]];
  [GeolocatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocatorPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
}

@end
