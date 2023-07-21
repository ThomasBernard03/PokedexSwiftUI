// Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);

using Newtonsoft.Json;
using PokemonGrabber.DTOs;

public class PokemonEvolutionChainDto
{
    [JsonProperty("chain")]
    public ChainDto? ChainDto { get; set; }

    [JsonProperty("id")]
    public int Id { get; set; }
}

public class ChainDto
{
    [JsonProperty("evolution_details")]
    public List<EvolutionDetail> EvolutionDetails { get; set; }

    [JsonProperty("evolves_to")]
    public List<ChainDto>? EvolvesTo { get; set; }

    [JsonProperty("is_baby")]
    public bool IsBaby { get; set; }

    [JsonProperty("species")]
    public LinkDto Species { get; set; }
}

public class EvolutionDetail
{
    [JsonProperty("item")]
    public LinkDto? Item { get; set; }

    [JsonProperty("min_level")]
    public int? MinLevel { get; set; }
}

