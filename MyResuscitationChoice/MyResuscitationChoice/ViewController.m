//
//  ViewController.m
//  MyResuscitationChoice
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//ahmedalanazi

#import "ViewController.h"

@interface ViewController ()

@property UIImagePickerController * Ahmed;
@property ( nonatomic) NSString * PatientDirectedVideoMessage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)choice:(id)sender
{
    NSString *theChoice = [sender currentTitle];
    if ([theChoice isEqualToString:@"Full code"])
    {
        self.PatientDirectedVideoMessage = @"Full code";
    
    }

}
- (IBAction)record:(id)sender {
        [self startCameraControllerFromViewController:self usingDelegate:self];
//      [self viewWillAppear:YES];
    


    
    
}
- (IBAction)save:(id)sender {
    if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(self.moviePath)) {
     
        UISaveVideoAtPathToSavedPhotosAlbum(self.moviePath, self, nil, nil);
        
    }
}
- (IBAction)play:(id)sender {
    
    
    
}

- (IBAction)Play:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=ccqQ_BRGsAU";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video loadRequest:request];
    
}

- (IBAction)play2:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=AdtsXcZC0_w";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video2 loadRequest:request];
}

- (IBAction)Play3:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=7eabz4V-tvU";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video3 loadRequest:request];
}

- (IBAction)Play4:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=m7dNfre2IWA";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video4 loadRequest:request];
}

- (IBAction)Play5:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=x0O43ugg8zU";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video5 loadRequest:request];
}


#pragma mark - Save video callbacks


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:^{

        
        NSURL *movieURL = info[UIImagePickerControllerMediaURL];
        self.moviePath = [movieURL path];
        
    
        
    }];
}




#pragma mark - Save video callbacks

- (void) video:(NSString *) path didFinishSavingWithError:(NSError *)error contextInfo:(void *) contextInfo {
    if(error) {
    } else {
        
    }
}

#pragma mark - UIImagePickerControllerDelegate methods

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller usingDelegate: (id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>) delegate {
    if (([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] == NO) || (delegate == nil) || (controller == nil))
        return NO;
    
    

    CGRect lablelocation = CGRectMake(0,45, 410,600);
    
    UILabel *lable = [[UILabel alloc]initWithFrame:lablelocation];
//    lable.backgroundColor = [UIColor redColor];
    lable.backgroundColor = [UIColor clearColor];
    
//    lable.lineBreakMode=2;
    lable.numberOfLines = 0;
//    lable.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:lable];
  
    //lable.transform = CGAffineTransformMakeRotation(M_PI/2);
    

    lable.text=  [self scribt];
    [lable sizeToFit];
    
    CGRect Firstlablelocation = CGRectMake(0,0, 410,600);
    
    UILabel *Firstlable = [[UILabel alloc]initWithFrame:Firstlablelocation];
    //    lable.backgroundColor = [UIColor redColor];
    Firstlable.backgroundColor = [UIColor colorWithRed:1.0 green:10.0 blue:1.0 alpha:0.4];
    
    [lable addSubview:Firstlable];



    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];

    
    
    cameraUI.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    cameraUI.videoQuality = UIImagePickerControllerQualityTypeMedium;
    

    cameraUI.cameraOverlayView = lable;
 
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:nil];


    
//    UIView *controllerView = cameraUI.view;
//    
//    controllerView.alpha = 0.0;
//    controllerView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//    
//    [[[[UIApplication sharedApplication] delegate] window] addSubview:controllerView];
//    
//    [UIView animateWithDuration:0.3
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveLinear
//                     animations:^{
//                         controllerView.alpha = 10.0;
//                     }
//                     completion:nil];
    
    
    
    return YES;
}


- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
   
}

-(NSString *)scribt{
    
//    return self.ahmed1.text =  @"hello this is me , Ahmed Alanazi  will try make this work.I will keep work on it";
//    if ([self.PatientDirectedVideoMessage isEqualToString:@"Full code"] ){
    NSString *mys =  @"This is My Resuscitation Safety Message!\nMy initial Resuscitation Status is Full Code!\nMy name is {(Fred Mirarchi & My Date of Birth is February 25, 1970)}\nMy mind is sound as I voluntarily record this video message & the Institute on HealthCare Directives validated it.\nPlease follow all Resuscitation Protocols (ACLS, ATLS, Sepsis and Stroke Resuscitation).\nIf I develop an end stage medical condition, persistent vegetative state or state of advanced dementia, then please see the instructions contained in my advance directive (Located at).\nFor further guidance with respect to treatment or questions regarding any living will documentation please contact my Health Care Agent {(Joe Smith at 555-555-5555)}.";
 
    return  mys;
//    }
    
}
#pragma mark - MPMoviePlayerController notification callbacks
 - ( void)viewWillAppear:(BOOL)animated
 {
	[super viewWillAppear:animated];
    
     

// 
//	//Add sub view
////	ViewController *vc1 = [[ViewController alloc] init];
//     self.ahmed1.adjustsFontSizeToFitWidth=YES;
//     self.ahmed1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
//	[self.view addSubview:self.ahmed1];
//    
//    self.ahmed1.frame = CGRectMake(100, 100, 320, 160);   //Set the sub view position within this main view
 }


@end
