use std::ops::RangeInclusive;

fn main() {

}

fn numbers_to_range(xs: &Vec<i32>) -> RangeInclusive<i32> {
    let max = xs.iter().max().unwrap();
    let min = xs.iter().min().unwrap();

    *min..=*max

}

fn middle_word(word: &str) -> String {
    let words: Iter<&str> = word.split('|').collect();
    let i = words.len() / 2;
    words[i]
}

fn number_lines(text: &str) {
    for (index, line) in text.lines().enumerate() { //enumerate()  gives us indexes 
        println!("{}. {}", index,  line)
    }
}

fn total(ranges: &Vec<RangeInclusive<i32>>) -> i32 {
    let sum = ranges.iter().map(|range| range.end() - range.start() + 1).sum();
    sum
}