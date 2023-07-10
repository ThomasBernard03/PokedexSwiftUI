using Newtonsoft.Json;

namespace PokemonGrabber.DTOs;

public class PokemonDetailSpeciesDto
{
    [JsonProperty("flavor_text_entries")]
    public IEnumerable<PokemonDetailSpeciesDetailFlavorTextDto> flavorTextEntries { get; set; } 
}

public class PokemonDetailSpeciesDetailFlavorTextDto
{
    [JsonProperty("flavor_text")]
    public string FlavorText { get; set; } 
    
    [JsonProperty("language")]
    public LinkDto Language { get; set; } 
    
    [JsonProperty("version")]
    public LinkDto Version { get; set; } 
}