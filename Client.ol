// Client.ol works with only one instance because of the hardcoded callback port (4002)

include "console.iol"
include "/Dynamic_Embedding_Counter/embedderInterface.iol"
include "/Dynamic_Embedding_Counter/clientInterface.iol"
include "/profileC_service/twiceInterface.iol"
include "authenticator.iol"

/*interface CounterEmbedderInterface{
	OneWay: startNewCounter( string )
}
*/
/*interface CounterClientInterface{
	OneWay: receiveCount( int )
}*/

inputPort CounterClient{
	Location: "socket://localhost:4002"
	Protocol: sodep
	Interfaces: CounterClientInterface
}

outputPort CounterEmbedder{
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: CounterEmbedderInterface, AuthenticatorInterface
}

outputPort TwiceService {
	Location: "socket://localhost:2004/"
	Protocol: sodep
	Interfaces: TwiceInterface
}

main
{
	 request = args[0];
	 login@CounterEmbedder(request)(response)|
	 println@Console(response)()|
	 twiceJolie@TwiceService( 15 )( response );	
	 println@Console( "Value from jolie: "+response )()
	
	
}