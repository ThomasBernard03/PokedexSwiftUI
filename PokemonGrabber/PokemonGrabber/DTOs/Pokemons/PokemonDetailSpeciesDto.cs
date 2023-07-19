using Newtonsoft.Json;

namespace PokemonGrabber.DTOs;

public class PokemonDetailSpeciesDto
{
    [JsonProperty("flavor_text_entries")]
    public IEnumerable<PokemonDetailSpeciesDetailFlavorTextDto> flavorTextEntries { get; set; } 
    
    
    [JsonProperty("growth_rate")]
    public LinkDto GrowthRate { get; set; } 
    
    [JsonProperty("capture_rate")]
    public int CaptureRate { get; set; } 
    
    [JsonProperty("base_happiness")]
    public int BaseHappiness { get; set; } 
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