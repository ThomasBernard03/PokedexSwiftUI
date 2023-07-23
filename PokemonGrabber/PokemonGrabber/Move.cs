using Newtonsoft.Json;

namespace PokemonGrabber;

public class Move
{
    [JsonProperty("id")]
    public int Id { get; set; }
    
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("type")]
    public string Type { get; set; }
    
    [JsonProperty("description")]
    public string Description { get; set; }
    
    [JsonProperty("power")]
    public int? Power { get; set; }
    
    [JsonProperty("accuracy")]
    public int? Accuracy { get; set; }
    
    [JsonProperty("pp")]
    public int PP { get; set; }
    
    [JsonProperty("priority")]
    public int Priority { get; set; }
    
    [JsonProperty("damage_class")]
    public string DamageClass { get; set; }
    
    [JsonProperty("target")]
    public string Target { get; set; }
}