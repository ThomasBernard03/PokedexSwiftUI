using Newtonsoft.Json;

namespace PokemonGrabber;

public class Pokemon
{
    [JsonProperty("id")]
    public int Id { get; set; }
    
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("weight")]
    public float Weight { get; set; }
    
    [JsonProperty("height")]
    public int Height { get; set; }
    
    [JsonProperty("description")]
    public string Description { get; set; }
    
    [JsonProperty("growth_rate")]
    public string GrowthRate { get; set; }
    
    [JsonProperty("base_happiness")]
    public int BaseHappiness { get; set; } 
    
    [JsonProperty("shape")]
    public string Shape { get; set; } 
    
    [JsonProperty("capture_rate")]
    public int CaptureRate { get; set; }
    
    [JsonProperty("types")]
    public List<string> Types { get; set; }
    
    [JsonProperty("sprites")]
    public PokemonSprite Sprites { get; set; }
    
    [JsonProperty("stats")]
    public IEnumerable<PokemonStat> Stats { get; set; }
    
    [JsonProperty("abilities")]
    public IEnumerable<string> Abilities { get; set; }
    
    [JsonProperty("evolution_chain")]
    public PokemonEvolutionChain? EvolutionChain { get; set; }
}

public class PokemonStat
{
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("value")]
    public int Value { get; set; }
}

public class PokemonEvolutionChain
{
    [JsonProperty("pokemon_id")]
    public int PokemonId { get; set; }
    
    [JsonProperty("level")]
    public int? Level { get; set; }
    
    [JsonProperty("item")]
    public string? Item { get; set; }
    
    [JsonProperty("evolution_chain")]
    public IEnumerable<PokemonEvolutionChain>? EvolutionChain { get; set; }
}

public class PokemonSprite
{
    [JsonProperty("front_default_official_artwork")]
    public string FrontDefaultOfficialArtwork { get; set; }
    
    [JsonProperty("front_shiny_official_artwork")]
    public string FrontShinyOfficialArtwork { get; set; }
    
    //[JsonProperty("front_male_dream_world")]
    //public string FrontMaleDreamWorld { get; set; }
    //
    //[JsonProperty("front_female_dream_world")]
    //public string FrontFemaleDreamWorld { get; set; }
}