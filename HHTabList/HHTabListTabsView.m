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

#import "HHTabListTabsView.h"

@implementation HHTabListTabsView

#pragma mark -
#pragma mark Initialization

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame backgroundImage:[UIImage imageNamed:@"darkPattern"]];
}

- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];

    if (self) {
		self.backgroundView = nil;
        
        // darkPattern.png obtained from http://subtlepatterns.com/classy-fabric/
        // Made by Richard Tabor http://www.purtypixels.com/
		self.separatorColor = [UIColor clearColor];
        self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    }
    
	return self;
}


#pragma mark -
#pragma mark Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
	
	id<UITableViewDataSource> dataSource = self.dataSource;
	NSUInteger count = [dataSource tableView:self numberOfRowsInSection:0];
	
    self.scrollEnabled = (self.rowHeight * count) > self.bounds.size.height;
}

@end
