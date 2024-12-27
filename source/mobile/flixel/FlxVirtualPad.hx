package mobile.flixel;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import openfl.display.BitmapData;
import openfl.utils.Assets;

// Lua VirtualPad
import haxe.ds.StringMap;

class FlxVirtualPad extends FlxSpriteGroup {
	//Actions
	public var buttonA:FlxButton = new FlxButton(0, 0);
	public var buttonB:FlxButton = new FlxButton(0, 0);
	public var buttonC:FlxButton = new FlxButton(0, 0);
	public var buttonD:FlxButton = new FlxButton(0, 0);
	public var buttonE:FlxButton = new FlxButton(0, 0);
	public var buttonM:FlxButton = new FlxButton(0, 0);
	public var buttonP:FlxButton = new FlxButton(0, 0);
	public var buttonV:FlxButton = new FlxButton(0, 0);
	public var buttonX:FlxButton = new FlxButton(0, 0);
	public var buttonY:FlxButton = new FlxButton(0, 0);
	public var buttonZ:FlxButton = new FlxButton(0, 0);
	public var buttonF:FlxButton = new FlxButton(0, 0);
	public var buttonG:FlxButton = new FlxButton(0, 0);
	
	//Extra
    public var buttonExtra1:FlxButton = new FlxButton(0, 0);
	public var buttonExtra2:FlxButton = new FlxButton(0, 0);
	public var buttonExtra3:FlxButton = new FlxButton(0, 0);
	public var buttonExtra4:FlxButton = new FlxButton(0, 0);
    
	//DPad
	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);

	//PAD DUO MODE
	public var buttonLeft2:FlxButton = new FlxButton(0, 0);
	public var buttonUp2:FlxButton = new FlxButton(0, 0);
	public var buttonRight2:FlxButton = new FlxButton(0, 0);
	public var buttonDown2:FlxButton = new FlxButton(0, 0);
    
    public var buttonCELeft:FlxButton = new FlxButton(0, 0);
	public var buttonCEUp:FlxButton = new FlxButton(0, 0);
	public var buttonCERight:FlxButton = new FlxButton(0, 0);
	public var buttonCEDown:FlxButton = new FlxButton(0, 0);
	public var buttonCEG:FlxButton = new FlxButton(0, 0);
	
	public var buttonCEUp_M:FlxButton = new FlxButton(0, 0);
	public var buttonCEDown_M:FlxButton = new FlxButton(0, 0);
	
	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;
	public var buttonsString:Map<String, FlxButton>;

	public var orgAntialiasing:Bool = true;
	
	/**
	 * Create a gamepad.
	 *
	 * @param   DPadMode     The D-Pad mode. `LEFT_FULL` for example.
	 * @param   ActionMode   The action buttons mode. `A_B_C` for example.
	 */

	public function new(DPad:FlxDPadMode, Action:FlxActionMode) {
		super();

		dPad = new FlxSpriteGroup();
		dPad.scrollFactor.set();

		actions = new FlxSpriteGroup();
		actions.scrollFactor.set();
		
		// DPad Buttons
    	buttonsString = new Map<String, FlxButton>();
    	buttonsString.set("buttonLeft", buttonLeft);
    	buttonsString.set("buttonUp", buttonUp);
    	buttonsString.set("buttonRight", buttonRight);
    	buttonsString.set("buttonDown", buttonDown);
    		
    	// Actions buttons
    	buttonsString.set("buttonA", buttonA);
    	buttonsString.set("buttonB", buttonB);
    	buttonsString.set("buttonC", buttonC);
    	buttonsString.set("buttonD", buttonD);
    	buttonsString.set("buttonE", buttonE);
    	buttonsString.set("buttonM", buttonM);
    	buttonsString.set("buttonP", buttonP);
    	buttonsString.set("buttonV", buttonV);
    	buttonsString.set("buttonX", buttonX);
    	buttonsString.set("buttonY", buttonY);
    	buttonsString.set("buttonZ", buttonZ);
    	buttonsString.set("buttonF", buttonF);
    	buttonsString.set("buttonG", buttonG);
    		
    	//PAD DUO MODE
    	buttonsString.set("buttonLeft2", buttonLeft2);
    	buttonsString.set("buttonUp2", buttonUp2);
    	buttonsString.set("buttonRight2", buttonRight2);
    	buttonsString.set("buttonDown2", buttonDown2);
    		
    	/* not needed
    	//Extras
    	buttonsString.set("buttonExtra1", buttonExtra1);
    	buttonsString.set("buttonExtra2", buttonExtra2);
    	buttonsString.set("buttonExtra3", buttonExtra3);
    	buttonsString.set("buttonExtra4", buttonExtra4);
    	
    	buttonsString.set("buttonCELeft", buttonCELeft);
    	buttonsString.set("buttonCEUp", buttonCEUp);
    	buttonsString.set("buttonCERight", buttonCERight);
    	buttonsString.set("buttonCEDown", buttonCEDown);
    	buttonsString.set("buttonCEG", buttonCEG);
    		
    	buttonsString.set("buttonCEUp_M", buttonCEUp_M);
    	buttonsString.set("buttonCEDown_M", buttonCEDown_M);
    	*/
		
		switch (DPad){
			case UP_DOWN:
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF)));
			case LEFT_RIGHT:
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case UP_LEFT_RIGHT:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 81 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case FULL:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, "down", 0x00FFFF)));
			case ALL:
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createButton(42 * 3, FlxG.height - 85 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case OptionsC:
			    add(buttonUp = createButton(0, FlxG.height - 85 * 3, "up", 0x00FF00));
				add(buttonDown = createButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF));	
			case RIGHT_FULL:
				dPad.add(add(buttonUp = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, "down", 0x00FFFF)));
			case DUO:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				dPad.add(add(buttonUp2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonLeft2 = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, "right", 0xFF0000)));
				dPad.add(add(buttonDown2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, "down", 0x00FFFF)));
			case PAUSE:	
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createButton(42 * 3, FlxG.height - 45 * 3, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(84 * 3, FlxG.height - 45 * 3, "right", 0xFF0000)));
			case DIALOGUE_PORTRAIT:
				dPad.add(add(buttonUp = createButton(105, FlxG.height - 356, 'up', 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 246, 'left', 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(207, FlxG.height - 246, 'right', 0xFF0000)));
				dPad.add(add(buttonDown = createButton(105, FlxG.height - 131, 'down', 0x00FFFF)));
				dPad.add(add(buttonUp2 = createButton(105, 0, 'up', 0xFF12FA05)));
				dPad.add(add(buttonLeft2 = createButton(0, 102, 'left', 0xFFC24B99)));
				dPad.add(add(buttonRight2 = createButton(207, 102, 'right', 0xFFF9393F)));
				dPad.add(add(buttonDown2 = createButton(105, 210, 'down', 0xFF00FFFF)));
			case MENU_CHARACTER:
				dPad.add(add(buttonUp = createButton(105, 0, 'up', 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, 102, 'left', 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(207, 102, 'right', 0xFF0000)));
				dPad.add(add(buttonDown = createButton(105, 210, 'down', 0x00FFFF)));
			case NONE:
		}

		switch (Action){
		    case E:
				actions.add(add(buttonE = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, "modding", 0xFF7D00, false)));
			case A:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case B:
				actions.add(add(buttonB = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case D:
				actions.add(add(buttonD = createButton(FlxG.width - 44 * 3, FlxG.height - 127 * 3, "d", 0x0078FF)));
			case P:
				actions.add(add(buttonP = createButton(FlxG.width - 132, 0, 'x', 0x99062D)));
		    case X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "x", 0x99062D)));
			case A_B:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case A_C:
				actions.add(add(buttonC = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_C:
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_E:
				actions.add(add(buttonE = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "e", 0xFF7D00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_F:
				actions.add(add(buttonF = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "f", 0xFF7D00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_E_C_M:
			    actions.add(add(buttonM = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "m", 0xFFCB00)));
				actions.add(add(buttonE = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "e", 0xFF7D00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			    actions.add(add(buttonC = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, "c", 0x44FF00)));
 			case A_B_X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "x", 0x99062D)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
		    case A_X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "x", 0x99062D)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case B_X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "x", 0x99062D)));
				actions.add(add(buttonB = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case A_B_C_X_Y:		
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case A_B_C_X_Y_Z:
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "z", 0xCCB98E)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
			case FULL:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, "v", 0x49A9B2)));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "z", 0xCCB98E)));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, "d", 0x0078FF)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
		    case OptionsC:
			    add(buttonLeft = createButton(FlxG.width - 258, FlxG.height - 85 * 3, "left", 0xFF00FF));
				add(buttonRight = createButton(FlxG.width - 132, FlxG.height - 85 * 3, "right", 0xFF0000));
			    add(buttonC = createButton(FlxG.width - 384, FlxG.height - 135, 'c', 0x44FF00));
			    add(buttonB = createButton(FlxG.width - 258, FlxG.height - 135, 'b', 0xFFCB00));
				add(buttonA = createButton(FlxG.width - 132, FlxG.height - 135, 'a', 0xFF0000));
			case ALL:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, "v", 0x49A9B2)));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, "d", 0x0078FF)));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "z", 0xCCB98E)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
				
				dPad.add(add(buttonCEUp = createButton(FlxG.width - (44 + 42 * 4) * 3, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonCEDown = createButton(FlxG.width - (44 + 42 * 4) * 3, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				dPad.add(add(buttonCEG = createButton(FlxG.width - (44 + 42 * 1) * 3, 25, "g", 0x00FF00)));
			
			case MENU_CHARACTER:
				actions.add(add(buttonC = createButton(FlxG.width - 392, 4, 'c', 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 262, 4, 'b', 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 132, 4, 'a', 0xFF0000)));	
			case DIALOGUE_PORTRAIT:
				actions.add(add(buttonX = createButton(FlxG.width - 392, 4, 'x', 0x99062D)));
				actions.add(add(buttonC = createButton(FlxG.width - 392, 129, 'c', 0x44FF00)));
				actions.add(add(buttonY = createButton(FlxG.width - 262, 4, 'y', 0x4A35B9)));
				actions.add(add(buttonB = createButton(FlxG.width - 262, 129, 'b', 0xFFCB00)));
				actions.add(add(buttonZ = createButton(FlxG.width - 132, 4, 'z', 0xCCB98E)));
				actions.add(add(buttonA = createButton(FlxG.width - 132, 129, 'a', 0xFF0000)));
			case CHARACTER_EDITOR:
				actions.add(add(buttonV = createButton(FlxG.width - 522, FlxG.height - 251, 'v', 0x49A9B2)));
				actions.add(add(buttonD = createButton(FlxG.width - 522, FlxG.height - 131, 'd', 0x0078FF)));
				actions.add(add(buttonX = createButton(FlxG.width - 392, FlxG.height - 251, 'x', 0x99062D)));
				actions.add(add(buttonC = createButton(FlxG.width - 392, FlxG.height - 131, 'c', 0x44FF00)));
				actions.add(add(buttonG = createButton(FlxG.width - 653, FlxG.height - 131, 'g', 0x3D3722)));
				actions.add(add(buttonY = createButton(FlxG.width - 262, FlxG.height - 251, 'y', 0x4A35B9)));
				actions.add(add(buttonB = createButton(FlxG.width - 262, FlxG.height - 131, 'b', 0xFFCB00)));
				actions.add(add(buttonZ = createButton(FlxG.width - 132, FlxG.height - 251, 'z', 0xCCB98E)));
				actions.add(add(buttonA = createButton(FlxG.width - 132, FlxG.height - 131, 'a', 0xFF0000)));
			case CHART_EDITOR:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, "v", 0x49A9B2)));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, "d", 0x0078FF)));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, "x", 0x99062D)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, "c", 0x44FF00)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, "y", 0x4A35B9)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, "z", 0xCCB98E)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "a", 0xFF0000)));
				
				dPad.add(add(buttonG = createButton(FlxG.width - (44 + 42 * 1) * 3, 25, "g", 0x00FF00)));
				dPad.add(add(buttonF = createButton(FlxG.width - (86 + 42 * 1) * 3, 25, "f", 0x00FF00)));
				dPad.add(add(buttonCEUp = createButton(FlxG.width - (44 + 42 * 4) * 3, FlxG.height - 85 * 3, "up", 0x00FF00)));
				dPad.add(add(buttonCEDown = createButton(FlxG.width - (44 + 42 * 4) * 3, FlxG.height - 45 * 3, "down", 0x00FFFF)));
				
			case controlExtend:
			    if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 1) actions.add(add(buttonExtra1 = createButton(FlxG.width * 0.5 - 44 * 3, FlxG.height * 0.5 - 127 * 0.5, "f", 0xFF0000)));
				if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 2) actions.add(add(buttonExtra2 = createButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, "g", 0xFFFF00)));
				if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 3) actions.add(add(buttonExtra3 = createButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, "x", 0x99062D)));
				if (Type.getClass(FlxG.state) != PlayState || Type.getClass(FlxG.state) == PlayState && ClientPrefs.extraKeys >= 4) actions.add(add(buttonExtra4 = createButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, "y", 0x4A35B9)));
			case B_E:
				actions.add(add(buttonE = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, "e", 0xFF7D00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, "b", 0xFFCB00)));
			case NONE:
		}
	}

	public function createButton(x:Float, y:Float, Frames:String, ColorS:Int, ?colored:Bool = true):FlxButton {
	var button = new FlxButton(x, y);
	button.frames = FlxTileFrames.fromFrame(getFrames().getByName(Frames), FlxPoint.get(44 * 3, 127));
	button.resetSizeFromFrame();
	button.solid = false;
	button.immovable = true;
	button.scrollFactor.set();
	button.tag = Frames.toUpperCase();
	if (colored) button.color = ColorS;
	button.antialiasing = ClientPrefs.globalAntialiasing;
	#if FLX_DEBUG
	button.ignoreDrawDebug = true;
	#end
	return button;
	}

	public static function getFrames():FlxAtlasFrames {
	    return Paths.getPackerAtlas('mobilecontrols/virtualpad/original');
	}
	
	override public function destroy():Void
	{
		super.destroy();
		for (field in Reflect.fields(this))
			if (Std.isOfType(Reflect.field(this, field), FlxButton))
				Reflect.setField(this, field, FlxDestroyUtil.destroy(Reflect.field(this, field)));
	}
}