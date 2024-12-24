/*
 * Copyright (C) 2024 Mobile Porting Team
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

package mobile.options;

import mobile.backend.MobileScaleMode;
import flixel.input.keyboard.FlxKey;
import options.BaseOptionsMenu;
import options.Option;

class MobileOptionsSubState extends BaseOptionsMenu
{
	#if android
	var storageTypes:Array<String> = ["EXTERNAL_DATA", "EXTERNAL_OBB", "EXTERNAL_MEDIA", "EXTERNAL"];
	var externalPaths:Array<String> = StorageUtil.checkExternalPaths(true);
	public static final lastStorageType:String = ClientPrefs.storageType;
	#end
	var option:Option;

	public function new()
	{
		#if android if (!externalPaths.contains('\n'))
			storageTypes = storageTypes.concat(externalPaths); #end
		title = 'Mobile Options';
		rpcTitle = 'Mobile Options Menu'; // for Discord Rich Presence, fuck it

		#if mobile
		var option:Option = new Option('VirtualPad Alpha:', //mariomaster was here again
			'Changes VirtualPad Alpha -cool feature',
			'VirtualPadAlpha',
			'float',
			#if mobile 0.75 #else 0 #end);
		option.scrollSpeed = 1.6;
		option.minValue = 0;
		option.maxValue = 1;
		option.changeValue = 0.01;
		option.decimals = 2;
		addOption(option);
        option.onChange = onChangePadAlpha;
		super();
		
    	var option:Option = new Option('Extra Controls',
    		"Allow Extra Controls",
    		'extraKeys',
    		'float',
    		2);
    	option.scrollSpeed = 1.6;
    	option.minValue = 0;
    	option.maxValue = 4;
    	option.changeValue = 1;
    	option.decimals = 1;
    	addOption(option);
    		
    	var option:Option = new Option('Extra Control Location:',
    		"Choose Extra Control Location",
    		'hitboxLocation',
    		'string',
    		'Bottom',
    		['Bottom', 'Top']);
    	addOption(option);
    		  
    	var option:Option = new Option('Hitbox Mode:',
    		"Choose your Hitbox Style!  -mariomaster",
    		'hitboxmode',
    		'string',
    		'New',
    		['Classic', 'New']);
    	addOption(option);
    		  
    	var option:Option = new Option('Hitbox Design:',
    		"Choose how your hitbox should look like.",
    		'hitboxtype',
    		'string',
    		'Gradient',
    		['Gradient', 'No Gradient' , 'No Gradient (Old)']);
    	addOption(option);
    
    	var option:Option = new Option('Hitbox Hint',
    		'Hitbox Hint -I hate this',
    		'hitboxhint',
    		'bool',
    		false);
    	addOption(option);
    		
    	var option:Option = new Option('Hitbox Opacity', //mariomaster was here again
    		'Changes hitbox opacity -omg',
    		'hitboxalpha',
    		'float',
    		0.7);
    	option.scrollSpeed = 1.6;
    	option.minValue = 0.0;
    	option.maxValue = 1;
    	option.changeValue = 0.1;
    	option.decimals = 1;
    	addOption(option);
		
		option = new Option('Allow Phone Screensaver',
			'If checked, the phone will sleep after going inactive for few seconds.\n(The time depends on your phone\'s options)', 'screensaver', 'bool', false);
		option.onChange = () -> lime.system.System.allowScreenTimeout = curOption.getValue();
		addOption(option);

		option = new Option('Wide Screen Mode',
			'If checked, The game will stetch to fill your whole screen. (WARNING: Can result in bad visuals & break some mods that resizes the game/cameras)',
			'wideScreen', 'bool', false);
		option.onChange = () -> FlxG.scaleMode = new MobileScaleMode();
		addOption(option);
		#end

		#if android
		option = new Option('Storage Type', 'Which folder Psych Engine should use?\n(CHANGING THIS MAKES DELETE YOUR OLD FOLDER!!)', 'storageType', 'string',
			'EXTERNAL_DATA', storageTypes);
		addOption(option);
		#end

		super();
	}

	#if android
	function onStorageChange():Void
	{
		File.saveContent(lime.system.System.applicationStorageDirectory + 'storagetype.txt', ClientPrefs.storageType);

		var lastStoragePath:String = StorageType.fromStrForce(lastStorageType) + '/';

		try
		{
		    if (lastStorageType != "EXTERNAL")
			    Sys.command('rm', ['-rf', lastStoragePath]);
		}
		catch (e:haxe.Exception)
			trace('Failed to remove last directory. (${e.message})');
	}
	#end

	override public function destroy()
	{
		super.destroy();
		#if android
		if (ClientPrefs.storageType != lastStorageType)
		{
			onStorageChange();
			CoolUtil.showPopUp('Storage Type has been changed and you needed restart the game!!\nPress OK to close the game.', 'Notice!');
			lime.system.System.exit(0);
		}
		#end
	}
}
