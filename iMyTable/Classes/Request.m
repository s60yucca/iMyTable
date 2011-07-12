//
//  Request.m
//  iFlower
//
//  Created by thohd on 7/23/10.
//  Copyright 2010 iNIL.me. All rights reserved.
//

//#import "JSON.h"
#import "Request.h"

NSString * const kLoginURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/PersonLogin?sEmail=%@&sPassword=%@";
NSString * const kRegisterURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/PersonRegister?sEmail=%@&sPassword=%@";
NSString * const kRestaurantGetByNameURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/RestaurantGetByName?sRestaurant_Name=%@";
NSString * const kRestaurantGetByTypeURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/RestaurantGetByType?sType=%@";
NSString * const kRestaurantGetByNewLocalURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/RestaurantGetByNewLocal?sAddress3=%@&sAddress4=%@";
NSString * const kRestaurantGetByRatingURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/RestaurantGetByRating?sRate=%@";
NSString * const kRestaurantGetAllTypeURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/RestaurantGetAllType";
NSString * const kPersonPWDChangeURL = @"http://74.124.24.95:5001/IRestaurantSV.asmx/PersonPWDChange?sPersonID=%@&sEmail=%@&sOldPwd=%@&sNewPwd=%@";


@implementation Request

@synthesize entries = entries_;
@synthesize xmlData = json_;

static Request *sharedCLDelegate = nil;

+ (Request *)sharedRequest {
    @synchronized(self) {
        if (sharedCLDelegate == nil) {
            sharedCLDelegate = [Request new];
        }
    }
    return sharedCLDelegate;
}

#pragma mark -

- (id) init
{
	if ((self = [super init]) != nil) {
		entries_ = [NSMutableArray new];
		json_ = [NSMutableData new];
	}
	return self;
}

- (void) dealloc
{
	[connection_ release];
	[entries_ release];
	[json_ release];
	[super dealloc];
}

- (void)startConnectionWithURL:(NSURL*)url
{
	if (connection_ == nil)
	{
		NSURLRequest * request = [NSURLRequest requestWithURL: url
												 cachePolicy: NSURLRequestReloadIgnoringLocalCacheData timeoutInterval: 30.0];
		connection_ = [[NSURLConnection connectionWithRequest: request delegate: self] retain];
		NSLog(@"Request with url:%@",url);
	}	
}

#pragma mark -
#pragma mark NSURLConnection

- (void) connection: (NSURLConnection*) connection didFailWithError: (NSError*) error
{
	[[NSNotificationCenter defaultCenter] postNotificationName: @"ContentFailed" object: nil];

	[connection_ release];
	connection_ = nil;
}

- (void) connectionDidFinishLoading: (NSURLConnection*) connection
{
	// Parse the JSON and store it into the Catalog
	
	NSString* json = [[[NSString alloc] initWithData: json_ encoding: NSUTF8StringEncoding] autorelease];
	NSLog(@"JSON:%@",json);
	//NSArray * entries = [json JSONValue];
	
	//[entries_ removeAllObjects];
	
	//for (NSDictionary* dictionary in entries)
	//{
	//	[entries_ addObject: dictionary];
	//}
	
	// Sort the books by title
	
	//	[entries_ sortUsingFunction: SortCatalogEntriesByTitle context: nil];
	
	// Let others know that the catalog reloaded
	
	[[NSNotificationCenter defaultCenter] postNotificationName: @"ContentLoaded" object: nil];
	
	// Release everything
	
	[connection_ release];
	connection_ = nil;
}

- (void) connection: (NSURLConnection*) connection didReceiveResponse: (NSURLResponse*) response
{
	[json_ setLength: 0];
}

- (void) connection: (NSURLConnection*) connection didReceiveData: (NSData*) data
{
    [json_ appendData: data];
}

#pragma mark -
#pragma mark Public methods
- (void) getLogin: (NSString*)email password: (NSString*)password
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kLoginURL,email,password] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) getRegister: (NSString*)email password: (NSString*)password
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kRegisterURL,email,password] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) restaurantGetByName: (NSString*)name
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kRestaurantGetByNameURL,name] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) restaurantGetByType: (NSString*)type
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kRestaurantGetByTypeURL,type] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) restaurantGetByNewLocal: (NSString*)address3 address: (NSString*)address4
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kRestaurantGetByNewLocalURL,address3,address4] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) restaurantGetByRating: (NSString*)rate
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kRestaurantGetByRatingURL,rate] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) restaurantGetAllType
{
	[self startConnectionWithURL:[NSURL URLWithString:[kRestaurantGetAllTypeURL stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}

- (void) personPWDChange:(NSString*)personID email:(NSString*)email oldPWD:(NSString*)oldPWD newPWD:(NSString*)newPWD
{
	[self startConnectionWithURL:[NSURL URLWithString:[[NSString stringWithFormat:kPersonPWDChangeURL,personID,email,oldPWD,newPWD] stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
}
@end
