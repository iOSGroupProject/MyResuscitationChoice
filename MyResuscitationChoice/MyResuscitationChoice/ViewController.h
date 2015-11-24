//
//  ViewController.h
//  MyResuscitationChoice
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVKit/AVKit.h>



@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ahmed1;
// For recording feature
@property (nonatomic,strong) MPMoviePlayerController * moviePlayer;
@property (nonatomic,strong) NSString * moviePath;
// For Collections
@property (weak, nonatomic) IBOutlet UIWebView *video;
@property (weak, nonatomic) IBOutlet UIWebView *video2;
@property (weak, nonatomic) IBOutlet UIWebView *video3;
@property (weak, nonatomic) IBOutlet UIWebView *video4;
@property (weak, nonatomic) IBOutlet UIWebView *video5;
- (IBAction)Play:(id)sender;
- (IBAction)play2:(id)sender;
- (IBAction)Play3:(id)sender;
- (IBAction)Play4:(id)sender;
- (IBAction)Play5:(id)sender;


@end

