public with sharing class PokeDex_controller {
    public PokeDex_controller() {

    }

    public PokeApi_Parser_cls getPokemonByName(String name){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/'+name.toLowerCase());
        request.setMethod('GET');
        PokeApi_Parser_cls pokeWrapper;
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                
                pokeWrapper = (PokeApi_Parser_cls) JSON.deserialize(response.getBody(),PokeApi_Parser_cls.class);
                System.debug(pokeWrapper); 
            }
            else{
                System.debug('Error API'); 
            }
        }
        Catch(Exception e){
            System.debug('Error: '+e); 
        }
        return pokeWrapper;
        
    }
}
