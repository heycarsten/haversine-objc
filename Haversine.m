//
//  haversine.m
//
//  Created by Carsten Nielsen.
//

#import "Haversine.h"

float const HAVERSINE_RADS_PER_DEGREE = 0.0174532925199433;
float const HAVERSINE_MI_RADIUS = 3956.0;
float const HAVERSINE_KM_RADIUS = 6371.0;
float const HAVERSINE_M_PER_KM = 1000.0;
float const HAVERSINE_F_PER_MI = 5282.0;


@implementation Haversine

@synthesize lat1, lon1, lat2, lon2;

- (id)init {
  return [self initWithLat1:0.0 lon1:0.0 lat2:0.0 lon2:0.0];
}

- (id)initWithLat1:(float)newLat1
              lon1:(float)newLon1
              lat2:(float)newLat2
              lon2:(float)newLon2 {
  self = [super init]; 
  if (self) {
    self.lat1 = newLat1;
    self.lon1 = newLon1;
    self.lat2 = newLat2;
    self.lon2 = newLon2;
  }
  return self; 
}

- (float)distance {
  float lat1Rad = lat1 * HAVERSINE_RADS_PER_DEGREE;
  float lat2Rad = lat2 * HAVERSINE_RADS_PER_DEGREE;
  float dLonRad = ((lon2 - lon1) * HAVERSINE_RADS_PER_DEGREE);
  float dLatRad = ((lat2 - lat1) * HAVERSINE_RADS_PER_DEGREE);
  float a = pow(sin(dLatRad / 2), 2) + cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLonRad / 2), 2);
  return (2 * atan2(sqrt(a), sqrt(1 - a)));
}

- (float)toKilometers {
  return [self distance] * HAVERSINE_KM_RADIUS;
}

- (float)toMeters {
  return [self toKilometers] * HAVERSINE_M_PER_KM;
}

- (float)toMiles {
  return [self distance] * HAVERSINE_MI_RADIUS; 
}

- (float)toFeet {
  return [self toMiles] * HAVERSINE_F_PER_MI;
}

@end
