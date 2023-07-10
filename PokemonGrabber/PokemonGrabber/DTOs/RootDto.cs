using Newtonsoft.Json;

namespace PokemonGrabber.DTOs;

public class RootDto<T>
{
    [JsonProperty("count")]
    public int count { get; set; }

    [JsonProperty("next")]
    public string next { get; set; }

    [JsonProperty("previous")]
    public object previous { get; set; }

    [JsonProperty("results")]
    public List<T> results { get; set; }
}