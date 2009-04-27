//
//  haversine.h
//
//  Created by Carsten Nielsen on 23/04/09.
//

#import <Foundation/Foundation.h>

extern float const HAVERSINE_RADS_PER_DEGREE;
extern float const HAVERSINE_MI_RADIUS;
extern float const HAVERSINE_KM_RADIUS;
extern float const HAVERSINE_M_PER_KM;
extern float const HAVERSINE_F_PER_MI;

@interface Haversine : NSObject {
  float lat1;
  float lon1;
  float lat2;
  float lon2;
}

@property float lat1;
@property float lon1;
@property float lat2;
@property float lon2;

- (id)init;
- (id)initWithLat1:(float)newLat1
              lon1:(float)newLon1
              lat2:(float)newLat2
              lon2:(float)newLon2;
- (float)distance;
- (float)toKilometers;
- (float)toMeters;
- (float)toMiles;
- (float)toFeet;

@end
