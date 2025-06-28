# tangara-stuff

I have some scripts saved on the root directory of the SD card. This is basically the flow I use to organize, sanatize, and load music on there.

1. For new music I add on local machine, I check the metadata using [beets](https://beets.readthedocs.io/en/stable/) to pull down proper titles and such:
```
beet import -C ~/Music
```

2. When that's done, I move the music over to the SD from my Tangara.
   
3. After the files are transferred over, I pop open a terminal to the main drive where I have [`cleanup.sh`](https://github.com/RooneyMcNibNug/tangara-stuff/blob/main/cleanup.sh) saved - I run this to remove anything in the directories that _isn't_ compatible audio files, in order to both save space and because I've found that the database indexing (see later) chokes over certain non-audio files and crashes:

```
/run/media/user/{USB}/
$ ./cleanup.sh 
Deleting: ./Music/mulatu astatke- new york - addis - london - the story of ethio jazz 1965-1975/cover.jpeg
Deleting: ./Music/mulatu astatke- new york - addis - london - the story of ethio jazz 1965-1975/cover.jpg
Deleting: ./Music/mulatu astatke- new york - addis - london - the story of ethio jazz 1965-1975/New York - Addis - London - The Story Of Ethio Jazz 1965-1975.log
Deleting: ./Music/mulatu astatke- new york - addis - london - the story of ethio jazz 1965-1975/New York - Addis - London - The Story Of Ethio Jazz 1965-1975.cue
Deleting: ./Music/teen mortgage - devil ultrasonic dream (2025)/cover.jpg
Cleanup is complete - enjoy your tunes!
```

4. After cleanup, its time to find `.flac` files that have empty `ALBUMARTIST` values, since the index relies on that to find and sort music properly and I consider it one of the more important peices of Metadata. I use the [`list_w_no_albumartist_data.sh`](https://github.com/RooneyMcNibNug/tangara-stuff/blob/main/list_w_no_albumartist_data.sh) script from the same root directory on the SD:

```
$ ./list_w_no_albumartist_data.sh
./Music/04 - Outside El Paso.flac
./Music/The Armed - Ft. Frank Turner (2019)/The Armed - FT. FRANK TURNER.flac
Time to fix this metadata for the files above.
```

5. Based on the output, I'll change to the relevant directories (assuming they are an album with all the same artists' tracks) and run the following oneliner with the respective value that I want (yes, I know that I can probably automate this better, but I have other things to get on with and this is not a frequent enough issue for me luckily):

```
$ cd Music/The\ Armed\ -\ Ft.\ Frank\ Turner\ \(2019\)/
$ for file in *.flac; metaflac --set-tag=ALBUMARTIST="The Armed" $file; end # THIS IS USING FISH SHELL, YMMV FOR BASH
```

6. Check the changed data:

```
for file in *.flac; metaflac --list $file | grep ALBUMARTIST; end
    comment[5]: ALBUMARTIST=The Armed
```

7. Insert the SD back into the Tangara and **Gear Icon > Database > Update now**

8. Enjoy

_________

Notes/Reccomendations:

- I have "Auto Update" toggled OFF for Database indexing, because I have a large library and noticed some stuttering during playback when indexing would happen to kick off with that on.
