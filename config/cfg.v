config cfg;
	design tblib.top;
	default liblist dutlib veriflib tblib;
	instance top.core use dutlib.core;
endconfig
