using Newtonsoft.Json;

namespace PokemonGrabber.DTOs.Version;

public class VersionDto
{
    [JsonProperty("id")]
    public int Id { get; set; }

    [JsonProperty("main_region")]
    public LinkDto MainRegion { get; set; }

    [JsonProperty("moves")]
    public List<LinkDto> Moves { get; set; }

    [JsonProperty("name")]
    public string Name { get; set; }

    [JsonProperty("pokemon_species")]
    public List<LinkDto> PokemonSpecies { get; set; }

    [JsonProperty("types")]
    public List<LinkDto> Types { get; set; }

    [JsonProperty("version_groups")]
    public List<LinkDto> VersionGroups { get; set; }
}