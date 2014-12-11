//
//  SSPullToRefreshImageContentView.m
//  SSPullToRefresh
//
//  Created by Makoto Aoyama on 11/12/14/.
//  Copyright (c) 2014 Makoto Aoyama. All rights reserved.
//

#import "SSPullToRefreshImageContentView.h"

@implementation SSPullToRefreshImageContentView

@synthesize imageView = _imageView;
@synthesize activityIndicatorView = _activityIndicatorView;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.frame = CGRectMake(30.0f, 25.0f, 20.0f, 20.0f);
        [self addSubview:_activityIndicatorView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame imageNamed:(NSString *)imageNamed
{
    self = [self initWithFrame:frame];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    
    [self addSubview:_imageView];

    return self;
}

- (void)layoutSubviews {
    CGSize size = self.bounds.size;

    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    self.imageView.frame = CGRectMake(roundf((size.width - imageWidth) / 2.0f), roundf((size.height - imageHeight) / 2.0f), imageWidth, imageHeight);
    
    self.activityIndicatorView.frame = CGRectMake(roundf((size.width - 20.0f) / 2.0f), roundf((size.height - 20.0f) / 2.0f), 20.0f, 20.0f);
}


#pragma mark - SSPullToRefreshContentView

- (void)setState:(SSPullToRefreshViewState)state withPullToRefreshView:(SSPullToRefreshView *)view {
    switch (state) {
        case SSPullToRefreshViewStateReady: {
            self.imageView.alpha = 0.0f;
            [self.activityIndicatorView startAnimating];
            self.activityIndicatorView.alpha = 1.0f;
            break;
        }
            
        case SSPullToRefreshViewStateNormal: {
            [self.activityIndicatorView stopAnimating];
            self.activityIndicatorView.alpha = 0.0f;
            break;
        }
            
        case SSPullToRefreshViewStateLoading: {
            self.imageView.alpha = 0.0f;
            [self.activityIndicatorView startAnimating];
            self.activityIndicatorView.alpha = 1.0f;
            break;
        }
            
        case SSPullToRefreshViewStateClosing: {
            self.imageView.alpha = 0.0f;
            self.activityIndicatorView.alpha = 0.0f;
            break;
        }
    }
}

- (void)setPullProgress:(CGFloat)pullProgress {
    if (pullProgress < 1.0f && !self.activityIndicatorView.isAnimating ) {
        self.imageView.alpha = pullProgress*pullProgress;
    } else {
        self.imageView.alpha = 0.0f;
    }
}

@end
