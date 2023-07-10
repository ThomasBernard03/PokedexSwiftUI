using Newtonsoft.Json;

namespace PokemonGrabber.DTOs;

public class LinkDto
{
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("url")]
    public string Url { get; set; }
}