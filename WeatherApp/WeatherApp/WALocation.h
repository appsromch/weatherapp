//
//  WALocation.h
//  WeatherApp
//
//  Created by Mitchell Cooper on 10/28/13.
//  Copyright (c) 2013 Really Good. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^WALocationCallback)(NSURLResponse *res, NSDictionary *data, NSError *err);
typedef void(^WAGeolocationCallback)(void);

@class WAWeatherVC;

@interface WALocation : NSObject <NSURLConnectionDataDelegate> {
    CLLocationCoordinate2D _coordinate;         // coordinate property instance variable
    BOOL inGeoLookup;                           // whether a geolookup is being done now
}

@property WAWeatherVC *viewController;          // the associated view controller

#pragma mark - Location information

@property (nonatomic) NSString *country;                // country name; i.e. South Africa
@property (nonatomic) NSString *countryShort;           // short country name; i.e. ZA (South Africa)
@property (nonatomic) NSString *state;                  // state name; i.e. Indiana
@property (nonatomic) NSString *stateShort;             // short name of state; i.e. IN
@property (nonatomic) NSString *city;                   // city name; i.e. Chalmers
@property (nonatomic) NSString *fullName;               // full name; i.e. Chalmers, Indiana

#pragma mark - Automatic properties

@property (nonatomic, readonly) NSString *region;       // state or country; i.e. South Africa
@property (nonatomic, readonly) NSString *regionShort;  // short name of region; i.e. ZA (South Africa)

#pragma mark - Safe properties

@property (readonly) NSString *safeCity;            // safe properties are URL-encoded
@property (readonly) NSString *safeRegion;
@property (readonly) NSString *safeRegionShort;
@property (readonly) NSString *lookupRegion;

#pragma mark - Current location

@property NSDate *locationAsOf;                 // date of last location check
@property CLLocationCoordinate2D coordinate;    // lat/lon coordinates

#pragma mark - Recent weather conditions

@property NSDate *conditionsAsOf;               // date of last condition check
@property (nonatomic) float degreesC;           // current temp (C)
@property (nonatomic) float degreesF;           // current temp (F)

#pragma mark - Fetching data

- (void)fetchCurrentConditions;
- (void)fetchThreeDayForecast;

@end
