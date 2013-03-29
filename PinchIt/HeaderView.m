//
//  HeaderView.m
//  PinchIt
//
//  Created by Evadne Wu on 3/28/13.
//  Copyright (c) 2013 Apple Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "HeaderView.h"

@interface HeaderView ()
@property (nonatomic, readwrite, strong) UICollectionViewLayoutAttributes *lastAttributes;
@end

@implementation HeaderView

- (id) initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (!self)
		return nil;
	
	self.layer.borderColor = [UIColor blueColor].CGColor;
	self.layer.borderWidth = 2.0f;
	self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.25f];
	
	return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {

	[super applyLayoutAttributes:layoutAttributes];
	
	self.lastAttributes = layoutAttributes;

}

@end
