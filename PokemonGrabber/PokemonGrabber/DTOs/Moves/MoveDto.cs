using Newtonsoft.Json;

namespace PokemonGrabber.DTOs.Moves;

public class MoveDto
{
    [JsonProperty("id")]
    public int Id { get; set; }
    
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("type")]
    public LinkDto Type { get; set; }
    
    [JsonProperty("flavor_text_entries")]
    public List<MoveFlavorTextEntryDto> FlavorTextEntries { get; set; }
    
    [JsonProperty("power")]
    public int? Power { get; set; }
    
    [JsonProperty("accuracy")]
    public int? Accuracy { get; set; }
    
    [JsonProperty("pp")]
    public int PP { get; set; }
    
    [JsonProperty("priority")]
    public int Priority { get; set; }
    
    [JsonProperty("target")]
    public LinkDto Target { get; set; }
    
    [JsonProperty("damage_class")]
    public LinkDto DamageClass { get; set; }
}


public class MoveFlavorTextEntryDto
{
    [JsonProperty("language")]
    public LinkDto Language { get; set; }
    
    [JsonProperty("flavor_text")]
    public string FlavorText { get; set; }
}