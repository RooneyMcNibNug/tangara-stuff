# tangara-stuff
Various items to manage the Tangara portable music player



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

```
$ ./list_w_no_albumartist_data.sh
./Music/04 - Outside El Paso.flac
./Music/The Armed - Ft. Frank Turner (2019)/The Armed - FT. FRANK TURNER.flac
Time to fix this metadata for the files above.
```

```
$ cd Music/The\ Armed\ -\ Ft.\ Frank\ Turner\ \(2019\)/
$ for file in *.flac; metaflac --set-tag=ALBUMARTIST="The Armed" $file; end # THIS IS USING FISH SHELL, YMMV FOR BASH
```

```
for file in *.flac; metaflac --list $file | grep ALBUMARTIST; end
    comment[5]: ALBUMARTIST=The Armed
```
