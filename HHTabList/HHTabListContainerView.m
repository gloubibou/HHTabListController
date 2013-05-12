/*
 * Copyright (c) 2012-2013, Pierre Bernard & Houdah Software s.à r.l.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the <organization> nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#import "HHTabListContainerView.h"

#import "HHTabList.h"

#import <QuartzCore/QuartzCore.h>


@implementation HHTabListContainerView

#pragma mark -
#pragma mark Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
	if (self) {
		self.clipsToBounds = NO;
		self.backgroundColor = [UIColor viewFlipsideBackgroundColor];
		self.opaque = YES;

        UIView *contentView = [[UIView alloc] initWithFrame:[self bounds]];

        [contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];

        _contentView = contentView;

        [self addSubview:contentView];
    }
    
    return self;
}


#pragma mark -
#pragma mark Finalization

- (void)dealloc
{
	HH_RELEASE(_contentView);

#if !HH_ARC_ENABLED
    [super dealloc];
#endif
}


#pragma mark -
#pragma mark Accessors

@synthesize contentView = _contentView;


#pragma mark -
#pragma mark Instance methods

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CALayer *layer = self.layer;
	
	layer.shadowOffset = CGSizeZero;
	layer.shadowOpacity = 0.75f;
	layer.shadowRadius = 10.0f;
	layer.shadowColor = [UIColor blackColor].CGColor;
	layer.shadowPath = [UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
}

@end
