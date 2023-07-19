using Newtonsoft.Json;

namespace PokemonGrabber.DTOs.Items;

public class ItemDetailDto
{
    
    [JsonProperty("id")]
    public int Id { get; set; }
    
    [JsonProperty("name")]
    public string Name { get; set; }

    [JsonProperty("category")]
    public LinkDto Category { get; set; }

    [JsonProperty("cost")]
    public int Cost { get; set; }
    
    [JsonProperty("sprites")]
    public ItemDetailSpritesDto Sprites { get; set; }
    
    [JsonProperty("flavor_text_entries")]
    public IEnumerable<ItemDetailFlavorTextEntryDto> FlavorTextEntries { get; set; }

}

public class ItemDetailSpritesDto
{
    [JsonProperty("default")]
    public string Default { get; set; }
}

public class ItemDetailFlavorTextEntryDto
{
    [JsonProperty("language")]
    public LinkDto Language { get; set; }
    
    [JsonProperty("text")]
    public string Text { get; set; }
}