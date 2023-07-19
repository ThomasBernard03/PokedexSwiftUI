using Newtonsoft.Json;

namespace PokemonGrabber;

public class Item
{
    [JsonProperty("id")]
    public int Id { get; set; }
    
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("category")]
    public string Category { get; set; }
    
    [JsonProperty("cost")]
    public int Cost { get; set; }
    
    [JsonProperty("sprite")]
    public string Sprite { get; set; }
    
    [JsonProperty("description")]
    public string Description { get; set; }
}