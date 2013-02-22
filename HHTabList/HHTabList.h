/*
 * Copyright (c) 2013, Pierre Bernard & Houdah Software s.à r.l.
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

#import <Foundation/Foundation.h>


#define HH_TAB_LIST_ANIMATION_DURATION		0.4
#define HH_TAB_LIST_WIDTH					(320 - 80)
#define HH_TAB_LIST_TRIGGER_OFFSET			75

#define HH_STATUS_BAR_TINT_HACK_ENABLED		1


#ifndef __has_feature
#define __has_feature(x) 0
#endif

#if __has_feature(objc_arc) && __clang_major__ >= 3
#define HH_ARC_ENABLED 1
#endif

#if HH_ARC_ENABLED
#define HH_RETAIN(xx)			(xx)
#define HH_RELEASE(xx)			xx = nil
#define HH_AUTORELEASE(xx)		(xx)
#define HH_CLEAN(xx)			xx = nil
#else
#define HH_RETAIN(xx)			[xx retain]
#define HH_RELEASE(xx)			[xx release], xx = nil
#define HH_AUTORELEASE(xx)		[xx autorelease]
#define HH_CLEAN(xx)			xx = nil
#endif
