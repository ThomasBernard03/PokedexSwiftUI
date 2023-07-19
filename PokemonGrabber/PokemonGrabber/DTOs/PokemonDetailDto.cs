using Newtonsoft.Json;

namespace PokemonGrabber.DTOs;

public class PokemonDetailDto
{
    [JsonProperty("id")]
    public int Id { get; set; }
    
    [JsonProperty("name")]
    public string Name { get; set; }
    
    [JsonProperty("types")]
    public IEnumerable<PokemonDetailTypeDto> Types { get; set; }
    
    [JsonProperty("weight")]
    public int Weight { get; set; }
    
    [JsonProperty("height")]
    public int Height { get; set; }
    
    [JsonProperty("sprites")]
    public PokemonDetailSpriteDto Sprites { get; set; }
    
    [JsonProperty("stats")]
    public IEnumerable<PokemonDetailStatDto> Stats { get; set; }
    
    [JsonProperty("species")]
    public LinkDto Species { get; set; }
    
    [JsonProperty("abilities")]
    public IEnumerable<PokemonDetailAbilitiesDto> Abilities { get; set; }
}

public class PokemonDetailAbilitiesDto
{
    [JsonProperty("ability")]
    public NameUrlDto Ability { get; set; }
}


public class PokemonDetailStatDto
{
    [JsonProperty("base_stat")]
    public int BaseStat { get; set; }
    
    [JsonProperty("stat")]
    public NameUrlDto Stat { get; set; }
}


public class PokemonDetailSpriteDto
{
    [JsonProperty("other")]
    public PokemonDetailSpriteOtherDto Other { get; set; }
}

public class PokemonDetailSpriteOtherDto
{
    [JsonProperty("official-artwork")]
    public PokemonDetailSpriteOtherOfficialArtworkDto OfficialArtwork { get; set; }
    
    [JsonProperty("dream_world")]
    public PokemonDetailSpriteOtherDreamWorldDto DreamWorld { get; set; }
}

public class PokemonDetailSpriteOtherOfficialArtworkDto
{
    [JsonProperty("front_default")]
    public string? FrontDefault { get; set; }
    
    [JsonProperty("front_shiny")]
    public string? FrontShiny { get; set; }
}

public class PokemonDetailSpriteOtherDreamWorldDto
{
    [JsonProperty("front_default")]
    public string? FrontDefault { get; set; }
    
    [JsonProperty("front_female")]
    public string? FrontFemale { get; set; }
}

public class PokemonDetailTypeDto
{
    [JsonProperty("slot")]
    public int Slot { get; set; }
    
    [JsonProperty("type")]
    public LinkDto Type { get; set; }
}
