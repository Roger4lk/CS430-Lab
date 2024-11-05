use std::env;
use std::fs;

#[derive(Debug)]
struct Stats {
    characters: usize,
    words: usize,
    lines: usize,
}



fn main() {
    let mut args = env::args();  // returns iterator
    //println!("{:?}", args);
    let filename = args.nth(1).expect("no fil provided"); // same as .unwrap() but it outputs a custom error message
    //println!("{:?}", filename); //returns some because nth method returns option<T> 
    println!("{:?}", count(&filename));
}

fn count(path: &str) -> Stats{
    let text = fs::read_to_string(path).expect("couldnt read file!");
    Stats {
        characters: text.len(),
        words: text.split_whitespace().count(), // returns iterator so must use count()
        lines: text.lines().count(), 
    }
}