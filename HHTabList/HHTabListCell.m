/*
 * Copyright (c) 2012, Pierre Bernard & Houdah Software s.à r.l.
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

#import "HHTabListCell.h"

#import "HHTabList.h"


@interface HHTabListCell ()
{
	UIView	*_selectionBackgroundView;
	UIView	*_separatorLineView;
}

@property (nonatomic, strong) UIView	*selectionBackgroundView;
@property (nonatomic, strong) UIView	*separatorLineView;

@end

@implementation HHTabListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

	if (self) {
		CGRect	frame						= self.bounds;
		UIView	*selectionBackgroundView	= [[UIView alloc] initWithFrame:frame];

		selectionBackgroundView.opaque				= YES;
		selectionBackgroundView.backgroundColor		= [UIColor orangeColor];
		selectionBackgroundView.autoresizingMask	= UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

		self.selectionBackgroundView				= selectionBackgroundView;
		self.selectedBackgroundView					= selectionBackgroundView;

		CGRect	lineFrame					= self.bounds;

		lineFrame.origin.y							+= lineFrame.size.height;
		lineFrame.size.height						= 1.0;

		UIView	*separatorLineView			= [[UIView alloc] initWithFrame:lineFrame];

		separatorLineView.opaque					= YES;
		separatorLineView.backgroundColor			= [UIColor orangeColor];
		separatorLineView.autoresizingMask			= UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;

		self.separatorLineView						= separatorLineView;

		[self addSubview:separatorLineView];
	}

	return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}

#pragma mark -
#pragma mark Finalization

- (void)dealloc
{
	HH_RELEASE(_selectionBackgroundView);
	HH_RELEASE(_separatorLineView);
	HH_RELEASE(_selectionBackgroundColor);

#if !HH_ARC_ENABLED
	[super dealloc];
#endif
}

#pragma mark -
#pragma mark Accessors

@synthesize selectionBackgroundView		= _selectionBackgroundView;
@synthesize separatorLineView			= _separatorLineView;
@synthesize selectionBackgroundColor	= _selectionBackgroundColor;

- (void)setSelectionBackgroundColor:(UIColor *)selectionBackgroundColor
{
	_selectionBackgroundColor = HH_RETAIN(selectionBackgroundColor);

	[self updateSelectionBackgroundViews];
}

#pragma mark -
#pragma mark Lifecycle

- (void)prepareForReuse
{
	[super prepareForReuse];

	[self updateSelectionBackgroundViews];
}

#pragma mark -
#pragma mark Instance methods

- (void)updateSelectionBackgroundViews
{
	UIColor *selectionBackgroundColor	= self.selectionBackgroundColor;
	UIView	*selectionBackgroundView	= self.selectionBackgroundView;
	UIView	*separatorLineView			= self.separatorLineView;

	selectionBackgroundView.backgroundColor = selectionBackgroundColor;
	separatorLineView.backgroundColor		= selectionBackgroundColor;
}

@end
