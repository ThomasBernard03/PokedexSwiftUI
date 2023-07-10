using Newtonsoft.Json;

namespace PokemonGrabber.DTOs;

public class PokemonListDto
{
    [JsonProperty("name")]
    public string name { get; set; }

    [JsonProperty("url")]
    public string url { get; set; }
}