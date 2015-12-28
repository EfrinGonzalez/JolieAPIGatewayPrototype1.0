include "console.iol"
include "time.iol"
include "/Dynamic_Embedding_Counter/counterInterface.iol"
include "/Dynamic_Embedding_Counter/embedderInterface.iol"
include "/Dynamic_Embedding_Counter/clientInterface.iol"
include "/profileC_service/twiceInterface.iol"
include "runtime.iol"
include "authenticator.iol"

outputPort CounterService{
	Interfaces: CounterInterface
}

inputPort CounterEmbedder{
	Location: "socket://localhost:2000"
	Protocol: sodep
	Interfaces: CounterEmbedderInterface, AuthenticatorInterface
}

outputPort CounterClient{
	Protocol: sodep
	Interfaces: CounterClientInterface
}
/*outputPort ProfileC_Adapter {
	Location: "socket://localhost:2003/"
	Protocol: sodep
	Interfaces: TwiceInterface
	}*/
	
execution{ single }

main
{
	embedInfo.type = "Jolie";
	keepRunning = true;
	
	
	while( keepRunning ){	
		keepRunning = true;
			
	
	login(request)(response){
		if(request == 1){
			//Loading profileA services
			embedInfo.filepath = "/profileA_service/ProfileA_Adapter.ol";
			loadEmbeddedService@Runtime( embedInfo )( ProfileA_Adapter.location );
			response = "Profile A services Loaded..."
			
	
		} else if(request == 2){	
			//Loading profileB services
			embedInfo.filepath = "/profileB_service/ProfileB_Adapter.ol";
			loadEmbeddedService@Runtime( embedInfo )( ProfileB_Adapter.location );
			response = "Profile B services Loaded..."
			
	
		
		} else if(request == 3){	
		
			//Loading profileC services	
			embedInfo.filepath = "/profileC_service/ProfileC_Adapter.ol";
			loadEmbeddedService@Runtime( embedInfo )( ProfileC_Adapter.location );
			
			response = "Profile C services Loaded..."
			
		} else{
			keepRunning = false
		}
		
		
	
	}
	
	}
	
	
	
	/*login(request)(response){
	
		if(request == 1){
			//Loading profileA services
			embedInfo.filepath = "/profileA_service/ProfileA_Adapter.ol";
			loadEmbeddedService@Runtime( embedInfo )( ProfileA_Adapter.location );
			response = "Profile A services Loaded...";
			while( keepRunning ){	
				keepRunning = true
			}
	
		} else if(request == 2){	
			//Loading profileB services
			embedInfo.filepath = "/profileB_service/ProfileB_Adapter.ol";
			loadEmbeddedService@Runtime( embedInfo )( ProfileB_Adapter.location );
			response = "Profile B services Loaded...";
			while( keepRunning ){	
				keepRunning = true
			}
	
		
		} else if(request == 3){	
		
			//Loading profileC services	
			embedInfo.filepath = "/profileC_service/ProfileC_Adapter.ol";
			loadEmbeddedService@Runtime( embedInfo )( ProfileC_Adapter.location );
			
			response = "Profile C services Loaded...";
			while( keepRunning ){	
				keepRunning = true
			}
		} else{
			keepRunning = false
		}
		
		
	
	}*/
	
	
}






