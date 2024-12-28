# demo_app
A new Flutter project.

## Widgets Module

### Creating a Stateless Widget with Images and Text
create a Stateless Widget in Flutter that displays two images and customized text.

- Title: create a stateless widget
- Description: 
    - Display a title at the top of the page: "My First Project" using appBar
    
    - Ensure there is a gap between the images and the text.
    
    - Ensure that the 2 images and the text are placed in the center of the page.
    
    - Add two images from {asset files, internet}
        - Place the images in the same row with a gap between them
    
    - Below the images, display a text: "The two images are displayed" 
        - Customize the text by changing: Font size and font family to Suwannaphum-Regular, Text color ,Make it bold.

==============================================================================
## Draft
- create `MyApp` Stateless Widget as base screen
- update `pubspec.yaml` to add image and font that defined
- create `image-container` widget that uses to contain images
- create home screen `stateless-widget` that contain
    - use `image-container` to display {`asset-image`, `internet-image`}
    - use `app-bar widget` to create text at the top of the screen
    - customize the the text using `text-style widget`