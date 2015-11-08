//
//  ViewController.m
//  MyResuscitationChoice
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//ahmed

#import "ViewController.h"

@interface ViewController ()



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
    
    cameraUI.cameraOverlayView = self.ahmed1;
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:nil];
    
    
    return YES;
}


- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MPMoviePlayerController notification callbacks



@end
