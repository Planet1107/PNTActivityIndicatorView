//
//  PNTActivityIndicator.h
//
//  Copyright 2013 Planet1107.
//

#import "PNTActivityIndicator.h"
#import "MBProgressHUD.h"

@implementation PNTActivityIndicator

@synthesize spinDurationTime;

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame]))
		return nil;
	
	UIImageView *spinImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
	spinImage.image = [UIImage imageNamed:@"custom-activity"];
	[self addSubview:spinImage];
    
    spinDurationTime = kDefaultSpinDurationTime;
    
    // Initialy hide activity indicator
    self.alpha = 0.0f;
    
    return self;
}

- (void)startAnimating
{
    // Show activity indicator
    self.alpha = 1.0f;
    
    // Define rotation animation
	CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];	
	spinAnimation.duration = spinDurationTime;
	spinAnimation.autoreverses = NO;
	spinAnimation.removedOnCompletion = NO;
	spinAnimation.fromValue = [NSNumber numberWithFloat:0];
	spinAnimation.toValue = [NSNumber numberWithFloat:-2*M_PI];
	spinAnimation.fillMode = kCAFillModeForwards;
	spinAnimation.repeatCount = HUGE_VALF;
	
    // Add animation
	[self.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}

- (void)stopAnimating
{
    // Show activity indicator
    self.alpha = 0.0f;
    
    // Remove animaton
	[self.layer removeAllAnimations];
}

+ (MBProgressHUD *)customActivityHUD {
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    hud.mode = MBProgressHUDModeCustomView;
    PNTActivityIndicator *activityIndicator = [[PNTActivityIndicator alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 37.0f, 37.0f)];
    hud.customView = activityIndicator;
    [activityIndicator startAnimating];
    return hud;
}

@end
