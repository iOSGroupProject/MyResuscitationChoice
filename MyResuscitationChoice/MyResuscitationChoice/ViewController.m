//
//  ViewController.m
//  MyResuscitationChoice
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//ahmed

#import "ViewController.h"

@interface ViewController ()

@property UIImagePickerController * Ahmed;
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
- (IBAction)record:(id)sender {
    
        [self startCameraControllerFromViewController:self usingDelegate:self];
        [self viewWillAppear:NO];

    
    
}
- (IBAction)save:(id)sender {
    if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(self.moviePath)) {
     
        UISaveVideoAtPathToSavedPhotosAlbum(self.moviePath, self, nil, nil);
        
    }
}
- (IBAction)play:(id)sender {
    
    
    
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
    
 
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];

    
    
    cameraUI.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
    
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    cameraUI.videoQuality = UIImagePickerControllerQualityTypeMedium;
    [self scribt];
    cameraUI.cameraOverlayView=_ahmed1;
    cameraUI.delegate = delegate;
    
    [controller presentViewController:cameraUI animated:YES completion:nil];
    
    
    return YES;
}


- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
   
}

-(NSString *)scribt{
    
    return self.ahmed1.text = @"hello this is me , Ahmed Alanazi  will try make this work.I will keep work on it";

    
}
#pragma mark - MPMoviePlayerController notification callbacks
 - (void)viewWillAppear:(BOOL)animated
 {
	[super viewWillAppear:animated];
 
	//Add sub view
//	ViewController *vc1 = [[ViewController alloc] init];
	[self.view addSubview:_ahmed1];
    
     _ahmed1.frame = CGRectMake(100, 100, 320, 160);   //Set the sub view position within this main view
 }


@end
