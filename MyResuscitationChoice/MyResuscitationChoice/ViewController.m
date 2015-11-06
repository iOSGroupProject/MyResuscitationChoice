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
- (IBAction)saveMovieButton:(id)sender {
    if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(self.moviePath)) {
     
        UISaveVideoAtPathToSavedPhotosAlbum(self.moviePath, self, nil, nil);
    }
}
#pragma mark - Save video callbacks


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:YES completion:^{

        
        NSURL *movieURL = info[UIImagePickerControllerMediaURL];
        self.moviePath = [movieURL path];
    }];
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
    
    cameraUI.delegate = delegate;
    [controller presentViewController:cameraUI animated:YES completion:nil];
    return YES;
}



@end
