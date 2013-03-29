//
//  PICollectionView.m
//  PinchIt
//
//  Created by Evadne Wu on 3/28/13.
//  Copyright (c) 2013 Apple Inc. All rights reserved.
//

#import "PICollectionView.h"
#import "PinchLayout.h"
#import "Cell.h"
#import "HeaderView.h"

@implementation PICollectionView

- (void) layoutSubviews {

	NSArray *existingHeaderViews = [self.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^(UICollectionReusableView *view, NSDictionary *bindings) {
		return [view isKindOfClass:[HeaderView class]];
	}]];
	
	[super layoutSubviews];
	
	NSArray *allHeaderViews = [self.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^(UICollectionReusableView *view, NSDictionary *bindings) {
		return [view isKindOfClass:[HeaderView class]];
	}]];
	
	NSMutableArray *insertedHeaderViews = [allHeaderViews mutableCopy];
	[insertedHeaderViews removeObjectsInArray:existingHeaderViews];
	
	for (HeaderView *insertedHeader in insertedHeaderViews) {
		NSArray *existingDuplicates = [existingHeaderViews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^(HeaderView *existingHeaderView, NSDictionary *bindings) {
			return [existingHeaderView.lastAttributes.indexPath isEqual:insertedHeader.lastAttributes.indexPath];
		}]];
		for (HeaderView *duplicateHeaderView in existingDuplicates)
			[duplicateHeaderView removeFromSuperview];
	}
	
	for (UICollectionViewCell *cell in [self visibleCells])
		[cell.superview bringSubviewToFront:cell];
	
}

@end
