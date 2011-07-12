//
//  Table.h
//  iMyTable
//
//  Created by nguyen khanh on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Table : NSObject {
	float top;
	float left;
	int size;
	int order;
}
@property(nonatomic,assign)float top;
@property(nonatomic,assign)float left;
@property(nonatomic,assign)int size;
@property(nonatomic,assign)int order;
@end
