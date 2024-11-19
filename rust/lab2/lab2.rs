use std::fs::read_to_string;

#[derive(Debug)]
struct Country {
    name: String,
    capital: String,
    latitude: f64,
    longitude: f64,
    capital_population: i64,
    area: f64,
    population_1960: i64,
    population_2021: i64,
}

fn main() {
    // Read the CSV file into a string
    let data = read_to_string("data.csv").expect("Failed to read file");

    // Parse the data into a vector of Country structs
    let countries: Vec<Country> = data
        .lines()
        .skip(1) // Skip the header row
        .filter_map(|line| {
            let fields: Vec<&str> = line.split(',').collect();
            if fields.len() == 8 {
                Some(Country {
                    name: fields[0].to_string(),
                    capital: fields[1].to_string(),
                    latitude: fields[2].parse().ok()?,
                    longitude: fields[3].parse().ok()?,
                    capital_population: fields[4].parse().ok()?,
                    area: fields[5].parse().ok()?,
                    population_1960: fields[6].parse().ok()?,
                    population_2021: fields[7].parse().ok()?,
                })
            } else {
                None
            }
        })
        .collect();

    // Question 1: Which country has the highest capital population?
    let largest_capital = countries.iter().max_by_key(|c| c.capital_population);
    if let Some(country) = largest_capital {
        println!(
            "The country with the largest capital population is {} ({}) with a population of {}.",
            country.name, country.capital, country.capital_population
        );
    }

    // Question 2: What is the smallest country by area?
    let smallest_country = countries.iter().min_by(|a, b| a.area.partial_cmp(&b.area).unwrap());
    if let Some(country) = smallest_country {
        println!(
            "The smallest country by area is {} with an area of {:.2} square km.",
            country.name, country.area
        );
    }

    // Question 3: Which country had the highest percentage population growth between 1960 and 2021?
    let highest_growth = countries.iter().max_by(|a, b| {
        let growth_a = if a.population_1960 > 0 {
            (a.population_2021 as f64 / a.population_1960 as f64)
        } else {
            0.0
        };
        let growth_b = if b.population_1960 > 0 {
            (b.population_2021 as f64 / b.population_1960 as f64)
        } else {
            0.0
        };
        growth_a.partial_cmp(&growth_b).unwrap()
    });
    
    if let Some(country) = highest_growth {
        if country.population_1960 > 0 {
            let growth = ((country.population_2021 as f64 / country.population_1960 as f64) - 1.0) * 100.0;
            println!(
                "The country with the highest population growth is {} with {:.2}% growth.",
                country.name, growth
            );
        } else {
            println!("Population growth data for {} is invalid (population in 1960 is zero).", country.name);
        }
    }
}
