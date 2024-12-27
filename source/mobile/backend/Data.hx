package mobile.backend;

import haxe.ds.StringMap;

class Data
{
	public static var dpadMode:Map<String, FlxDPadMode>;
	public static var actionMode:Map<String, FlxActionMode>;

	public static function setup()
	{
		// FlxDPadModes
		dpadMode = new Map<String, FlxDPadMode>();
		dpadMode.set("UP_DOWN", UP_DOWN);
		dpadMode.set("LEFT_RIGHT", LEFT_RIGHT);
		dpadMode.set("UP_LEFT_RIGHT", UP_LEFT_RIGHT);
		dpadMode.set("LEFT_FULL", FULL); //1.0 Support
		dpadMode.set("FULL", FULL);
		dpadMode.set("RIGHT_FULL", RIGHT_FULL);
		dpadMode.set("DUO", DUO);
		dpadMode.set("NONE", NONE);
			
		actionMode = new Map<String, FlxActionMode>();
		actionMode.set('E', E);
		actionMode.set('A', A);
		actionMode.set('B', B);
		actionMode.set('D', D);
		actionMode.set('P', P);
		actionMode.set('X_Y', X_Y);
		actionMode.set('A_B', A_B);
		actionMode.set('A_C', A_C);
		actionMode.set('A_B_C', A_B_C);
		actionMode.set('A_B_E', A_B_E);
		actionMode.set('A_B_E_C_M', A_B_E_C_M);
		actionMode.set('A_B_X_Y', A_B_X_Y);
		actionMode.set('A_X_Y', A_X_Y);
		actionMode.set('B_X_Y', B_X_Y);
		actionMode.set('A_B_C_X_Y', A_B_C_X_Y);
		actionMode.set('A_B_C_X_Y_Z', A_B_C_X_Y_Z);
		actionMode.set('NONE', NONE);
	}
}


enum FlxDPadMode {
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	FULL;
	ALL;
	OptionsC;
	RIGHT_FULL;
	DUO;
	PAUSE;
	DIALOGUE_PORTRAIT;
	MENU_CHARACTER;
	NONE;
}

enum FlxActionMode {
    E;
	A;
	B;
	D;
	P;
	X_Y;
	A_B;
	A_C;
	A_B_C;
	A_B_E;
	A_B_F;
	A_B_E_C_M;
	A_B_X_Y;	
	A_X_Y;	
	B_X_Y;	
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	FULL;
	OptionsC;
	ALL;
	MENU_CHARACTER;
	DIALOGUE_PORTRAIT;
	CHARACTER_EDITOR;
	CHART_EDITOR;
	controlExtend;
	B_E;
	NONE;
}