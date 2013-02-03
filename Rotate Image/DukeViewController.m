//
//  DukeViewController.m
//  Rotate Image
//
//  Created by Donghe on 2/2/13.
//  Copyright (c) 2013 Data and GIS Lab. All rights reserved.
//

#import "DukeViewController.h"

@interface DukeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DukeViewController
@synthesize imageView = _imageView;
@synthesize scrollView = _scrollView;
@synthesize slider = _slider;

-(void)rotateImage:(CGFloat)angel
{
    CGAffineTransform rotation = CGAffineTransformMakeRotation(angel);
    self.imageView.transform = rotation;

}

- (IBAction)sliderChanged:(UISlider *)sender
{
    CGFloat angel = (sender.value - 0.5) / 0.5 * M_PI;
    [self rotateImage:angel];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"chapel.jpg"];
    [self.imageView setImage:image];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    CGAffineTransform transform = self.imageView.transform;
//    self.imageView.transform = CGAffineTransformRotate(CGAffineTransformScale(transform, 1, 1), M_PI * 2);
        
//    self.scrollView.delegate = self;
//    self.scrollView.contentSize = self.imageView.image.size;
//    self.scrollView.center = self.imageView.center;
//    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    
//    self.scrollView.minimumZoomScale = 0.2;
//    self.scrollView.maximumZoomScale = 5;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [self setScrollView:nil];
    [self setSlider:nil];
    [super viewDidUnload];
}
@end
