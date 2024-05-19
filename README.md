<img src="https://github.com/Kaio20/GoSing/assets/38571176/6e051569-7f34-41cd-9194-c5aa7472c1cc" width="300" height="300">

A experiment to make a Karaoke game in godot 4. 
It is **no longer actively** maintained because of two very high obstacles:
1. Multiple Microphones are currently not possible in godot see there: [Allow using multiple audio input devices at once · Issue #2915 · godotengine/godot-proposals · GitHub](https://github.com/godotengine/godot-proposals/issues/2915)
2. And every downloaded video needs to be converted to [OGG Theora because thats the only supported format](https://docs.godotengine.org/en/stable/tutorials/animation/playing_videos.html) but there is a proposal to [move video playback out of core and into an officially supported GDExtension · Issue #3286 · godotengine/godot-proposals · GitHub](https://github.com/godotengine/godot-proposals/issues/3286)


## Features
- [x]  Playing the latest video
- [x]  Converting videos to be played
- [x]  Changing the mic Input for the first player
- [x]  Starting, Stopping and volume change of the video
- [ ]  Downloading playlists of videos. _(yet to be implemented)_
- [ ]  Working keyboard for search you see on the right  _(yet to be implemented)_
- [ ]  Searching YouTube videos. _(yet to be implemented)_
- [ ] failproof ffmpeg implementation _(yet to be implemented)_

> A screenshot of the latest working version:
![A Screenshot](https://github.com/Kaio20/GoSing/assets/38571176/63721009-da3a-4404-a202-73f562f01206)

# How it roughly works
It is an graphical Implantation of this fork  [GitHub - JanWerder/godot-yt-dlp: An implementation of yt-dlp for Godot 4.x](https://github.com/JanWerder/godot-yt-dlp) that adds a more updated version of this tutorial [How to use the microphone in Godot 3 by The Shaggy Dev](https://www.youtube.com/watch?v=gS3IuLqmgx4) and some more controls for the Video Player. 


## Installation
### Godot Project
download the files and open it in the godot game engine
> if it does not work then try this manually: there will be a folder C:\Users\Username\AppData\Roaming\Godot\app_userdata\Go Sing where there should be a ffmpeg.exe and. If there is not please download the latest version from a trusted source like this [Releases · BtbN/FFmpeg-Builds](https://github.com/BtbN/FFmpeg-Builds/releases) and then it should work


### Godot Game
# The Future
As I stated earlier the hassle is not worth the payoff for this little hobby project. I mostly shows what the godot engine in its current form of 4.2.2 is capable of.

## Further reading
Karaoke is a great reason to sing and not feel ashamed. Go try it but maybe with a diffrent tool. Go Sing was only meant as a casual way to que up songs. If you are intressted in a more competitive hitting the notes look into [Welcome! | Open Music Games](https://www.open-music-games.org/)
