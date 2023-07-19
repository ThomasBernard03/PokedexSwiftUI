// See https://aka.ms/new-console-template for more information

using Newtonsoft.Json;
using PokemonGrabber;
using PokemonGrabber.DTOs;

Console.WriteLine("Hello, World!");

var httpClient = new HttpClient();
var pokemonsString = await httpClient.GetStringAsync("https://pokeapi.co/api/v2/pokemon?limit=1000");
        
// Utilisez JsonConvert pour sérialiser la réponse
var serializedResponse = JsonConvert.DeserializeObject<RootDto<NameUrlDto>>(pokemonsString);


var pokemons = new List<Pokemon>();

foreach (var pokemonResults in serializedResponse.results)
{
    var pokemonString = await httpClient.GetStringAsync(pokemonResults.Url);
    var pokemonDetail = JsonConvert.DeserializeObject<PokemonDetailDto>(pokemonString);
    
    var pokemonSpeciesString = await httpClient.GetStringAsync(pokemonDetail.Species.Url);
    var pokemonSpecies = JsonConvert.DeserializeObject<PokemonDetailSpeciesDto>(pokemonSpeciesString);

    var pokemon = new Pokemon()
    {
        Id = pokemonDetail.Id,
        Name = pokemonDetail.Name,
        Weight = (float)pokemonDetail.Weight / 10,
        Height = pokemonDetail.Height * 10,
        Description = pokemonSpecies.flavorTextEntries.FirstOrDefault(x => x.Language.Name == "en").FlavorText.Replace("\n", " ").Replace("\f", " "),
        Types = pokemonDetail.Types.Select(x => x.Type.Name).ToList(),
        Sprites = new PokemonSprite()
        {
            FrontDefaultOfficialArtwork = pokemonDetail.Sprites.Other.OfficialArtwork.FrontDefault,
            FrontShinyOfficialArtwork = pokemonDetail.Sprites.Other.OfficialArtwork.FrontShiny,
            FrontFemaleDreamWorld = pokemonDetail.Sprites.Other.DreamWorld.FrontFemale,
            FrontMaleDreamWorld = pokemonDetail.Sprites.Other.DreamWorld.FrontDefault,
        },
        Stats = pokemonDetail.Stats.Select(x => new PokemonStat()
        {
            Name = x.Stat.Name,
            Value = x.BaseStat
        })
    };
    
    pokemons.Add(pokemon);
}
        
// Écrivez la réponse dans un fichier JSON
await File.WriteAllTextAsync("pokemon.json", JsonConvert.SerializeObject(pokemons));
        
Console.WriteLine("Les données de l'API Pokémon ont été enregistrées dans pokemon.json");