// See https://aka.ms/new-console-template for more information

using Newtonsoft.Json;
using PokemonGrabber;
using PokemonGrabber.DTOs;
using PokemonGrabber.DTOs.Items;
using PokemonGrabber.DTOs.Moves;
using PokemonGrabber.DTOs.Version;


await GetVersionAsync();
//await GetAndSavePokemonsAsync();
//await GetAndSaveItemsAsync();

async Task GetVersionAsync()
{
    Console.WriteLine("Starting...");
    
    var httpClient = new HttpClient();
    var versionString = await httpClient.GetStringAsync("https://pokeapi.co/api/v2/generation/1");
    
    var serializedResponse = JsonConvert.DeserializeObject<VersionDto>(versionString);

    var movesDto = new List<MoveDto>();
    
    foreach (var moveLink in serializedResponse.Moves)
    {
        var moveDto = await GetMoveAsync(url: moveLink.Url);
        movesDto.Add(moveDto);
    }


    var moves = movesDto.Select(m => new Move()
    {
        Id = m.Id,
        Name = m.Name,
        Type = m.Type.Name,
        Description = m.FlavorTextEntries.FirstOrDefault(x => x.Language.Name == "en").FlavorText.Replace("\n", " ").Replace("\f", " "),
        Power = m.Power,
        Accuracy = m.Accuracy,
        PP = m.PP,
        Priority = m.Priority,
        Target = m.Target.Name,
        DamageClass = m.DamageClass.Name
    });
    
    Console.WriteLine("Saving moves...");
    await File.WriteAllTextAsync("moves.json", JsonConvert.SerializeObject(moves));
    Console.WriteLine("Moves saved into moves.json !");
}

async Task<MoveDto> GetMoveAsync(string url)
{
    var httpClient = new HttpClient();
    var moveString = await httpClient.GetStringAsync(url);
    
    var serializedResponse = JsonConvert.DeserializeObject<MoveDto>(moveString);

    return serializedResponse;
}


async Task GetAndSaveItemsAsync()
{
    Console.WriteLine("Starting...");

    var httpClient = new HttpClient();
    var itemsString = await httpClient.GetStringAsync("https://pokeapi.co/api/v2/item?limit=1000");
            
    var serializedResponse = JsonConvert.DeserializeObject<RootDto<LinkDto>>(itemsString);
    
    
    var items = new List<Item>();
    
    foreach (var itemsResult in serializedResponse.results)
    {
        var itemString = await httpClient.GetStringAsync(itemsResult.Url);
        var itemDetail = JsonConvert.DeserializeObject<ItemDetailDto>(itemString);

        var item = new Item()
        {
            Id = itemDetail.Id,
            Name = itemDetail.Name,
            Description = itemDetail.FlavorTextEntries.FirstOrDefault(x => x.Language.Name == "en").Text.Replace("\n", " ").Replace("\f", " "),
            Sprite = itemDetail.Sprites.Default,
            Category = itemDetail.Category.Name,
            Cost = itemDetail.Cost
        };

        if (!string.IsNullOrEmpty(item.Sprite))
            items.Add(item);
    }
    
    await File.WriteAllTextAsync("items.json", JsonConvert.SerializeObject(items));
            
    Console.WriteLine("Les données de l'API Pokémon ont été enregistrées dans item.json");
}


async Task GetAndSavePokemonsAsync()
{
    Console.WriteLine("Starting...");

    var httpClient = new HttpClient();
    var pokemonsString = await httpClient.GetStringAsync("https://pokeapi.co/api/v2/pokemon?limit=151");
            
    // Utilisez JsonConvert pour sérialiser la réponse
    var serializedResponse = JsonConvert.DeserializeObject<RootDto<LinkDto>>(pokemonsString);
    
    
    var pokemons = new List<Pokemon>();
    
    foreach (var pokemonResults in serializedResponse.results)
    {
        var pokemonString = await httpClient.GetStringAsync(pokemonResults.Url);
        var pokemonDetail = JsonConvert.DeserializeObject<PokemonDetailDto>(pokemonString);
        
        var pokemonSpeciesString = await httpClient.GetStringAsync(pokemonDetail.Species.Url);
        var pokemonSpecies = JsonConvert.DeserializeObject<PokemonDetailSpeciesDto>(pokemonSpeciesString);
        
        var pokemonEvolutionChainString = await httpClient.GetStringAsync(pokemonSpecies.EvolutionChain.Url);
        var pokemonEvolutionChain = JsonConvert.DeserializeObject<PokemonEvolutionChainDto>(pokemonEvolutionChainString);
        
        var pokemon = new Pokemon()
        {
            Id = pokemonDetail.Id,
            Name = pokemonDetail.Name,
            Weight = (float)pokemonDetail.Weight / 10,
            Height = pokemonDetail.Height * 10,
            Description = pokemonSpecies.flavorTextEntries.FirstOrDefault(x => x.Language.Name == "en").FlavorText.Replace("\n", " ").Replace("\f", " "),
            Types = pokemonDetail.Types.Select(x => x.Type.Name).ToList(),
            GrowthRate = pokemonSpecies.GrowthRate.Name,
            CaptureRate = pokemonSpecies.CaptureRate,
            BaseHappiness = pokemonSpecies.BaseHappiness,
            Shape = pokemonSpecies.Shape.Name,
            Sprites = new PokemonSprite()
            {
                FrontDefaultOfficialArtwork = pokemonDetail.Sprites.Other.OfficialArtwork.FrontDefault,
                FrontShinyOfficialArtwork = pokemonDetail.Sprites.Other.OfficialArtwork.FrontShiny,
                //FrontFemaleDreamWorld = pokemonDetail.Sprites.Other.DreamWorld.FrontFemale,
                //FrontMaleDreamWorld = pokemonDetail.Sprites.Other.DreamWorld.FrontDefault,
            },
            Stats = pokemonDetail.Stats.Select(x => new PokemonStat()
            {
                Name = x.Stat.Name,
                Value = x.BaseStat
            }),
            Abilities = pokemonDetail.Abilities.Select(x => x.Ability.Name),
            EvolutionChain = ParseEvolutionChain(pokemonEvolutionChain.ChainDto)
        };
        
        pokemons.Add(pokemon);
    }
    
    await File.WriteAllTextAsync("pokemon.json", JsonConvert.SerializeObject(pokemons));
            
    Console.WriteLine("Les données de l'API Pokémon ont été enregistrées dans pokemon.json");
}


PokemonEvolutionChain ParseEvolutionChain(ChainDto dto)
{
    var evolutionChain = new PokemonEvolutionChain()
    {
        PokemonId = int.Parse(
            dto.Species.Url.Replace("https://pokeapi.co/api/v2/pokemon-species/", "").Replace("/", "")),
        Item = dto.EvolutionDetails.FirstOrDefault()?.Item?.Name,
        Level = dto.EvolutionDetails.FirstOrDefault()?.MinLevel
    };

    if (dto.EvolvesTo?.Any() ?? false)
        evolutionChain.EvolutionChain = dto.EvolvesTo?.Select(ParseEvolutionChain);

    return evolutionChain;
}
