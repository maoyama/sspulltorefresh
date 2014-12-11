//
//  SSPullToRefreshImageContentView.h
//  SSPullToRefresh
//
//  Created by Makoto Aoyama on 11/12/14.
//  Copyright (c) 2014 as. All rights reserved.
//

#import "SSPullToRefreshView.h"

@interface SSPullToRefreshImageContentView : UIView <SSPullToRefreshContentView>

@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, readonly) UIActivityIndicatorView *activityIndicatorView;


- (id)initWithFrame:(CGRect)frame imageNamed:(NSString *)imageNamed;
@end
