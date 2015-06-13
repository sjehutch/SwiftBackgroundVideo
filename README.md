# SwiftBackgroundVideo by lucasjgordon
Add background videos to your iOS project.

Created by [lucasjgordon](http://www.lucasjgordon.com)

## Basic Usage
Add Video.swift to your project, along with any video files that you want to use.

Use the following code in the relevant view controller to display a background video. Pass a reference to the current view, along with the name of the video file.

````swift
Video.add(self.view, name: "movie.mov")
````

You can also use the optional overlay parameter, which adds a layer above the video with the alpha set at the specified value.

````swift
Video.add(self.view, name: "movie.mov", overlay: 0.5)
````