#!/bin/bash
cd ..
echo Making the haxelib and setuping folder in same time...
haxelib newrepo
echo Installing dependencies...
echo This might take a few moments depending on your internet speed.
haxelib install hscript 2.5.0
haxelib git lime https://github.com/mcagabe19-stuff/lime.git
haxelib install openfl 9.2.1
haxelib install flixel 5.2.2
haxelib install flixel-addons 3.0.2
haxelib install flixel-ui 2.5.0
haxelib install flixel-tools 1.5.1
haxelib install tjson 1.4.0
haxelib git hxcpp https://github.com/mcagabe19-stuff/hxcpp.git
haxelib git hxCodec https://github.com/Prohack101010/hxCodec-2.6.0-with-MP4Handler #I love my hxCodec because it's using MP4Handler
haxelib git flxanimate https://github.com/Psych-Slice/FlxAnimate.git 18091dfeb629ba2805a5f3e10f5de80433080359
haxelib git linc_luajit https://github.com/MobilePorting/linc_luajit-0.6.3
haxelib git hxdiscord_rpc https://github.com/MAJigsaw77/hxdiscord_rpc f9353b9edce10f4605d125dd1bda24ac36898bfb
haxelib git FlxPartialSound https://github.com/FunkinDroidTeam/FlxPartialSound 3c9f63e3501c20c0b60442089dc05306f5a87968
haxelib git funkin.vis https://github.com/FunkinCrew/funkVis 22b1ce089dd924f15cdc4632397ef3504d464e90
haxelib git grig.audio https://gitlab.com/haxe-grig/grig.audio.git cbf91e2180fd2e374924fe74844086aab7891666
haxelib git extension-androidtools https://github.com/MAJigsaw77/extension-androidtools.git
echo Finished!
