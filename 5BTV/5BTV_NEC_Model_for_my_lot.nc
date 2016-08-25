//  Vertical antenna over local ground

model ( "ground mounted vertical" ) 
{
	element feedSegment ;
	float feedElementHeight, verticalHeight  ;
	float groundConductivity, groundDielectricConst;

	//  basic geometries of the vertical antenna
	feedElementHeight = .05 ;
	verticalHeight = 5 ;
	
	// properties of real earth ground	
	groundConductivity = 0.01;
	groundDielectricConst = 15;
	
	

	//  short segment at the base of the vertical were we feed the antenna
	feedSegment = wire( 0, 0, 0, 0,  0, feedElementHeight, 0.1", 3 ) ;
	voltageFeed( feedSegment, 1, 0 ) ;

	//  the rest of the vertical
	wire( 0, 0, feedElementHeight, 0, 0, verticalHeight, 0.1", 21 ) ;

	//  model antenna over local ground conditions
	// useSommerfeldGround( 1 ) ; 
	ground( groundDielectricConst, groundConductivity );
	// goodGround();
	// poorGround();
	
	//  turn on the NEC-2 ground radials; we need this to feed the vertical against
	//  12 radials 1/4 wavelength long, with #14 AWG wire
	necRadials( verticalHeight / 4, #14, 12 ) ;

	setFrequency( 14.320 );
}